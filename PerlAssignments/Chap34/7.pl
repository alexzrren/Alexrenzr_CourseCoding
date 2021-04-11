use warnings;
use strict;

open(INPUT,"<bicluster.txt")||die("Input file not found!\n");
open(OUTPUT,">bicluster_output.txt");
my $line='';
while(defined($line=<INPUT>))
{
	chomp($line);
	my ($name,@gene)=split(/\t/,$line);
	print OUTPUT "$name\t";
	foreach (@gene)
	{
		#substring genename
		my $gname=substr($_,0,6);
		#substring the text in the bracket and split into a list
		my @data=split(/,/,substr($_,7,-1));
		my $property=$data[-1];
		print OUTPUT "$gname:$property\t";		
	}
	print OUTPUT "\n";
}
close(OUTPUT)||die("Write failed!\n");
close(INPUT);
print"output successfully to ./bicluster_output.txt\n";