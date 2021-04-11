use strict;
use warnings;
open(READ,"hzau.txt") || die "Unable to Open File, $!";
while(defined(my $line=<READ>))
{
	if ($line =~ /(http:\/\/\S+\.(cn|com))/)
	{	
		print "$1\n";
	}
}
