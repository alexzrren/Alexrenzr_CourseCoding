use strict;
use warnings;
my %hash=();
while(<DATA>)
{
	my ($key,$value)=split /\s+=>\s+/,$_;
	$hash{$key}=$value;
}

#Task a. Sort by key
print "Sort by key:\n";
foreach my $key (sort keys %hash)
{
	print "$key=>$hash{$key}";
}

#Task b. Sort by value
print "\nSort by value:\n";
foreach my $key (sort {$hash{$a} cmp $hash{$b}} keys %hash)
{
	print "$key=>$hash{$key}";
}
__DATA__
Donald  =>  Knuth
Alan    	=>  Turing
John    	=>  Neumann
Sum     =>  Pearsom
Soddy	=>  Toleis
