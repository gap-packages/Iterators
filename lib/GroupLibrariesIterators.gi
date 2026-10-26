#############################################################################
##
#W  GroupLibrariesIterators.gi                                    Stefan Kohl
##
##  This file contains an implementation of iterators running over some of
##  GAP's group libraries.
##
#############################################################################

#############################################################################
##
#M  AsList( <iter> ) . . . . . . . . . . . . . . . . . . . . .  for iterators
##
InstallOtherMethod( AsList,
                    "for iterators", ReturnTrue,
                    [ IsIterator and IsMutable ], 0,

  function ( iter )

    local  obj, list;

    list := [];
    repeat
      obj := NextIterator(iter);
      Add(list,obj);
    until IsDoneIterator(iter);
    return list;
  end );

#############################################################################
##
#M  FirstOp( <iter>, <cond> ) . . . . . . . . . . . . . . . . . for iterators
##
InstallOtherMethod( FirstOp,
                    "for iterators", ReturnTrue,
                    [ IsIterator and IsMutable, IsFunction ], 0,

  function ( iter, cond )

    local  obj;

    repeat
      obj := NextIterator(iter);
    until cond(obj) = true;
    return obj;
  end );

#############################################################################
##
#M  ForAnyOp( <iter>, <cond> ) . . . . . . . . . . . . . . . .  for iterators
##
InstallOtherMethod( ForAnyOp,
                    "for iterators", ReturnTrue,
                    [ IsIterator and IsMutable, IsFunction ], 0,

  function ( iter, cond )

    local  obj;

    repeat
      obj := NextIterator(iter);
      if cond(obj) = true then return true; fi;
    until IsDoneIterator(iter);
    return false;
  end );

#############################################################################
##
#M  ForAllOp( <iter>, <cond> ) . . . . . . . . . . . . . . . .  for iterators
##
InstallOtherMethod( ForAllOp,
                    "for iterators", ReturnTrue,
                    [ IsIterator and IsMutable, IsFunction ], 0,

  function ( iter, cond )

    local  obj;

    repeat
      obj := NextIterator(iter);
      if cond(obj) <> true then return false; fi;
    until IsDoneIterator(iter);
    return true;
  end );

#############################################################################
##
#M  NumberOp( <iter>, <cond> ) . . . . . . . . . . . . . . . .  for iterators
##
InstallOtherMethod( NumberOp,
                    "for iterators", ReturnTrue,
                    [ IsIterator and IsMutable, IsFunction ], 0,

  function ( iter, cond )

    local  obj, count;

    count := 0;
    repeat
      obj := NextIterator(iter);
      if cond(obj) = true then
        count := count + 1;
      fi;
    until IsDoneIterator(iter);
    return count;
  end );

#############################################################################
##
#M  FilteredOp( <iter>, <cond> ) . . . . . . . . . . . . . . .  for iterators
##
InstallOtherMethod( FilteredOp,
                    "for iterators", ReturnTrue,
                    [ IsIterator and IsMutable, IsFunction ], 0,

  function ( iter, cond )

    local  obj, selection;

    selection := [];
    repeat
      obj := NextIterator(iter);
      if cond(obj) = true then
        Add(selection,obj);
      fi;
    until IsDoneIterator(iter);
    return selection;
  end );

#############################################################################
##
#S  Iterators running over the Small Groups Library. ////////////////////////
##
#############################################################################

#############################################################################
##
#F  SmallGroupsIterator(  )
#F  SmallGroupsIterator( <start> )
#F  SmallGroupsIterator( <start>, <finish> )
##
InstallGlobalFunction( SmallGroupsIterator,

  function ( arg )

    local  state, start, finish, nonsolvable, groups, n;

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
      Error("Usage: SmallGroupsIterator([ <start> [, <finish> ]])");
    fi;

    if not IsInt(start) or start < 1 then
      start := 1;
    fi;
    if not IsInt(finish) and not IsInfinity(finish) then
      finish := infinity;
    fi;

    nonsolvable := ValueOption("nonsolvable") = true;

    if not nonsolvable then
      state := [start,1];
    else
      n := start - 1;
      repeat 
        n      := n + 1;
        groups := AllSmallGroups(n,IsSolvable,false);
      until groups <> [];
      state := [n,1,List(groups,G->IdGroup(G)[2])];
    fi;

    return Objectify( NewType( IteratorsFamily,
                               IsIterator
                           and IsMutable
                           and IsSmallGroupsIteratorRep ),
                      rec( state       := state,
                           finish      := finish,
                           nonsolvable := nonsolvable ) );
  end );

#############################################################################
##
#M  NextIterator( <iter> ) .  for iterators running over small groups library
##
InstallMethod( NextIterator,
               "for iterators running over the small groups library", true,
               [     IsIterator and IsMutable
                 and IsSmallGroupsIteratorRep ], 0,

  function ( iter )

    local  state, finish, nonsolvable, n, i;

    state       := iter!.state;
    finish      := iter!.finish;
    nonsolvable := iter!.nonsolvable;

    n := state[1];
    if not nonsolvable then
      i := state[2];
      if i < NrSmallGroups(n) then
        state[2] := state[2] + 1;
      else
        repeat
          state[1] := state[1] + 1;
        until SMALL_AVAILABLE(state[1]) <> fail;
        state[2] := 1;
      fi;
    else
      i := state[3][state[2]];
      if state[2] < Length(state[3]) then
        state[2] := state[2] + 1;
      else
        repeat
          state[1] := state[1] + 1;
        until Length(Set(Factors(state[1]))) >= 3
          and SMALL_AVAILABLE(state[1]) <> fail
          and AllSmallGroups(state[1],IsSolvable,false) <> [];
        state[2] := 1;
        state[3] := List(AllSmallGroups(state[1],IsSolvable,false),
                         G->IdGroup(G)[2]);
      fi;
    fi;

    return SmallGroup(n,i);
  end );

#############################################################################
##
#M  IsDoneIterator( <iter> )  for iterators running over small groups library
##
InstallMethod( IsDoneIterator,
               "for iterators running over the small groups library", true,
               [ IsIterator and IsSmallGroupsIteratorRep ], 0,

  function ( iter )
    return iter!.state[1] > iter!.finish;
  end );

#############################################################################
##
#M  ShallowCopy( <iter> ) . . for iterators running over small groups library
##
InstallMethod( ShallowCopy,
               "for iterators running over the small groups library", true,
               [ IsIterator and IsSmallGroupsIteratorRep ], 0,

  iter -> Objectify( Subtype( TypeObj( iter ), IsMutable ),
                     rec( state       := iter!.state,
                          finish      := iter!.finish,
                          nonsolvable := iter!.nonsolvable ) ) );

#############################################################################
##
#M  ViewObj( <iter> ) . . . . for iterators running over small groups library
##
InstallMethod( ViewObj,
               "for iterators running over the small groups library", true,
               [ IsIterator and IsSmallGroupsIteratorRep ], 0,

  function ( iter )
    Print("<iterator running over the Small Groups Library>");
  end );

#############################################################################
##
#S  Iterators running over the Transitive Groups Library. ///////////////////
##
#############################################################################

#############################################################################
##
#F  TransitiveGroupsIterator(  )
#F  TransitiveGroupsIterator( <start> )
#F  TransitiveGroupsIterator( <start>, <finish> )
##
InstallGlobalFunction( TransitiveGroupsIterator,

  function ( arg )

    local  state, start, finish, groups, n;

    if   Length(arg) = 0 then
      start  := 2;
      finish := infinity;
    elif Length(arg) = 1 then
      start  := arg[1];
      finish := infinity;
    elif Length(arg) = 2 then
      start  := arg[1];
      finish := arg[2];
    else
      Error("Usage: TransitiveGroupsIterator([ <start> [, <finish> ]])");
    fi;

    if not IsInt(start) or start < 2 then
      start := 2;
    fi;
    if not IsInt(finish) and not IsInfinity(finish) then
      finish := infinity;
    fi;

    state := [ start, 1 ];

    return Objectify( NewType( IteratorsFamily,
                               IsIterator
                           and IsMutable
                           and IsTransitiveGroupsIteratorRep ),
                      rec( state       := state,
                           finish      := finish ) );
  end );

#############################################################################
##
#M  NextIterator( <iter> ) . for iterators over the transitive groups library
##
InstallMethod( NextIterator,
               "for iterators running over the transitive groups library",
               true, [     IsIterator and IsMutable
                       and IsTransitiveGroupsIteratorRep ], 0,

  function ( iter )

    local  state, finish, n, i;

    state       := iter!.state;
    finish      := iter!.finish;

    n := state[1];
    i := state[2];
    if i < NrTransitiveGroups(n) then
      state[2] := state[2] + 1;
    else
      state[1] := state[1] + 1;
      state[2] := 1;
    fi;

    return TransitiveGroup(n,i);
  end );

#############################################################################
##
#M  IsDoneIterator( <iter> ) for iterators over the transitive groups library
##
InstallMethod( IsDoneIterator,
               "for iterators running over the transitive groups library",
               true, [ IsIterator and IsTransitiveGroupsIteratorRep ], 0,

  function ( iter )
    return iter!.state[1] > iter!.finish;
  end );

#############################################################################
##
#M  ShallowCopy( <iter> ) .  for iterators over the transitive groups library
##
InstallMethod( ShallowCopy,
               "for iterators running over the transitive groups library",
               true, [ IsIterator and IsTransitiveGroupsIteratorRep ], 0,

  iter -> Objectify( Subtype( TypeObj( iter ), IsMutable ),
                     rec( state       := iter!.state,
                          finish      := iter!.finish ) ) );

#############################################################################
##
#M  ViewObj( <iter> ) . . .  for iterators over the transitive groups library
##
InstallMethod( ViewObj,
               "for iterators running over the transitive groups library",
               true, [ IsIterator and IsTransitiveGroupsIteratorRep ], 0,

  function ( iter )
    Print("<iterator running over the Transitive Groups Library>");
  end );

#############################################################################
##
#S  Iterators running over the Perfect Groups Library. //////////////////////
##
#############################################################################

#############################################################################
##
#F  PerfectGroupsIterator(  )
#F  PerfectGroupsIterator( <start> )
#F  PerfectGroupsIterator( <start>, <finish> )
##
InstallGlobalFunction( PerfectGroupsIterator,

  function ( arg )

    local  state, start, finish, groups, n;

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
      Error("Usage: PerfectGroupsIterator([ <start> [, <finish> ]])");
    fi;

    if not IsInt(start) or start < 1 then
      start := 1;
    fi;
    if not IsInt(finish) and not IsInfinity(finish) then
      finish := infinity;
    fi;

    while NrPerfectGroups(start) < 1 do
      start := start + 1;
    od;

    state := [ start, 1 ];

    return Objectify( NewType( IteratorsFamily,
                               IsIterator
                           and IsMutable
                           and IsPerfectGroupsIteratorRep ),
                      rec( state       := state,
                           finish      := finish ) );
  end );

#############################################################################
##
#M  NextIterator( <iter> ) . .  for iterators over the perfect groups library
##
InstallMethod( NextIterator,
               "for iterators running over the perfect groups library",
               true, [     IsIterator and IsMutable
                       and IsPerfectGroupsIteratorRep ], 0,

  function ( iter )

    local  state, finish, n, i;

    state       := iter!.state;
    finish      := iter!.finish;

    n := state[1];
    i := state[2];
    if i < NrPerfectGroups(n) then
      state[2] := state[2] + 1;
    else
      repeat
        state[1] := state[1] + 1;
      until NrPerfectGroups(state[1]) > 0;
      state[2] := 1;
    fi;

    return PerfectGroup(IsPermGroup,n,i);
  end );

#############################################################################
##
#M  IsDoneIterator( <iter> ) .  for iterators over the perfect groups library
##
InstallMethod( IsDoneIterator,
               "for iterators running over the perfect groups library",
               true, [ IsIterator and IsPerfectGroupsIteratorRep ], 0,

  function ( iter )
    return iter!.state[1] > iter!.finish;
  end );

#############################################################################
##
#M  ShallowCopy( <iter> ) . . . for iterators over the perfect groups library
##
InstallMethod( ShallowCopy,
               "for iterators running over the perfect groups library",
               true, [ IsIterator and IsPerfectGroupsIteratorRep ], 0,

  iter -> Objectify( Subtype( TypeObj( iter ), IsMutable ),
                     rec( state       := iter!.state,
                          finish      := iter!.finish ) ) );

#############################################################################
##
#M  ViewObj( <iter> ) . . . . . for iterators over the perfect groups library
##
InstallMethod( ViewObj,
               "for iterators running over the perfect groups library",
               true, [ IsIterator and IsPerfectGroupsIteratorRep ], 0,

  function ( iter )
    Print("<iterator running over the Perfect Groups Library>");
  end );

#############################################################################
##
#E  GroupLibrariesIterators.gi . . . . . . . . . . . . . . . . . .  ends here
