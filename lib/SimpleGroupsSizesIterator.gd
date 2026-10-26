#############################################################################
##
#W  SimpleGroupsSizesIterator.gd                                  Stefan Kohl
##
##  This file contains the declarations related to iterators of orders of
##  finite simple groups.
##
#############################################################################

#############################################################################
##
#V  InfoSimpleGroupsSizes . . . . info class for simple groups sizes iterator
#F  SimpleGroupsSizesInfo . . . . . set info level of `InfoSimpleGroupsSizes'
##
##  This is the Info class of the simple groups sizes iterator code.
##
##  For convenience: `SimpleGroupsSizesInfo( <n> )' is a shorthand for
##  `SetInfoLevel( InfoSimpleGroupsSizes, <n> )'.
##
##  See Section "Info Functions" in the GAP Reference Manual for
##  a description of the Info mechanism.
##
DeclareInfoClass( "InfoSimpleGroupsSizes" );
DeclareGlobalFunction( "SimpleGroupsSizesInfo" );

#############################################################################
##
#F  SizeAlt( n )
##
##  This function returns the order of the alternating group of degree <n>.
##
DeclareGlobalFunction( "SizeAlt" );

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
##  These functions return the orders of the indicated finite simple groups
##  of Lie type, of Lie rank <n> over the field with <q> elements.
##
DeclareGlobalFunction( "SizeA" );
DeclareGlobalFunction( "Size2A" );
DeclareGlobalFunction( "SizeB" );
DeclareGlobalFunction( "Size2B2" );
DeclareGlobalFunction( "SizeC" );
DeclareGlobalFunction( "SizeD" );
DeclareGlobalFunction( "Size2D" );
DeclareGlobalFunction( "Size3D4" );
DeclareGlobalFunction( "SizeG2" );
DeclareGlobalFunction( "Size2G2" );
DeclareGlobalFunction( "SizeF4" );
DeclareGlobalFunction( "Size2F4" );
DeclareGlobalFunction( "SizeE6" );
DeclareGlobalFunction( "Size2E6" );
DeclareGlobalFunction( "SizeE7" );
DeclareGlobalFunction( "SizeE8" );

#############################################################################
##
#V  SizeSpor
##
##  A list of the orders of the 26 sporadic simple groups and the Tits group.
##
DeclareGlobalVariable( "SizeSpor" );

#############################################################################
##
#R  IsSimpleGroupsSizesIteratorRep
##
DeclareRepresentation( "IsSimpleGroupsSizesIteratorRep",
                       IsComponentObjectRep,
                       [ "state", "finish", "nopsl2", "givenames" ] );

#############################################################################
##
#F  SimpleGroupsSizesIterator(  )
#F  SimpleGroupsSizesIterator( <start> )
#F  SimpleGroupsSizesIterator( <start>, <finish> )
##
##  This function returns an iterator that will run over all orders of
##  non-abelian finite simple groups in ascending order, starting at order
##  <start> if specified, up to order <finish> if specified.
##  Default values for <start> and <finish> are 1 and infinity, respectively.
##  If the option nopsl2 is set, numbers which occur only as orders of
##  groups of type PSL_2(q) are omitted.
##
DeclareGlobalFunction( "SimpleGroupsSizesIterator" );

#############################################################################
##
#F  NumberOfSimpleGroupsOfSizeAtMost( <n> )
##
##  Returns the number of non-abelian simple groups of order at most <n>.
##
##  This function uses the function `PrimeCount', and works therefore only
##  if the program primecount by Kim Walisch
##  ( https://github.com/kimwalisch/primecount ) is installed on the system.
##
DeclareGlobalFunction( "NumberOfSimpleGroupsOfSizeAtMost" );

#############################################################################
##
#F  PositionInListOfSimpleGroupsSortedBySize( <G> )
##
##  Returns the position of the non-abelian simple group <G> in the list of
##  non-abelian finite simple groups sorted by increasing order.
##  In case there are two simple groups of order Size( <G> ), any of the two
##  possible positions may be returned.
##
##  This function uses the function `PrimeCount', and works therefore only
##  if the program primecount by Kim Walisch
##  ( https://github.com/kimwalisch/primecount ) is installed on the system.
##
DeclareGlobalFunction( "PositionInListOfSimpleGroupsSortedBySize" );

#############################################################################
##
#E  SimpleGroupsSizesIterator.gd . . . . . . . . . . . . . . . . .  ends here
