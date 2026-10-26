####################################################################################################
##
##  PackageInfo.g                        GAP4 Package `Iterators'                        Stefan Kohl
##
####################################################################################################

SetPackageInfo( rec(

PackageName      := "Iterators",
Subtitle         := "Iterators of orders of simple groups and more",
Version          := "1.0.0",
Date             := "26/10/2026", # dd/mm/yyyy format
License          := "GPL-2.0-or-later",
Persons          := [
                      rec( LastName      := "Kohl",
                           FirstNames    := "Stefan",
                           IsAuthor      := true,
                           IsMaintainer  := true,
                           Email         := "sk239@st-andrews.ac.uk",
                           WWWHome       := "https://stefan-kohl.github.io/"
                         )
                    ],
Status           := "dev",

PackageWWWHome  := "https://gap-packages.github.io/iterators/",
README_URL      := Concatenation( ~.PackageWWWHome, "README"        ),
PackageInfoURL  := Concatenation( ~.PackageWWWHome, "PackageInfo.g" ),
SourceRepository := rec( Type := "git",
                         URL  := "https://github.com/gap-packages/iterators" ),
IssueTrackerURL := Concatenation( ~.SourceRepository.URL, "/issues" ),
ArchiveURL      := Concatenation( ~.SourceRepository.URL,
                                 "/releases/download/v", ~.Version,
                                 "/iterators-", ~.Version ),
ArchiveFormats   := ".tar.gz",

AbstractHTML     := Concatenation("This package provides implementations of ",
                                  "iterators running through orders and descriptions of ",
                                  "non-abelian finite simple groups sorted by increasing order, ",
                                  "and the groups in various group libraries coming with GAP, ",
                                  "respectively."),
PackageDoc       := rec(
                         BookName         := "Iterators",
                         ArchiveURLSubset := ["doc"],
                         HTMLStart        := "doc/chap0.html",
                         PDFFile          := "doc/manual.pdf",
                         SixFile          := "doc/manual.six",
                         LongTitle        := Concatenation( "Iterators of orders of simple groups ",
                                                            "and more" ),
                         Autoload         := true
                       ),
Dependencies     := rec(
                         GAP                    := ">=4.16.1",
                         NeededOtherPackages    := [ [ "GAPDoc", ">=1.6.2" ],
                                                     [ "utils", ">= 0.63" ] ],
                         SuggestedOtherPackages := [ ],
                         ExternalConditions     := [ ]
                       ),
AvailabilityTest := ReturnTrue,
BannerString     := Concatenation( "\nLoading Iterators ", ~.Version,
                                   " (Iterators of orders of simple groups and more)",
                                   "\nby Stefan Kohl, sk239@st-andrews.ac.uk\n\n" ),
TestFile         := "tst/testall.g",
Keywords         := [ "simple groups", "group libraries", "iterators", "prime numbers" ],

AutoDoc := rec(
    TitlePage := rec(
        Copyright := """
&copyright; 2020 by Stefan Kohl. <P/>

&Iterators; is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 2 of the License, or
(at your option) any later version. <P/>

&Iterators; is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details. <P/>

For a copy of the GNU General Public License, see 
the file <F>GPL</F> in the <F>etc</F> directory of the &GAP;
distribution or see <URL>https://www.gnu.org/licenses/gpl.html</URL>.
        """,
        Abstract := """<#Include SYSTEM "abstract.xml">""",
    ),
),

) );

####################################################################################################
##
#E  PackageInfo.g  . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . ends here
