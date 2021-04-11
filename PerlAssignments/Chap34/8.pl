use warnings;
use strict;
#read parameter
my $min=$ARGV[0];
my $max=$ARGV[1];
(defined($min) && defined($max)) || die ("Lack of parameter! Please input with the format below:\n  >perl 8.pl min max\n");
#open file handle
open(INPUT,"<anjisuan.txt")|| die ("Input file not found!\n");;
open(OUTPUT,">nonredudant.txt");
my $seq='';
my %seqcount;
#redundant seq merge&count
while(defined(my $line=<INPUT>))
{
	my $head=substr($line,0,1);
	chomp($line);
	if($head ne '>')
	{
		$seq=$seq.$line;
	}
	else
	{
		$seqcount{$seq}++;
		$seq='';
	}
}
#output to file
foreach my $seq(sort { $seqcount{$a} <=> $seqcount{$b} } keys %seqcount)
{
	print OUTPUT "$seq\t$seqcount{$seq}\n";
}
close(INPUT);
close(OUTPUT)||die("output failed!");
print"output successfully to ./nonredudant.txt\n";
#open file handle
open(INPUT2,"<nonredudant.txt");
#create hash for counting aa
my %aacount=('G'=>0,'A'=>0,'V'=>0,'L'=>0,'I'=>0,'P'=>0,'F'=>0,'Y'=>0,'W'=>0,'S'=>0,'T'=>0,'C'=>0,'M'=>0,'N'=>0,'Q'=>0,'K'=>0,'R'=>0,'H'=>0,'D'=>0,'E'=>0);
my $aasum=0;
while(defined(my $line=<INPUT2>))
{
	chomp($line);
	my ($nrseq,$count)=split(/\t/,$line);
	if($count >= $min && $count <= $max)
	{
		#print"$nrseq $count\n";
		$aasum+=length($nrseq);
		my @aas=split(//,$nrseq);
		foreach(@aas)
		{
			$aacount{$_}+=1;
		}
	}
	else
	{
		next;
	}
}
print"==RESULT==\n";
foreach my $key(keys %aacount)
{
	printf("$key\t$aacount{$key}\t%.4f%%\n",100*$aacount{$key}/$aasum);
}
print"Total aa:$aasum";