use warnings;
use strict;

while(1)
{	
	print"input(enter to end):";
	my $in=<STDIN>;
	if($in eq "\n"){
		print"Program Ended!\n";
		last;
	}
	&Identify($in);
}

sub Identify{
	if($_[0]%2==0)
	{ print"EVEN\n"}
	else
	{ print"ODD\n"}
}
