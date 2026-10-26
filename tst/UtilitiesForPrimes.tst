#############################################################################
##
#W  UtilitiesForPrimes.tst                                        Stefan Kohl
##
##  This file contains automated tests of some utility functions related to
##  prime numbers.
##
#############################################################################

gap> START_TEST( "UtilitiesForPrimes.tst" );
gap> iter := PrimePowersIterator();
<iterator of prime powers>
gap> qs := [];;
gap> for q in iter do if q > 2000000 then break; fi; Add(qs,q); od;
gap> Length(qs);
149235
gap> iter := PrimePowersIterator(1000000);
<iterator of prime powers>
gap> qs := [];;
gap> for q in iter do Add(qs,q); od;
gap> Length(qs);
78734
gap> iter := PrimePowersIterator(100000,5000);
<iterator of prime powers>
gap> qs := [];;
gap> for q in iter do Add(qs,q); od;
gap> Length(qs);
9700
gap> qs = Filtered([1..100000],IsPrimePowerInt);
true
gap> PrimeCount(10^12);
37607912018
gap> NthPrime(10^12);
29996224275833
gap> STOP_TEST( "UtilitiesForPrimes.tst" );

#############################################################################
##
#E  UtilitiesForPrimes.tst . . . . . . . . . . . . . . . . . . . .  ends here
