#############################################################################
##
#W  testall.g              GAP4 Package `Iterators'               Stefan Kohl
##                                                                
#############################################################################

LoadPackage( "iterators" );
TestDirectory( DirectoriesPackageLibrary( "iterators", "tst" ),
               rec( exitGAP := true ) );

#############################################################################
##
#E  testall.g . . . . . . . . . . . . . . . . . . . . . . . . . . . ends here
