#!/usr/bin/env perl

#------------------------------------------------------------------
# vim:tw=160:softtabstop=8:shiftwidth=8:cindent:syn=perl:
#------------------------------------------------------------------
#
# latex_bot.pl
#
#------------------------------------------------------------------
#
# created on:	03/23/2017 
# created by:	jwwebb
# last edit on:	$DateTime: $ 
# last edit by:	$Author: $
# revision:     $Revision: $
# comments:     Generated
#
#------------------------------------------------------------------
# Revision List:
#
#		1.0	07/05/2006	Initial release
#       1.1 04/01/2007  Changed company header.
#       1.2	03/23/2017	Update header.
#		
#	Please report bugs, errors, etc.
#------------------------------------------------------------------
# LaTeX Top-Level Document Template
#
#	This utility is intended to make creating a lower level LaTeX document
#	easier. This script will create a new text file called 
#	"new_module_name.tex" when you type the following command:
#	
#	    [jwwebb@machine ../mymatlab]
#		$ latex_bot.pl new_module_name.tex
#		
#	The script will generate the empty LaTeX document template for you. 
#	Note:  "new_module_name.tex" is the name of the new LaTeX file 
#	and can be anything you like.
#  
#------------------------------------------------------------------

# Retrieve command line argument
use strict;
my $file = $ARGV[0];

# check to see if the user entered a file name.
dienice("syntax: latex_bot.pl new_file\n") if ($file eq "");

# check to make sure that the file doesn't exist.
dienice("Oops! A file called '$file' already exists.\n") if -e $file;
open(my $inF, ">", $file);

# Strip the .tex from the file name and use for the module name:
$file =~ s/\.tex$//;
# Make Date int MM/DD/YYYY
my $year      = 0;
my $month     = 0;
my $day       = 0;
($day, $month, $year) = (localtime)[3,4,5];


# Grab username from PC:
my $author= "$^O user";
if ($^O =~ /mswin/i)
{ 
  $author= $ENV{USERNAME} if defined $ENV{USERNAME};
}
else
{ 
  $author = getlogin();
}


#Module Template:
printf($inF "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\n");
printf($inF "%\n");
printf($inF "%\% $file.tex document\n");
printf($inF "%\n");
printf($inF "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\n");
printf($inF "%\n");
printf($inF "%\% My Company Confidential Copyright © %04d \n", $year+1900);
printf($inF "%\n");
printf($inF "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\n");
printf($inF "%\n");
printf($inF "%\% created on:\t%02d/%02d/%04d \n", $month+1, $day, $year+1900);
printf($inF "%\% created by:	$author\n");
printf($inF "%\% last edit on:\t%02d/%02d/%04d \n", $month+1, $day, $year+1900);
printf($inF "%\% last edit by:	$author\n");
printf($inF "%\% revision:	001\n");
printf($inF "%\% comments:\t\n");
printf($inF "%\n");
printf($inF "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\n");
printf($inF "% //Project// (//Number//)\n");
printf($inF "%\n");
printf($inF "%\% This LaTeX document describes ...\n");
printf($inF "%\n");
printf($inF "%\n");
printf($inF "%\% The sub-documents included in this design are:\n");
printf($inF "%\n");
printf($inF "%\t// enter sub-modules here;\n");
printf($inF "%\n");
printf($inF "%\n");
printf($inF "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\n");
printf($inF "\n");
printf($inF "\\chapter{<ch>}\n");
printf($inF "\% \\textbf{enter} \\LaTeX document here.\n");
printf($inF "\n");

close(inF); 

print("\n");
print("The script has finished successfully! You can now use $file.tex.");
print("\n");
print("\n");

exit;
 
#------------------------------------------------------------------------------ 
# Generic Error and Exit routine 
#------------------------------------------------------------------------------
 
sub dienice {
	my($errmsg) = @_;
	print"$errmsg\n";
	exit;
}
