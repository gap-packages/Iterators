#############################################################################
##
#W  SimpleGroupsSizesIterator.gi                                  Stefan Kohl
##
##  This file contains an implementation of iterators of orders of finite
##  simple groups.
##
#############################################################################

#############################################################################
##
#F  SimpleGroupsSizesInfo . . . . . set info level of `InfoSimpleGroupsSizes'
##
InstallGlobalFunction( SimpleGroupsSizesInfo,

  function ( n )
    SetInfoLevel( InfoSimpleGroupsSizes, n );
  end );

#############################################################################
##
#F  SizeAlt( n )
##
InstallGlobalFunction( "SizeAlt", n -> Factorial(n) / 2 );

#############################################################################
##
#F  SizeA( n, q )
#F  Size2A( n, q )
#F  SizeB( n, q )
#F  Size2B2( q )
#F  SizeC( n, q )
#F  SizeD( n, q )
#F  Size2D( n, q )
#F  Size3D4( q )
#F  SizeG2( q )
#F  Size2G2( q )
#F  SizeF4( q )
#F  Size2F4( q )
#F  SizeE6( q )
#F  Size2E6( q )
#F  SizeE7( q )
#F  SizeE8( q )
##
InstallGlobalFunction( "SizeA",

  function ( arg )

    local  n, q, d;

    n := arg[1]; q := arg[2];
    if Length(arg) > 2 then d := arg[3]; else d := Gcd(n + 1,q - 1); fi;
    return (q^(n*(n+1)/2) * Product(List([1..n],i->q^(i+1)-1)))/d;
  end );

InstallGlobalFunction( "Size2A",

  function ( arg )

    local  n, q, d;

    n := arg[1]; q := arg[2];
    if Length(arg) > 2 then d := arg[3]; else d := Gcd(n + 1,q + 1); fi;
    return (q^(n*(n+1)/2) * Product(List([1..n],i->q^(i+1)-(-1)^(i+1))))/d;
  end );

InstallGlobalFunction( "SizeB",

  function ( arg )

    local  n, q, d;

    n := arg[1]; q := arg[2];
    if Length(arg) > 2 then d := arg[3]; else d := Gcd(2,q - 1); fi;
    return (q^(n^2) * Product(List([1..n],i->q^(2*i)-1)))/d;
  end );

InstallGlobalFunction( "Size2B2", q -> q^2 * (q^2 + 1) * (q - 1) );

InstallGlobalFunction( "SizeC",

  function ( arg )

    local  n, q, d;

    n := arg[1]; q := arg[2];
    if Length(arg) > 2 then d := arg[3]; else d := Gcd(2,q - 1); fi;
    return q^(n^2) * Product(List([1..n],i->q^(2*i)-1))/d;
  end );

InstallGlobalFunction( "SizeD",

  function ( arg )

    local  n, q, d;

    n := arg[1]; q := arg[2];
    if Length(arg) > 2 then d := arg[3]; else d := Gcd(4,q^n - 1); fi;
    return (q^(n*(n-1)) * (q^n - 1)
          * Product(List([1..n-1],i->q^(2*i)-1)))/d;
  end );

InstallGlobalFunction( "Size2D",

  function ( arg )

    local  n, q, d;

    n := arg[1]; q := arg[2];
    if Length(arg) > 2 then d := arg[3]; else d := Gcd(4,q^n + 1); fi;
    return (q^(n*(n-1)) * (q^n + 1)
          * Product(List([1..n-1],i->q^(2*i)-1)))/d;
  end );

InstallGlobalFunction( "Size3D4",
  q -> q^12 * (q^8 + q^4 + 1) * (q^6 - 1) * (q^2 - 1) );

InstallGlobalFunction( "SizeG2", q -> q^6 * (q^6 - 1) * (q^2 - 1) );

InstallGlobalFunction( "Size2G2", q -> q^3 * (q^3 + 1) * (q - 1) );

InstallGlobalFunction( "SizeF4",
  q -> q^24 * (q^12 - 1) * (q^8 - 1) * (q^6 - 1) * (q^2 - 1) );

InstallGlobalFunction( "Size2F4",
  q ->  q^12 * (q^6 + 1) * (q^4 - 1) * (q^3 + 1) * (q - 1) );

InstallGlobalFunction( "SizeE6",

  function ( arg )

    local  q, d;

    q := arg[1];
    if Length(arg) > 1 then d := arg[2]; else d := Gcd(3,q - 1); fi;
    return (q^36*(q^12-1)*(q^9-1)*(q^8-1)*(q^6-1)*(q^5-1)*(q^2-1))/d;
  end );

InstallGlobalFunction( "Size2E6",

  function ( arg )

    local  q, d;

    q := arg[1];
    if Length(arg) > 1 then d := arg[2]; else d := Gcd(3,q + 1); fi;
    return q^36*(q^12-1)*(q^9+1)*(q^8-1)*(q^6-1)*(q^5+1)*(q^2-1)/d;
  end );

InstallGlobalFunction( "SizeE7",

  function ( arg )

    local  q, d;

    q := arg[1];
    if Length(arg) > 1 then d := arg[2]; else d := Gcd(2,q - 1); fi;
    return (q^63*(q^18-1)*(q^14-1)*(q^12-1)
                *(q^10-1)*(q^8-1)*(q^6-1)*(q^2-1))/d;
  end );

InstallGlobalFunction( "SizeE8",

  function ( q )
    return q^120*(q^30-1)*(q^24-1)*(q^20-1)*(q^18-1)
                *(q^14-1)*(q^12-1)*(q^8-1)*(q^2-1);
  end );

#############################################################################
##
#V  SizeSpor
##
InstallValue( SizeSpor,
  [
    [ "M11", 7920 ],
    [ "M12", 95040 ],
    [ "J_1", 175560 ],
    [ "M22", 443520 ],
    [ "J_2", 604800 ],
    [ "M23", 10200960 ],
    [ "2F(4,2)'", 17971200 ],
    [ "HS", 44352000 ],
    [ "J_3", 50232960 ],
    [ "M24", 244823040 ],
    [ "McL", 898128000 ],
    [ "He", 4030387200 ],
    [ "Ru", 145926144000 ],
    [ "Suz", 448345497600 ],
    [ "ON", 460815505920 ],
    [ "Co_3", 495766656000 ],
    [ "Co_2", 42305421312000 ],
    [ "Fi22", 64561751654400 ],
    [ "HN", 273030912000000 ],
    [ "Ly", 51765179004000000 ],
    [ "Th", 90745943887872000 ],
    [ "Fi23", 4089470473293004800 ],
    [ "Co_1", 4157776806543360000 ],
    [ "J_4", 86775571046077562880 ],
    [ "Fi24'", 1255205709190661721292800 ],
    [ "B", 4154781481226426191177580544000000 ],
    [ "M", 808017424794512875886459904961710757005754368000000000 ]
  ] );

#############################################################################
##
#F  SimpleGroupsSizesIterator(  )
#F  SimpleGroupsSizesIterator( <start> )
#F  SimpleGroupsSizesIterator( <start>, <finish> )
##
InstallGlobalFunction( SimpleGroupsSizesIterator,

  function ( arg )

    local  BiggestnForWhichValueIsLessThan, Admissible_nd, Nonadmissible_d,
           state, start, finish, nopsl2, givenames,
           n, n_max, q, q_bound, ds, d, iters;

    BiggestnForWhichValueIsLessThan := function ( f, threshold )

      local  n, k, pow;

      n := 1;
      k := 0;
      while f(2*n) < threshold do
        n   := 2*n;
        k   := k + 1;
      od;
      pow := n;
      while pow >= 2 do
        pow := pow/2;
        if f(n+pow) < threshold then
          n := n + pow;
        fi;
      od;
      return n;
    end;

    Admissible_nd := function ( n, d, sign )

      local  target_residues, solution_residues;

      target_residues   := Filtered([0..n],r->Gcd(r,n+1)=d);
      solution_residues := Filtered([0..Phi(n+1)],
                                    r->2^r mod (n+1)
                                       in (target_residues-sign) mod (n+1));
      return solution_residues;
    end;

    Nonadmissible_d := function ( n, sign )
      if n mod 2 = 0 then return []; fi;
      return Filtered(DivisorsInt(n+1),
                      d->d mod 2 = 1 and Admissible_nd(n,d,sign)=[]);
    end;

    if   Length(arg) = 0 then
      start  := 1;
      finish := infinity;
    elif Length(arg) = 1 then
      start  := arg[1];
      finish := infinity;
    elif Length(arg) = 2 then
      start  := arg[1];
      finish := arg[2];
    else
      Error("Usage: SimpleGroupsSizesIterator([ <start> [, <finish> ]])");
    fi;
    nopsl2    := ValueOption("NOPSL2") = true or ValueOption("nopsl2") = true;
    givenames := ValueOption("NAMES")  = true or ValueOption("names")  = true;

    state := [];

    if not nopsl2 then
      if finish < infinity then
        q_bound := BiggestnForWhichValueIsLessThan(q->SizeA(1,q,2),finish);
      else
        q_bound := 10^7;
      fi;
    else
      if finish < infinity then
        q_bound := BiggestnForWhichValueIsLessThan(q->SizeA(2,q,3),finish);
      else
        q_bound := 10^7;
      fi;
      iters := [fail,fail];
    fi;
    if IsToBeDefinedObj(COMPUTED_PRIME_POWERS)
       or COMPUTED_PRIME_POWERS[Length(COMPUTED_PRIME_POWERS)] < q_bound-1000
    then
      ComputePrimePowers( q_bound );
    fi;
     
    n := BiggestnForWhichValueIsLessThan(SizeAlt,start) + 1;
    if n < 5 then n := 5; fi;
    state[1] := [n,SizeAlt(n)];

    state[2] := [];
    n_max := BiggestnForWhichValueIsLessThan(n->SizeA(n,2),start)+2;
    for n in [1..n_max] do
      if n = 1 and nopsl2 then state[2][n] := []; continue; fi;
      if start = 1 and n = 1 and finish > 10^15 then
        iters := List([1..2],i->PrimePowersIterator());
        repeat q := NextIterator(iters[1]); until q = 8;
        repeat q := NextIterator(iters[2]); until q = 11;
        state[2][1] := [[1,8,504,iters[1]],[2,11,660,iters[2]]];
      elif start = 1 and n = 2 and finish > 10^30 then
        Append(iters,List([1..4],i->PrimePowersIterator()));
        repeat q := NextIterator(iters[3]); until q = 2;
        repeat q := NextIterator(iters[4]); until q = 4;
        state[2][2] := [[1,2,168,iters[3]],[3,4,20160,iters[4]]];
      else
        ds := Difference(DivisorsInt(n+1),Nonadmissible_d(n,-1));
        state[2][n] := [];
        for d in ds do
          q := BiggestnForWhichValueIsLessThan(q->SizeA(n,q,d),start);
          if n = 1 and d = 1 and q > 60 then
            q := 2^(LogInt(q,2)+1);
          else
            repeat
              q := NextPrimePowerInt(q);
            until Gcd(n + 1,q - 1) = d and not (n = 1 and q <= 7)
                  and not (n = 1 and q = 9) and not (n = 3 and q = 2);
          fi;
          Add(state[2][n],[d,q,SizeA(n,q)]);
        od;
      fi;
    od;    

    state[3] := [[]];
    n_max := BiggestnForWhichValueIsLessThan(n->Size2A(n,2),start)+2;
    if n_max <= 2 then n_max := 3; fi;
    for n in [2..n_max] do
      if start = 1 and n = 2 and finish > 10^30 then
        repeat q := NextIterator(iters[5]); until q = 3;
        repeat q := NextIterator(iters[6]); until q = 5;
        state[3][2] := [[1,3,6048,iters[5]],[3,5,126000,iters[6]]];
      else
        ds := Difference(DivisorsInt(n+1),Nonadmissible_d(n,1));
        state[3][n] := [];
        for d in ds do
          q := BiggestnForWhichValueIsLessThan(q->Size2A(n,q,d),start);
          repeat
            q := NextPrimePowerInt(q);
          until Gcd(n + 1,q + 1) = d and not (n = 2 and q = 2);
          Add(state[3][n],[d,q,Size2A(n,q)]);
        od;
      fi;
    od;    

    state[4] := [[]];
    n_max := BiggestnForWhichValueIsLessThan(n->SizeB(n,2),start)+2;
    if n_max <= 2 then n_max := 3; fi;
    for n in [2..n_max] do
      state[4][n] := [];
      q := BiggestnForWhichValueIsLessThan(q->SizeB(n,q,1),start);
      q := 2^(LogInt(q,2)+1);
      if n = 2 and q = 2 then q := 4; fi;
      Add(state[4][n],[1,q,SizeB(n,q)]);
      q := BiggestnForWhichValueIsLessThan(q->SizeB(n,q,2),start);
      repeat
        q := NextPrimePowerInt(q);
      until q mod 2 = 1 and not (n = 2 and q = 3);
      Add(state[4][n],[2,q,SizeB(n,q)]);
    od;    

    q := 8;
    while Size2B2(q) < start do q := q * 4; od;
    state[5] := [q,Size2B2(q)];

    state[6] := [[],[]];
    n_max := BiggestnForWhichValueIsLessThan(n->SizeC(n,2),start)+2;
    if n_max <= 3 then n_max := 4; fi;
    for n in [3..n_max] do
      state[6][n] := [];
      # In characteristic 2, the groups are isomorphic to B(n,q) -- so skip:
      # q := BiggestnForWhichValueIsLessThan(q->SizeC(n,q,1),start);
      # q := 2^(LogInt(q,2)+1);
      # if n = 3 and q = 2 then q := 4; fi;
      # Add(state[6][n],[1,q,SizeC(n,q)]);
      q := BiggestnForWhichValueIsLessThan(q->SizeC(n,q,2),start);
      repeat
        q := NextPrimePowerInt(q);
      until q mod 2 = 1;
      Add(state[6][n],[2,q,SizeC(n,q)]);
    od;    

    state[7] := [[],[],[]];
    n_max := BiggestnForWhichValueIsLessThan(n->SizeD(n,2),start)+2;
    if n_max <= 4 then n_max := 5; fi;
    for n in [4..n_max] do
      ds := DivisorsInt(4);
      if n mod 2 = 0 then ds := Difference(ds,[2]); fi;
      state[7][n] := [];
      for d in ds do
        q := BiggestnForWhichValueIsLessThan(q->SizeD(n,q,d),start);
        repeat
          q := NextPrimePowerInt(q);
        until Gcd(4,q^n - 1) = d;
        Add(state[7][n],[d,q,SizeD(n,q)]);
      od;
    od;    

    state[8] := [[],[],[]];
    n_max := BiggestnForWhichValueIsLessThan(n->Size2D(n,2),start)+2;
    if n_max <= 4 then n_max := 5; fi;
    for n in [4..n_max] do
      ds := DivisorsInt(4);
      if n mod 2 = 0 then ds := Difference(ds,[4]); fi;
      state[8][n] := [];
      for d in ds do
        q := BiggestnForWhichValueIsLessThan(q->Size2D(n,q,d),start);
        repeat
          q := NextPrimePowerInt(q);
        until Gcd(4,q^n + 1) = d;
        Add(state[8][n],[d,q,Size2D(n,q)]);
      od;
    od;

    q := NextPrimePowerInt(BiggestnForWhichValueIsLessThan(Size3D4,start));
    state[9] := [q,Size3D4(q)];

    q := NextPrimePowerInt(BiggestnForWhichValueIsLessThan(SizeG2,start));
    if q = 2 then q := 3; fi;
    state[10] := [q,SizeG2(q)];

    q := 27;
    while Size2G2(q) < start do q := q * 9; od;
    state[11] := [q,Size2G2(q)];

    q := NextPrimePowerInt(BiggestnForWhichValueIsLessThan(SizeF4,start));
    state[12] := [q,SizeF4(q)];

    q := 8;
    while Size2F4(q) < start do q := q * 4; od;
    state[13] := [q,Size2F4(q)];

    state[14] := [];
    q := BiggestnForWhichValueIsLessThan(q->SizeE6(q,1),start);
    repeat
      q := NextPrimePowerInt(q);
    until Gcd(3,q - 1) = 1;
    Add(state[14],[1,q,SizeE6(q)]);
    q := BiggestnForWhichValueIsLessThan(q->SizeE6(q,3),start);
    repeat
      q := NextPrimePowerInt(q);
    until Gcd(3,q - 1) = 3;
    Add(state[14],[3,q,SizeE6(q)]);

    state[15] := [];
    q := BiggestnForWhichValueIsLessThan(q->Size2E6(q,1),start);
    repeat
      q := NextPrimePowerInt(q);
    until Gcd(3,q + 1) = 1;
    Add(state[15],[1,q,Size2E6(q)]);
    q := BiggestnForWhichValueIsLessThan(q->Size2E6(q,3),start);
    repeat
      q := NextPrimePowerInt(q);
    until Gcd(3,q + 1) = 3;
    Add(state[15],[3,q,Size2E6(q)]);

    state[16] := [];
    q := BiggestnForWhichValueIsLessThan(q->SizeE7(q,1),start);
    repeat
      q := NextPrimePowerInt(q);
    until Gcd(2,q - 1) = 1;
    Add(state[16],[1,q,SizeE7(q)]);
    q := BiggestnForWhichValueIsLessThan(q->SizeE7(q,2),start);
    repeat
      q := NextPrimePowerInt(q);
    until Gcd(2,q - 1) = 2;
    Add(state[16],[2,q,SizeE7(q)]);

    q := NextPrimePowerInt(BiggestnForWhichValueIsLessThan(SizeE8,start));
    state[17] := [q,SizeE8(q)];

    n := First([1..Length(SizeSpor)],i->SizeSpor[i][2] > start);
    if n = fail then
      state[18] := [fail,[fail,infinity]];
    else
      state[18] := [n,SizeSpor[n]];
    fi;

    return Objectify( NewType( IteratorsFamily,
                               IsIterator
                           and IsMutable
                           and IsSimpleGroupsSizesIteratorRep ),
                      rec( state     := state,
                           finish    := finish,
                           nopsl2    := nopsl2,
                           givenames := givenames ) );
  end );

#############################################################################
##
#M  NextIterator( <iter> ) . . . . . for iterators of orders of simple groups
##
InstallMethod( NextIterator,
               "for iterators of orders of simple groups", true,
               [     IsIterator and IsMutable
                 and IsSimpleGroupsSizesIteratorRep ], 0,

  function ( iter )

    local  Admissible_nd, Nonadmissible_d,
           state, finish, nopsl2, givenames,
           min_size, mintype, typenames, parameters, name,
           type, min_n, min_i, min_q, min_d,
           n, q, ds, d, i;

    Admissible_nd := function ( n, d, sign )

      local  target_residues, solution_residues;

      target_residues   := Filtered([0..n],r->Gcd(r,n+1)=d);
      solution_residues := Filtered([0..Phi(n+1)],
                                    r->2^r mod (n+1)
                                       in (target_residues-sign) mod (n+1));
      return solution_residues;
    end;

    Nonadmissible_d := function ( n, sign )
      if n mod 2 = 0 then return []; fi;
      return Filtered(DivisorsInt(n+1),
                      d->d mod 2 = 1 and Admissible_nd(n,d,sign)=[]);
    end;

    state     := iter!.state;
    finish    := iter!.finish;
    nopsl2    := iter!.nopsl2;
    givenames := iter!.givenames;

    min_size := infinity;

    if state[1][2] < min_size then
      mintype  := 1;
      min_n    := state[1][1];
      min_size := state[1][2];
    fi; 

    for type in [2,3,4,6,7,8] do
      for n in [1..Length(state[type])] do
        if nopsl2 and type = 2 and n = 1 then continue; fi;
        for i in [1..Length(state[type][n])] do
          if state[type][n][i][3] < min_size then
            mintype  := type;
            min_n    := n;
            min_i    := i;
            min_d    := state[type][n][i][1];
            min_q    := state[type][n][i][2];
            min_size := state[type][n][i][3];
          fi;
        od;
      od;
    od;

    for type in [5,9,10,11,12,13,17] do
      if state[type][2] < min_size then
        mintype  := type;
        min_q    := state[type][1];
        min_size := state[type][2];
      fi; 
    od;

    for type in [14,15,16] do
      for i in [1..2] do
        if state[type][i][3] < min_size then
          mintype  := type;
          min_i    := i;
          min_d    := state[type][i][1];
          min_q    := state[type][i][2];
          min_size := state[type][i][3];
        fi;
      od;
    od;

    if state[18][2][2] < min_size then
      mintype  := 18;
      min_n    := state[18][1];
      min_size := state[18][2][2];
    fi; 

    if   mintype = 1 then
      state[1][1] := state[1][1] + 1;
      state[1][2] := SizeAlt(state[1][1]);
      if givenames then
        parameters := [min_n];
        name := Concatenation("A",String(min_n));
      fi;
    elif mintype = 2 then
      q := min_q;
      if min_n = 1 and q mod 2 = 0 then q := q * 2; else
        repeat
          if IsBound(state[2][min_n][min_i][4]) then
            q := NextIterator(state[2][min_n][min_i][4]);
          else
            q := NextPrimePowerInt(q);
          fi;
        until Gcd(min_n + 1,q - 1) = min_d
              and not (min_n = 1 and q = 9) and not (n = 3 and q = 2);
      fi;
      state[2][min_n][min_i][2] := q;
      state[2][min_n][min_i][3] := SizeA(min_n,q);
      if min_n = Length(state[2]) then
        n := min_n + 1;
        state[2][n] := [];
        ds := Difference(DivisorsInt(n+1),Nonadmissible_d(n,-1));
        for d in ds do
          q := 1;
          repeat
            q := NextPrimePowerInt(q);
          until Gcd(n + 1,q - 1) = d;
          Add(state[2][n],[d,q,SizeA(n,q)]);
        od;
      fi;
      if givenames then
        parameters := [min_n,min_q];
        name := Concatenation("PSL(",String(min_n+1),",",String(min_q),")");
      fi;
    elif mintype = 3 then
      q := min_q;
      repeat
        if IsBound(state[3][min_n][min_i][4]) then
          q := NextIterator(state[3][min_n][min_i][4]);
        else
          q := NextPrimePowerInt(q);
        fi;
      until Gcd(min_n + 1,q + 1) = min_d;
      state[3][min_n][min_i][2] := q;
      state[3][min_n][min_i][3] := Size2A(min_n,q);
      if min_n = Length(state[3]) then
        n := min_n + 1;
        state[3][n] := [];
        ds := Difference(DivisorsInt(n+1),Nonadmissible_d(n,1));
        for d in ds do
          q := 1;
          repeat
            q := NextPrimePowerInt(q);
          until Gcd(n + 1,q + 1) = d;
          Add(state[3][n],[d,q,Size2A(n,q)]);
        od;
      fi;
      if givenames then
        parameters := [min_n,min_q];
        name := Concatenation("PSU(",String(min_n+1),",",String(min_q),")");
      fi;
    elif mintype = 4 then
      q := min_q;
      repeat
        q := NextPrimePowerInt(q);
      until Gcd(2,q - 1) = min_d and not (n = 2 and q = 3);
      state[4][min_n][min_i][2] := q;
      state[4][min_n][min_i][3] := SizeB(min_n,q);
      if min_n = Length(state[4]) then
        n := min_n + 1;
        state[4][n] := [];
        ds := DivisorsInt(2);
        for d in ds do
          q := 1;
          repeat
            q := NextPrimePowerInt(q);
          until Gcd(2,q - 1) = d;
          Add(state[4][n],[d,q,SizeB(n,q)]);
        od;
      fi;
      if givenames then
        parameters := [min_n,min_q];
        name := Concatenation("O(",String(2*min_n+1),",",String(min_q),")");
      fi;
    elif mintype = 5 then
      state[5][1] := 4 * min_q;
      state[5][2] := Size2B2(4 * min_q);
      if givenames then
        parameters := [min_q];
        name := Concatenation("Sz(",String(min_q),")");
      fi;
    elif mintype = 6 then
      q := min_q;
      repeat
        q := NextPrimePowerInt(q);
      until Gcd(2,q - 1) = min_d and not (n = 3 and q = 2);
      state[6][min_n][min_i][2] := q;
      state[6][min_n][min_i][3] := SizeC(min_n,q);
      if min_n = Length(state[6]) then
        n := min_n + 1;
        state[6][n] := [];
        d := 2; q := 1;
        repeat
          q := NextPrimePowerInt(q);
        until Gcd(2,q - 1) = d;
        Add(state[6][n],[d,q,SizeC(n,q)]);
      fi;
      if givenames then
        parameters := [min_n,min_q];
        name := Concatenation("PSp(",String(2*min_n),",",String(min_q),")");
      fi;
    elif mintype = 7 then
      q := min_q;
      repeat
        q := NextPrimePowerInt(q);
      until Gcd(4,q^min_n - 1) = min_d;
      state[7][min_n][min_i][2] := q;
      state[7][min_n][min_i][3] := SizeD(min_n,q);
      if min_n = Length(state[7]) then
        n := min_n + 1;
        state[7][n] := [];
        ds := DivisorsInt(4);
        if n mod 2 = 0 then ds := Difference(ds,[2]); fi;
        for d in ds do
          q := 1;
          repeat
            q := NextPrimePowerInt(q);
          until Gcd(4,q^n - 1)  = d;
          Add(state[7][n],[d,q,SizeD(n,q)]);
        od;
      fi;
      if givenames then
        parameters := [min_n,min_q];
        name := Concatenation("O+(",String(2*min_n),",",String(min_q),")");
      fi;
    elif mintype = 8 then
      q := min_q;
      repeat
        q := NextPrimePowerInt(q);
      until Gcd(4,q^min_n + 1) = min_d;
      state[8][min_n][min_i][2] := q;
      state[8][min_n][min_i][3] := Size2D(min_n,q);
      if min_n = Length(state[8]) then
        n := min_n + 1;
        state[8][n] := [];
        ds := DivisorsInt(4);
        if n mod 2 = 0 then ds := Difference(ds,[4]); fi;
        for d in ds do
          q := 1;
          repeat
            q := NextPrimePowerInt(q);
          until Gcd(4,q^n + 1)  = d;
          Add(state[8][n],[d,q,Size2D(n,q)]);
        od;
      fi;
      if givenames then
        parameters := [min_n,min_q];
        name := Concatenation("O-(",String(2*min_n),",",String(min_q),")");
      fi;
    elif mintype = 9 then
      q := min_q;
      q := NextPrimePowerInt(q);
      state[9][1] := q;
      state[9][2] := Size3D4(q);
      if givenames then
        parameters := [min_q];
        name := Concatenation("3D(4,",String(min_q),")");
      fi;
    elif mintype = 10 then
      q := min_q;
      q := NextPrimePowerInt(q);
      state[10][1] := q;
      state[10][2] := SizeG2(q);
      if givenames then
        parameters := [min_q];
        name := Concatenation("G(2,",String(min_q),")");
      fi;
    elif mintype = 11 then
      state[11][1] := 9 * min_q;
      state[11][2] := Size2G2(9 * min_q);
      if givenames then
        parameters := [min_q];
        name := Concatenation("Ree(",String(min_q),")");
      fi;
    elif mintype = 12 then
      q := min_q;
      q := NextPrimePowerInt(q);
      state[12][1] := q;
      state[12][2] := SizeF4(q);
      if givenames then
        parameters := [min_q];
        name := Concatenation("F4(",String(min_q),")");
      fi;
    elif mintype = 13 then
      state[13][1] := 4 * min_q;
      state[13][2] := Size2F4(4 * min_q);
      if givenames then
        parameters := [min_q];
        name := Concatenation("2F4(",String(min_q),")");
      fi;
    elif mintype = 14 then
      q := min_q;
      repeat
        q := NextPrimePowerInt(q);
      until Gcd(3,q - 1) = min_d;
      state[14][min_i][2] := q;
      state[14][min_i][3] := SizeE6(q);
      if givenames then
        parameters := [min_q];
        name := Concatenation("E6(",String(min_q),")");
      fi;
    elif mintype = 15 then
      q := min_q;
      repeat
        q := NextPrimePowerInt(q);
      until Gcd(3,q + 1) = min_d;
      state[15][min_i][2] := q;
      state[15][min_i][3] := Size2E6(q);
      if givenames then
        parameters := [min_q];
        name := Concatenation("2E6(",String(min_q),")");
      fi;
    elif mintype = 16 then
      q := min_q;
      repeat
        q := NextPrimePowerInt(q);
      until Gcd(2,q - 1) = min_d;
      state[16][min_i][2] := q;
      state[16][min_i][3] := SizeE7(q);
      if givenames then
        parameters := [min_q];
        name := Concatenation("E7(",String(min_q),")");
      fi;
    elif mintype = 17 then
      q := min_q;
      q := NextPrimePowerInt(q);
      state[17][1] := q;
      state[17][2] := SizeE8(q);
      if givenames then
        parameters := [min_q];
        name := Concatenation("E8(",String(min_q),")");
      fi;
    elif mintype = 18 then
      if min_n < Length(SizeSpor) then
        state[18][1] := min_n + 1;
        state[18][2] := SizeSpor[min_n + 1];
      else
        state[18][1] := Length(SizeSpor) + 1;
        state[18][2] := [ "---", infinity ];
      fi;
      if givenames then
        parameters := [min_n];
        name := SizeSpor[min_n][1];
      fi;
    fi;

    if min_size > finish then
      Error("Error, <iter> is exhausted");
      return;
    fi;

    if givenames then
      typenames := [ "Alt", "A",  "2A",  "B",  "2B2", "C", 
                     "D",   "2D", "3D4", "G2", "2G2", "F4", 
                     "2F4", "E6", "2E6", "E7", "E8",  "Spor" ];
      return [ min_size, typenames[ mintype ], parameters, name ];
    else
      return min_size;
    fi;
  end );

#############################################################################
##
#M  IsDoneIterator( <iter> ) . . . . for iterators of orders of simple groups
##
InstallMethod( IsDoneIterator,
               "for iterators of orders of simple groups", true,
               [ IsIterator and IsSimpleGroupsSizesIteratorRep ], 0,

  function ( iter )

    local  state, finish, nopsl2, type, min_size, n, i;

    if iter!.finish = infinity then return false; fi;

    state  := iter!.state;
    finish := iter!.finish;
    nopsl2 := iter!.nopsl2;

    min_size := infinity;

    if state[1][2] < min_size then
      min_size := state[1][2];
    fi;

    for type in [2,3,4,6,7,8] do
      for n in [1..Length(state[type])] do
        if nopsl2 and type = 2 and n = 1 then continue; fi;
        for i in [1..Length(state[type][n])] do
          if state[type][n][i][3] < min_size then
            min_size := state[type][n][i][3];
          fi;
        od;
      od;
    od;

    for type in [5,9,10,11,12,13,17] do
      if state[type][2] < min_size then
        min_size := state[type][2];
      fi; 
    od;

    for type in [14,15,16] do
      for i in [1..2] do
        if state[type][i][3] < min_size then
          min_size := state[type][i][3];
        fi;
      od;
    od;

    if state[18][2][2] < min_size then
      min_size := state[18][2][2];
    fi; 

    return min_size > finish;
  end );

#############################################################################
##
#M  ShallowCopy( <iter> ) . . . . .  for iterators of orders of simple groups
##
InstallMethod( ShallowCopy,
               "for iterators of orders of simple groups", true,
               [ IsIterator and IsSimpleGroupsSizesIteratorRep ], 0,

  iter -> Objectify( Subtype( TypeObj( iter ), IsMutable ),
                     rec( state     := iter!.state,
                          finish    := iter!.finish,
                          nopsl2    := iter!.nopsl2,
                          givenames := iter!.givenames ) ) );

#############################################################################
##
#M  ViewObj( <iter> ) . . . . . . .  for iterators of orders of simple groups
##
InstallMethod( ViewObj,
               "for iterators of orders of simple groups", true,
               [ IsIterator and IsSimpleGroupsSizesIteratorRep ], 0,

  function ( iter )
    Print("<iterator of orders of simple groups>");
  end );

#############################################################################
##
#F  NumberOfSimpleGroupsOfSizeAtMost( <n> )
##
InstallGlobalFunction( NumberOfSimpleGroupsOfSizeAtMost,

  function ( n )

    local  BiggestnForWhichValueIsLessThan,
           nonpsl2, purepsl2_odd, purepsl2_even, total, typenames, iter,
           counts, G, qmax, roots, pi, smallsizes, nextinfo, pos, r;

    BiggestnForWhichValueIsLessThan := function ( f, threshold )

      local  n, k, pow;

      n := 1;
      k := 0;
      while f(2*n) < threshold do
        n   := 2*n;
        k   := k + 1;
      od;
      pow := n;
      while pow >= 2 do
        pow := pow/2;
        if f(n+pow) < threshold then
          n := n + pow;
        fi;
      od;
      return n;
    end;

    smallsizes := [ 60, 168, 360, 504, 660, 1092, 2448, 2520, 3420, 4080,
                    5616, 6048, 6072, 7800, 7920, 9828, 12180, 14880, 20160,
                    20160, 25308, 25920, 29120, 32736, 34440, 39732, 51888,
                    58800, 62400, 74412, 95040, 102660, 113460, 126000, 
                    150348, 175560, 178920, 181440, 194472, 246480, 262080,
                    265680, 285852, 352440, 372000, 443520, 456288, 515100,
                    546312, 604800, 612468, 647460, 721392, 885720, 976500,
                    979200 ];
    if n <= 10^6 then
      pos := PositionSorted(smallsizes,n);
      if pos > 56 or smallsizes[pos] > n then pos := pos - 1; fi;
      if pos = 19 then pos := 20; fi;
      return pos;
    fi;

    typenames := [ "Alt", "A",  "2A",  "B",  "2B2", "C", 
                   "D",   "2D", "3D4", "G2", "2G2", "F4", 
                   "2F4", "E6", "2E6", "E7", "E8",  "Spor" ];
    counts := List( typenames, name -> [ name, 0 ] );
    iter := SimpleGroupsSizesIterator(1,n:names,nopsl2);
    nonpsl2 := 0; nextinfo := 1000000;
    for G in iter do
      nonpsl2 := nonpsl2 + 1;
      pos := Position(typenames,G[2]);
      counts[pos][2] := counts[pos][2] + 1;
      if nonpsl2 = nextinfo then
        Info( InfoSimpleGroupsSizes, 1,
              rec( nonpsl2 := nonpsl2,
                   counts  := counts ) );
        nextinfo := nextinfo + 1000000;
      fi;
    od;

    if ValueOption( "nopsl2" ) = true then
      return rec( nonpsl2 := nonpsl2,
                  counts  := counts );
    fi;

    qmax := BiggestnForWhichValueIsLessThan(q->SizeA(1,q,2),n+1);
    roots := List([1..LogInt(qmax,3)],r->RootInt(qmax,r));
    pi := [];
    for r in [1..Length(roots)] do
      pi[r] := PrimeCount(roots[r]) - 1;
    od;
    pi[1] := pi[1] - 3; # PSL(2,3), PSL(2,5), PSL(2,7)
    pi[2] := pi[2] - 1; # PSL(2,9)
    purepsl2_odd := Sum(pi);

    purepsl2_even := BiggestnForWhichValueIsLessThan(k->SizeA(1,2^k),n+1) - 2;

    total := nonpsl2 + purepsl2_odd + purepsl2_even;

    if ValueOption("stats") <> true then
      return total;
    else
      return rec( total         := total,
                  nonpsl2       := nonpsl2,
                  purepsl2_odd  := purepsl2_odd,
                  purepsl2_even := purepsl2_even,
                  counts        := counts );
    fi;
  end );

#############################################################################
##
#F  PositionInListOfSimpleGroupsSortedBySize( <G> )
##
InstallGlobalFunction( PositionInListOfSimpleGroupsSortedBySize,

  function ( G )

    if not IsGroup(G) or not IsSimpleGroup(G) or not IsFinite(G) then
      return fail;
    fi;
    return NumberOfSimpleGroupsOfSizeAtMost(Size(G));
  end );

#############################################################################
##
#E  SimpleGroupsSizesIterator.gi . . . . . . . . . . . . . . . . .  ends here
