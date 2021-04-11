use warnings;
use strict;
my %HoA;
while(<DATA>)
{
	my ($category,$name)=split /\s+/,$_;
	my @names=split /、/,$name;
	$HoA{$category}=[@names];
}
for my $category(keys %HoA)
{
	print "$category\t=> \[ @{$HoA{$category}} \] \n";
}

__DATA__
plant	arabidopsis、oryza、rape、maize
animal	swine、cattle
human	you、me、her