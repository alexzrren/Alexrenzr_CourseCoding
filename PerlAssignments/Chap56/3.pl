use strict;
use warnings;

print"enter you mail address:";
my $in=<STDIN>;
if($in !~ /^([a-zA-Z]|[0-9])(\w|\-)+@[a-zA-Z0-9]+\.com$/)
{	print"invalid!\n";	}
else
{	print"valid!\n";	}