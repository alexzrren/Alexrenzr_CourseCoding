use warnings;
use strict;

print "input the number of block to move:";
my $n=<STDIN>;
&move($n,'a','b','c');

sub move{
	my $n=$_[0];
	my $a=$_[1];
	my $b=$_[2];
	my $c=$_[3];
	if($n==1)
    {	print "\t$a->$c\n";	}
    else
    {
        &move($n-1,$a,$c,$b);
        print "\t$a->$c\n";
        &move($n-1,$b,$a,$c);
    }
}