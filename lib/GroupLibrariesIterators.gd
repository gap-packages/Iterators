#############################################################################
##
#W  GroupLibrariesIterators.gd                                   Stefan Kohl
##
##  This file contains the declarations related to iterators of some of GAP's
##  group libraries.
##
#############################################################################

#############################################################################
##
#R  IsSmallGroupsIteratorRep
##
DeclareRepresentation( "IsSmallGroupsIteratorRep", IsComponentObjectRep,
                       [ "state", "finish", "nonsolvable" ] );

#############################################################################
##
#F  SmallGroupsIterator(  )
#F  SmallGroupsIterator( <start> )
#F  SmallGroupsIterator( <start>, <finish> )
##
##  This function returns an iterator which iterates over the groups stored
##  in GAP's Small Groups Library, sorted by ascending order, starting at
##  order <start> if specified, up to order <finish> if specified.
##  Default values for <start> and <finish> are 1 and the limit imposed by
##  the Small Groups Library, respectively.
##  If the option nonsolvable is set, solvable groups are omitted.
##
DeclareGlobalFunction( "SmallGroupsIterator" );

#############################################################################
##
#R  IsTransitiveGroupsIteratorRep
##
DeclareRepresentation( "IsTransitiveGroupsIteratorRep", IsComponentObjectRep,
                       [ "state", "finish" ] );

#############################################################################
##
#F  TransitiveGroupsIterator(  )
#F  TransitiveGroupsIterator( <start> )
#F  TransitiveGroupsIterator( <start>, <finish> )
##
##  This function returns an iterator which iterates over the groups stored
##  in GAP's Transitive Groups Library, sorted by ascending degree, starting
##  at degree <start> if specified, up to degree <finish> if specified.
##  Default values for <start> and <finish> are 1 and the limit imposed by
##  the Transitive Groups Library, respectively.
##
DeclareGlobalFunction( "TransitiveGroupsIterator" );

#############################################################################
##
#R  IsPerfectGroupsIteratorRep
##
DeclareRepresentation( "IsPerfectGroupsIteratorRep", IsComponentObjectRep,
                       [ "state", "finish" ] );

#############################################################################
##
#F  PerfectGroupsIterator(  )
#F  PerfectGroupsIterator( <start> )
#F  PerfectGroupsIterator( <start>, <finish> )
##
##  This function returns an iterator which iterates over the groups stored
##  in GAP's Perfect Groups Library, sorted by ascending order, starting
##  at order <start> if specified, up to order <finish> if specified.
##  Default values for <start> and <finish> are 1 and the limit imposed by
##  the Perfect Groups Library, respectively.
##
DeclareGlobalFunction( "PerfectGroupsIterator" );

#############################################################################
##
#E  GroupLibrariesIterators.gd . . . . . . . . . . . . . . . . .  ends here
