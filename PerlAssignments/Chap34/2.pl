use strict;
use warnings;
my %hash=();
while(<DATA>)
{
	chomp($_);
	chop($_);
	my ($key,$value)=split /\s+=>\s+/,$_;
	$hash{$key}=$value;
}
foreach my $key (sort {($hash{$a}<=>$hash{$b})||($b<=>$a)} keys %hash)
{
	print "$key=>$hash{$key}\n";
}

__DATA__
12  =>  50;
90  =>  50;
60  =>  7;
49  =>  100;
8   =>  100;
