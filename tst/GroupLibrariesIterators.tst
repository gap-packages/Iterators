#############################################################################
##
#W  GroupLibrariesIterators.tst                                   Stefan Kohl
##
##  This file contains automated tests of iterators of some of GAP's group
##  libraries.
##
#############################################################################

gap> START_TEST( "GroupLibrariesIterators.tst" );
gap> iter := SmallGroupsIterator();
<iterator running over the Small Groups Library>
gap> NextIterator(iter);
<pc group of size 1 with 0 generators>
gap> NextIterator(iter);
<pc group of size 2 with 1 generator>
gap> NextIterator(iter);
<pc group of size 3 with 1 generator>
gap> NextIterator(iter);
<pc group of size 4 with 2 generators>
gap> NextIterator(iter);
<pc group of size 4 with 2 generators>
gap> NextIterator(iter);
<pc group of size 5 with 1 generator>
gap> NextIterator(iter);
<pc group of size 6 with 2 generators>
gap> NextIterator(iter);
<pc group of size 6 with 2 generators>
gap> iter := SmallGroupsIterator(12);
<iterator running over the Small Groups Library>
gap> NextIterator(iter);
<pc group of size 12 with 3 generators>
gap> StructureDescription(last);
"C3 : C4"
gap> NextIterator(iter);
<pc group of size 12 with 3 generators>
gap> StructureDescription(last);
"C12"
gap> NextIterator(iter);
<pc group of size 12 with 3 generators>
gap> StructureDescription(last);
"A4"
gap> NextIterator(iter);
<pc group of size 12 with 3 generators>
gap> StructureDescription(last);
"D12"
gap> NextIterator(iter);
<pc group of size 12 with 3 generators>
gap> StructureDescription(last);
"C6 x C2"
gap> NextIterator(iter);
<pc group of size 13 with 1 generator>
gap> StructureDescription(last);
"C13"
gap> NextIterator(iter);
<pc group of size 14 with 2 generators>
gap> StructureDescription(last);
"D14"
gap> NextIterator(iter);
<pc group of size 14 with 2 generators>
gap> StructureDescription(last);
"C14"
gap> NextIterator(iter);
<pc group of size 15 with 2 generators>
gap> StructureDescription(last);
"C15"
gap> NextIterator(iter);
<pc group of size 16 with 4 generators>
gap> StructureDescription(last);
"C16"
gap> NextIterator(iter);
<pc group of size 16 with 4 generators>
gap> StructureDescription(last);
"C4 x C4"
gap> iter := SmallGroupsIterator(12,60);
<iterator running over the Small Groups Library>
gap> L := [];
[  ]
gap> for G in iter do Add(L,G); od;
gap> Length(L);
293
gap> Sum(List([12..60],NrSmallGroups));
293
gap> iter := SmallGroupsIterator(12,200:nonsolvable);
<iterator running over the Small Groups Library>
gap> L := [];
[  ]
gap> for G in iter do Add(L,G); od;
gap> List(L,StructureDescription);
[ "A5", "SL(2,5)", "S5", "C2 x A5", "PSL(3,2)", "GL(2,4)" ]
gap> iter := SmallGroupsIterator();
<iterator running over the Small Groups Library>
gap> First(iter,G->not IsAbelian(G));
<pc group of size 6 with 2 generators>
gap> StructureDescription(last);
"S3"
gap> First(iter,G->not IsAbelian(G) and IsSimple(G));
Alt( [ 1 .. 5 ] )
gap> ForAny(SmallGroupsIterator(1,59),
>           G->not IsAbelian(G) and IsSimple(G));
false
gap> ForAny(SmallGroupsIterator(1,60),
>           G->not IsAbelian(G) and IsSimple(G));
true
gap> ForAll(SmallGroupsIterator(61,119),G->IsSolvable(G));
true
gap> iter := SmallGroupsIterator(100);
<iterator running over the Small Groups Library>
gap> NextIterator(iter);
<pc group of size 100 with 4 generators>
gap> iter := TransitiveGroupsIterator(); 
<iterator running over the Transitive Groups Library>
gap> NextIterator(iter);
S2
gap> NextIterator(iter);
A3
gap> NextIterator(iter);
S3
gap> NextIterator(iter);
C(4) = 4
gap> iter := TransitiveGroupsIterator();
<iterator running over the Transitive Groups Library>
gap> First( iter, G -> not IsSolvable(G) and IsPrimitive(G)
>                      and Transitivity(G,MovedPoints(G)) < 2 );
A_5(10)
gap> L := [];;
gap> for G in TransitiveGroupsIterator(4,6) do Add(L,G); od;
gap> L;
[ C(4) = 4, E(4) = 2[x]2, D(4), A4, S4, C(5) = 5, D(5) = 5:2, F(5) = 5:4, A5, 
  S5, C(6) = 6 = 3[x]2, D_6(6) = [3]2, D(6) = S(3)[x]2, A_4(6) = [2^2]3, 
  F_18(6) = [3^2]2 = 3 wr 2, 2A_4(6) = [2^3]3 = 2 wr 3, S_4(6d) = [2^2]S(3), 
  S_4(6c) = 1/2[2^3]S(3), F_18(6):2 = [1/2.S(3)^2]2, F_36(6) = 1/2[S(3)^2]2, 
  2S_4(6) = [2^3]S(3) = 2 wr S(3), L(6) = PSL(2,5) = A_5(6), 
  F_36(6):2 = [S(3)^2]2 = S(3) wr 2, L(6):2 = PGL(2,5) = S_5(6), A6, S6 ]
gap> iter := PerfectGroupsIterator();
<iterator running over the Perfect Groups Library>
gap> NextIterator(iter);
Idgroup
gap> NextIterator(iter);
A5
gap> NextIterator(iter);
A5 2^1
gap> NextIterator(iter);
L3(2)
gap> iter := PerfectGroupsIterator();;
gap> G := First(iter,G->Size(Centre(G)) > RootInt(Size(G),3));
A5 2^1 x ( 2^4 E ( 2^1 A x 2^1 A ) ) C ( 2^1 x 2^1 )
gap> Size(Centre(G));
32
gap> Size(G);
30720
gap> iter := PerfectGroupsIterator(100000);
<iterator running over the Perfect Groups Library>
gap> NextIterator(iter);
A5 2^1 29^2
gap> 
gap> NextIterator(iter);
L2(59)
gap> NextIterator(iter);
L2(47) 2^1 = SL(2,47)
gap> iter := PerfectGroupsIterator(1000,10000); 
<iterator running over the Perfect Groups Library>
gap> L := [];;
gap> for G in iter do Add(L,G); od;
gap> Length(L);
56
gap> L;
[ A6 3^1, L2(13), L2(11) 2^1 = SL(2,11), L3(2) 2^3, L3(2) N 2^3, 
  A5 2^4 E 2^1, A5 2^4 E N 2^1, A5 2^1 x 2^4, A5 2^1 E 2^4, A5 2^1 x 2^4', 
  A5 2^4' C N 2^1, A5 2^4' C 2^1, A6 3^1 x 2^1, L2(13) 2^1 = SL(2,13), 
  L2(17), A7, L3(2) 2^1 x 2^3, L3(2) 2^3 E 2^1, L3(2) 2^1 x N 2^3, 
  A5 2^1 5^2, L2(19), A5 x A5, A5 ( 2^4 E 2^1 A ) C 2^1 I, 
  A5 ( 2^4 E 2^1 A ) C 2^1 II, A5 2^4 E ( 2^1 x 2^1 ), 
  A5 2^4 E ( 2^1 x N 2^1 ), A5 2^1 x ( 2^4 E 2^1 ), A5 2^1 E 2^4 E 2^1, 
  A5 2^1 x ( 2^4' C 2^1 ), L2(16), A5 3^4', A5 N 3^4', L2(17) 2^1 = SL(2,17), 
  A7 2^1, L3(2) 2^1 x ( 2^3 E 2^1 ), L3(3), A6 2^4, U3(3), L2(23), 
  L2(19) 2^1 = SL(2,19), A5 2^1 x A5, ( A5 N x A5 N ) 2^1, A5 5^3, A5 N 5^3, 
  A7 3^1, A5 ( 2^4 E ( 2^1 A x 2^1 ) ) C 2^1, 
  A5 ( 2^4 E ( 2^1 A x N 2^1 ) ) C 2^1 I, 
  A5 ( 2^4 E ( 2^1 A x N 2^1 ) ) C 2^1 II, A5 2^1 x ( 2^4 E 2^1 A ) C 2^1, 
  A5 2^1 x ( 2^4 E ( 2^1 x 2^1 ) ), L2(25), M11, A5 2^1 x 3^4', 
  A5 2^1 x N 3^4', A5 2^1 3^4, L2(27) ]
gap> STOP_TEST( "GroupLibrariesIterators.tst" );

#############################################################################
##
#E  GroupLibrariesIterators.tst . . . . . . . . . . . . . . . . . . ends here

