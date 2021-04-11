use strict;
use warnings;
my $seq='';
readline DATA;
while(<DATA>)
{
	chomp();
	$seq=$seq.$_;
}
#print"$seq\n";
&Pair($seq);
&CGcount($seq);


sub Pair{
	my %bases=('A'=>'T','C'=>'G','T'=>'A','G'=>'C');
	my @seq1=split(//,$seq);
	my @seq2;
	foreach(@seq1)
	{
		push(@seq2,$bases{$_});
	}
	my $seqout;
	$seqout=join('',@seq2);
	print"$seqout\n";
}
sub CGcount{
	my $count=0;
	my @seq1=split(//,$seq);
	foreach(@seq1)
	{
		if($_ eq 'C' || $_ eq 'G')
		{
			$count++;
		}
	}
	my $r=$count/length($seq)*100;
	printf("GC:%d\tGC percentage:%.3f%%\n",$count,$r);
}

__DATA__
>gi|55380579|gb|AE014297.2| Drosophila melanogaster chromosome 3R, complete sequence
GAATTCTCTCTTGTTGTAGTCTCTTGACAAAATGCAATGGTCAGGTAGCGTTGTTCTAAACTCAAGATTT
AAAGGTGAATAGTCCTGTAAGCCCTATAAACATATGTACATAGGTAGGCCAGTACTTAGTACTGGCACAT
GCCGCTGATCTGTTAGTAGATTATCCATTTCCCTTCAGCGCCTACCTGCGTCACCAATGATGAGGTCGAG
ACAGAATCCTACTAGTACCTGCCTCGAGTCGATCGGGCAGAGAGCGAGAAATGGTAAGCAGGTGAGTGAG
CGCAGAGAGCGTCTTTCGACGACTCTTTCGTCGCGAGCAAACAACAAGTAGACGTCGCTCAGACACTGTC
GGCCAGATTCATTTTCCAGAAAGACGTCGTCGCGTTGACAAGCTTAAATTCGTAGCGGGCGCCAGTAGGA
CGACCCAGTGGATATCGTCAGTTGAACCAGGGGAAACGTAGCAGCCCAGTTACATTGCTCGGGAGGGGTA

