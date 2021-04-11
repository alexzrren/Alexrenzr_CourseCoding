use strict;
use warnings;
my %data=();
my %proteins=();
while(<DATA>)
{
	my ($key1,$key2,$value)=split(/\s+/,$_);
	$proteins{$key1}=0;
	$proteins{$key2}=0;
	$data{$key1}{$key2}=$value;
}
my @score=();
my @prolist=sort keys %proteins;
print "Protein\t";
foreach my $pro (@prolist)
{
	print "$pro\t";
}
print"\n";
foreach my $key1 (@prolist)
{
	my @scoreline = (); 
	print "$key1\t";
    foreach my $key2 (@prolist)
    {
		if(exists $data{$key1}{$key2}) 
    	{
    		push(@scoreline, $data{$key1}{$key2});
			print"$data{$key1}{$key2}\t";
    	}
    	elsif(exists $data{$key2}{$key1})
    	{
    		push(@scoreline, $data{$key2}{$key1});
			print"$data{$key2}{$key1}\t";
    	}
    	else
    	{
    		push(@scoreline, 0);
			print"0\t";
    	}
    }
    push(@score, [@scoreline]);
	print"\n";
}
__DATA__
123 	345 	3
233 	333 	23
455 	344 	45
344 	444 	65
444 	449 	91
421 	457 	34
221 	409 	45
467 	222 	40
