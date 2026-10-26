#############################################################################
##
#W  UtilitiesForPrimes.gd                                         Stefan Kohl
##
##  This file contains the declarations of some utility functions for prime
##  numbers.
##
#############################################################################

#############################################################################
##
#F  ComputePrimePowers( max_q )
##
##  Computes all prime powers <= max_q, and stores the result in the variable
##  COMPUTED_PRIME_POWERS.
##
DeclareGlobalFunction( "ComputePrimePowers" );

#############################################################################
##
#V  COMPUTED_PRIME_POWERS . . . . . . . . .  list of precomputed prime powers
##
DeclareGlobalVariable( "COMPUTED_PRIME_POWERS" );

#############################################################################
##
#F  NextPrimePowerInt( n )
##
##  The least prime power greater than <n>.
##
DeclareGlobalFunction( "NextPrimePowerInt" );

#############################################################################
##
#R  IsPrimePowersIteratorRep
##
DeclareRepresentation( "IsPrimePowersIteratorRep",
                       IsComponentObjectRep, [ "state", "finish" ] );

#############################################################################
##
#F  PrimePowersIterator(  )
#F  PrimePowersIterator( <finish> )
#F  PrimePowersIterator( <finish>, <chunksize> )
##
##  This function returns an iterator that will run over all prime powers
##  in ascending order, finishing at <finish> if this argument is given.
##  The optional argument <chunksize> is the length of the interval which is
##  sieved in one go.
##
DeclareGlobalFunction( "PrimePowersIterator" );

#############################################################################
##
#F  PrimeCount( <n> )
##
##  Returns the number of prime numbers less than or equal to <n>.
##  The function makes use of the program primecount by Kim Walisch
##  ( https://github.com/kimwalisch/primecount ).
##  
DeclareGlobalFunction( "PrimeCount" );

#############################################################################
##
#F  NthPrime( <n> )
##
##  Returns the <n>th prime number.
##  The function makes use of the program primecount by Kim Walisch
##  ( https://github.com/kimwalisch/primecount ).
##  
DeclareGlobalFunction( "NthPrime" );

#############################################################################
##
#E  UtilitiesForPrimes.gd . . . . . . . . . . . . . . . . .  ends here
