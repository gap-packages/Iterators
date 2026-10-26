#############################################################################
##
#W  IteratorsAux.g            GAP4 Package `Iterators'            Stefan Kohl
##
##  This file contains auxiliary functions for the Iterators package.
##
#############################################################################

#############################################################################
##
#S  Test utilities. /////////////////////////////////////////////////////////
##
#############################################################################

#############################################################################
##
#F  IteratorsTest(  ) . . . . . . . . . . . . . . . . . . . . read test files
##
##  Performs tests of the Iterators package.
##
BindGlobal( "IteratorsTest",

  function (  )
    return TestDirectory( DirectoriesPackageLibrary( "iterators", "tst" ) );
  end );

#############################################################################
##
#S  Testing the examples. ///////////////////////////////////////////////////
##
#############################################################################

#############################################################################
##
#F  IteratorsTestExamples( ) . . . . .  test examples in the Iterators manual
##
##  Tests the examples in the manual of the Iterators package.
##
BindGlobal( "IteratorsTestExamples",

  function ( )

    local  path;

    path := GAPInfo.PackagesInfo.("iterators")[1].InstallationPath;
    RunExamples(ExtractExamples(Concatenation(path,"/doc"),
                                "main.xml",[],"Chapter"),
                rec( width := 75, compareFunction := "uptowhitespace" ) );
  end );

#############################################################################
##
#E  iterators.g . . . . . . . . . . . . . . . . . . . . . . . . . . ends here
