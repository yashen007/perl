#!/usr/bin/perl
use strict;
use warnings;

=begin 
use DBI;
 
my $CVdatabase = DBI->connect("DBI:mysql:classicmodels",'root','');
 
die "failed to connect to MySQL database:DBI->errstr()" unless($CVdatabase);
 
# prepare SQL statement
my $Preparedstring = $CVdatabase->prepare("SELECT lastname, firstname, extension FROM employees")
                   or die "prepare statement failed: $CVdatabase->errstr()";
 
$Preparedstring->execute() or die "execution failed: $CVdatabase->errstr()"; 
 
my($lastname,$firstname,$workers);
 
# loop through each row of the result set, and print it
while(($lname,$fname,$ext) = $Preparedstring->fetchrow()){
   print("$lastname, $firstname\t$workers\n");                   
}
 
$Preparedstring->finish();
$CVdatabase->disconnect();


as discussed database is commented out.

=cut 

print('test\n');

=begin 

the test works print functioning next to read the csv file and produce the table

=cut

my @stack = (); # Headings  array
my @stack2 = (); # information rows array

        my $testfile = 'test_file.csv';
             if (defined $ARGV[0]){
           $testfile = $ARGV[0];
      }

open(my $trialfile, '<', $testfile) or die  "Could not open '$testfile'\n";
  
       while (my $row = <$trialfile>) {
           #cut the line of each  row 
          chomp $row;
        #reads the line and splits the comma that is inbetween each into seperat column.
             my @columns = split /,/, $row;
     
     #split the header and the basic rows into 2 sectors
           if ( $row == 0 ) {
                for (my $i=0; $i <= 10; $i++) 
                   {
                      push(@stack, @columns["$i"]);
                   }
                   #THIS LINE IS THE TOP ROW OF THE HEADINGS
                      print("Welcome to my cv test:","\n|");        
                   print(@stack, "\n");
             print("----------------------------------","\n");
           } 
           #once the row is greater than 0 its automatically above the average of the
           #1 and becomes the fill in the forms of the rows.
           #thus it will fall below this line.
        if ( $row > 0 ) {
                #just to clean the stack so that it can run and stack again a new row of values instead of repeating the code.
                @stack2 = ();
                for (my $i2=0; $i2 <= 10; $i2++) 
                   {
                      push(@stack2, @columns["$i2"]);
                   }
                   #THIS lines after the top line
             print(@stack2, "\n");
             print("..................................","\n");
           } 
     #sorry i havent had a chance to test the code i have been at the office the entire day and using Tutorialspoint as a perl IDE for this testing while my managers wherent checking. above is also found     
}











