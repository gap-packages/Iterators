#############################################################################
##
#W  UtilitiesForPrimes.gi                                         Stefan Kohl
##
##  This file contains the implementations of some utility functions for
##  prime numbers.
##
#############################################################################

#############################################################################
##
#F  ComputePrimePowers( max_q )
##
InstallGlobalFunction( ComputePrimePowers,

  function ( max_q )

    local  primes, powers, p, q;

    primes := PrimeNumbersIterator(10^6);
    powers := [];
    for p in primes do
      if p > max_q then break; fi;
      q := p;
      repeat
        Add(powers,q);
        q := q * p;
      until q > max_q;
    od;
    powers := Set(powers);
    if IsToBeDefinedObj( COMPUTED_PRIME_POWERS ) then
      InstallValue( COMPUTED_PRIME_POWERS, powers );
    else
      Append(COMPUTED_PRIME_POWERS,
             powers{[Length(COMPUTED_PRIME_POWERS)+1..Length(powers)]});
    fi;
  end );

#############################################################################
##
#F  NextPrimePowerInt( n )
##
InstallGlobalFunction( NextPrimePowerInt,

  function ( n )

    local pos; 

    if not IsToBeDefinedObj( COMPUTED_PRIME_POWERS )
      and n < COMPUTED_PRIME_POWERS[Length(COMPUTED_PRIME_POWERS)]
    then
      pos := PositionSorted(COMPUTED_PRIME_POWERS,n);
      if COMPUTED_PRIME_POWERS[pos] = n then
        return COMPUTED_PRIME_POWERS[pos+1];
      else
        return COMPUTED_PRIME_POWERS[pos];
      fi;
    fi;
    repeat
      n := n + 1;
    until IsPrimePowerInt(n);
    return n;
  end );

#############################################################################
##
#F  PrimePowersIterator(  )
#F  PrimePowersIterator( <finish> )
#F  PrimePowersIterator( <finish>, <chunksize> )
##
InstallGlobalFunction( PrimePowersIterator,

  function ( arg )

    local  state, finish, chunksize, k;

    if Length(arg) > 0 then
      finish := arg[1];
      if Length(arg) > 1 then
        chunksize := arg[2];
      else
        chunksize := Minimum(1000000,finish);
      fi;
    else
      finish    := infinity;
      chunksize := 1000000;
    fi;
    chunksize := Maximum(chunksize,100000);

    state := [[2,PrimeNumbersIterator(chunksize),4],
              [2,4,PrimeNumbersIterator(Int(chunksize/10))],
              [2,8,PrimeNumbersIterator(Int(chunksize/10))]];
    NextIterator(state[1][2]);
    NextIterator(state[2][3]);
    NextIterator(state[3][3]);

    for k in [4..LogInt(Minimum(finish,1000000),2)] do
      state[k] := [2,2^k];
    od;

    return Objectify( NewType( IteratorsFamily,
                               IsIterator
                           and IsMutable
                           and IsPrimePowersIteratorRep ),
                      rec( state  := state,
                           finish := finish ) );
  end );

#############################################################################
##
#M  NextIterator( <iter> ) . . . . . . . . . .  for iterators of prime powers
##
InstallMethod( NextIterator,
               "for iterators of prime powers", true,
               [     IsIterator and IsMutable
                 and IsPrimePowersIteratorRep ], 0,

  function ( iter )

    local  state, finish, p, q, k;

    state  := iter!.state;
    finish := iter!.finish;

    q := state[1][1];
    if q < state[1][3] then
      state[1][1] := NextIterator(state[1][2]);
    else
      q := state[1][3];
      k := First([2..Length(state)],e->state[e][2]=q);
      if k <= 3 then
        state[k][1] := NextIterator(state[k][3]);
        state[k][2] := state[k][1]^k;
      else
        state[k][1] := NextPrimeInt(state[k][1]);
        state[k][2] := state[k][1]^k;
        if k = Length(state) then
          state[k+1] := [2,2^(k+1)];
        fi;
      fi;
      state[1][3] := Minimum(List(state{[2..Length(state)]},t->t[2]));
    fi;

    if q > finish then
      Error("Error, <iter> is exhausted");
      return;
    fi;

    return q;
  end );

#############################################################################
##
#M  IsDoneIterator( <iter> ) . . . . . . . . .  for iterators of prime powers
##
InstallMethod( IsDoneIterator,
               "for iterators of prime powers", true,
               [ IsIterator and IsPrimePowersIteratorRep ], 0,

  function ( iter )

    local  state, finish;

    state  := iter!.state;
    finish := iter!.finish;

    if finish = infinity or state[1][1] <= finish then return false; fi;
    return Minimum(List(state{[2..Length(state)]},t->t[2])) > finish;
  end );

#############################################################################
##
#M  ShallowCopy( <iter> ) . . . . . . . . . . . for iterators of prime powers
##
InstallMethod( ShallowCopy,
               "for iterators of prime powers", true,
               [ IsIterator and IsPrimePowersIteratorRep ], 0,

  iter -> Objectify( Subtype( TypeObj( iter ), IsMutable ),
                     rec( state  := iter!.state,
                          finish := iter!.finish ) ) );

#############################################################################
##
#M  ViewObj( <iter> ) . . . . . . . . . . . . . for iterators of prime powers
##
InstallMethod( ViewObj,
               "for iterators of prime powers", true,
               [ IsIterator and IsPrimePowersIteratorRep ], 0,

  function ( iter )
    Print("<iterator of prime powers>");
  end );

#############################################################################
##
#V  PRIMECOUNT_TMPDIR
##
BindGlobal( "PRIMECOUNT_TMPDIR", DirectoryTemporary(  ) );

#############################################################################
##
#F  PrimeCount( <n> )
##
InstallGlobalFunction( "PrimeCount",

  function ( n )

    local  file, pi;

    if not IsPosInt(n) then
      Error("usage: PrimeCount( <n> ), where <n> is a positive integer");
    fi;

    if n <= 1000 then
      pi := PositionSorted(Primes,n);
      if pi > 168 or Primes[pi] > n then
        pi := pi - 1;
      fi;
      return pi;
    fi;

    file := Filename(PRIMECOUNT_TMPDIR,"primecount.txt");
    Exec("primecount",String(n),Concatenation(" > ",file));
    pi := Int(Filtered(StringFile(file),s->s in DIGITS));
    return pi;

  end );

#############################################################################
##
#F  NthPrime( <n> )
##
InstallGlobalFunction( "NthPrime",

  function ( n )

    local  file, p;

    if not IsPosInt(n) then
      Error("usage: NthPrime( <n> ), where <n> is a positive integer");
    fi;

    if n <= 168 then
      return Primes[n];
    fi;

    file := Filename(PRIMECOUNT_TMPDIR,"nthprime.txt");
    Exec("primecount","-n",String(n),Concatenation(" > ",file));
    p := Int(Filtered(StringFile(file),s->s in DIGITS));
    return p;

  end );

#############################################################################
##
#E  UtilitiesForPrimes.gi . . . . . . . . . . . . . . . . . . . . . ends here
