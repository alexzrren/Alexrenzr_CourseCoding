#Problem01
$seq="CGCTCGGGGGGCATGTCAAATGAGCTCAACAACATCATCTCTCGGACCACAGATGGCGTCTATGAGGGCG
TGGCCATCGGCGGGGACAGGTACCCTGGCTCAACATTTATGGATCACGTGTTACGTTACCAGGATACTCC
AGGAGTAAAAATGATTGTGGTTCTTGGAGAGATAGGGGGCACTGAGGAATACAAGATCTGCCGGGGCATC
CAGGAGGGCCGCCTCACCAAGCCCGTGGTCTGCTGGTGCATCGGGACATGTGCCACCATGTTCTCTTCTG
AGGTACAGTTCGGCCATGCCGGAGCTTGCGCCAACCAGGCTTCCGAAACTGCAGTAGCCAAGAACCAGGC
TTTGAAGGAGGCAGGAGTGTTTGTGCCCCCGAGCTTTGATGAACTTGGAGAAATCATCCAGTCTGTGTAT
GAAGATCTTGTGGCCAGAGGAGTCATTGTCCCTGCTCAGGAGGTGCCGCCTCCAACCGTGCCCATGGACT
ACTCCTGGGCCAGGGAGCTGGGTTTGATCCGCAAACCTGCCTCATTCATGACCAGCATCTGTGACGAGCG
AGGACAGGAGCTCATCTATGCGGGCATGCCCATCACCGAGGTCTTCAAGGAGGAGATGGGCATTGGTGGG
GTCCTTGGCCTCCTGTGGTTCCAGAGAAGGTTGCCCAAGTATGCCTGCCAGTTCATTGAGATGTGCCTGA
TGGTGACGGCAGATCACGGGCCAGCTGTGTCTGGGGCTCACAACACCATCATCTGCGCTCGGGCTGGGAA
GGACCTGGTTTCCAGCCTCACCTCGGGGCTGCTCACTATTGGGGACCGGTTTGGGGGTGCCCTGGATGCT
GCTGCCAAGATGTTCAGCAAAGCCTTTGACAGTGGTATTATCCCCATGGAGTTTGTGAACAAGATGAAGA
AGGAAGGAAAGCTG";
$seq=~s/[\n\r]*//g;
@base=split('',$seq);
$length=scalar(@base);
printf("%d bases in total\n",$length);
@count=(0)x16;
@diad=qw(AA AC AT AG CA CT CG CC TA TT TC TG GA GC GG GT);
for($i=0;$i<$length-1;$i=$i+1)
{
	$a="$base[$i]$base[$i+1]";
	for($j=0;$j<16;$j++)
	{
	  if($a eq $diad[$j])
	  {$count[$j]=$count[$j]+1};
	}
}
for($i=0;$i<16;$i=$i+1)
{
	print "$diad[$i]:$count[$i]\t";
	$ratio=$count[$i]/$length*100;
	printf("%2f%\n",$ratio);
}
print "\n";

#Poblem02
@array=([8,5,0,30,0,0],[0,0,5,0,71,0],[2,32,1,1,0,0],[55,45,42,37,18,15]);
@b=();
@line=qw(first second third fourth);
$sum=0;
$i=0;
foreach $onedimen(@array)
{
	push(@b,@{$onedimen});
	foreach $element(@{$onedimen})
	{
		$sum=$sum+$element;
	}
	print "The sum of $line[$i] line:$sum\n";
    $i++;
}
@sorted=sort{$b<=>$a}@b;
print "sort desc:@sorted\n";
print "\n";

#Poblem03
@array=([8,5,0,30,0,0],[0,0,5,0,71,0],[2,32,1,1,0,0],[55,45,42,37,18,15]);
$line=0;
while($line<scalar(@array))
{
	$column=0;
	while($column<scalar(@{$array[$line]}))
	{
	$array_T[$column][$line]=$array[$line][$column];
	$column++;
	}
	$line++;
}
print "T(array)=\n";
foreach $_(@array_T)
{
	print "@$_\n";
}
print "\n";

#Poblem04
$str=('A mixture of novel glycopeptides from 
glycosylation between cold water fish skin gelatin 
hydrolysates and glucosamine (GlcN) via transglutaminase (TGase), 
as well as glycation between fish gelatin hydrolysate and GlcN were 
identified by their pattern of molecular distribution using MALDI-TOF-MS.');
@lines=split(/\n/,$str);
foreach $line(@lines)
{	
	@temp=split(/ /,$line);
	foreach $word(@temp)
	{
		print"$word\n";
	}
}
print "\n";

#Poblem05
$str=('A mixture of novel glycopeptides from 
glycosylation between cold water fish skin gelatin 
hydrolysates and glucosamine (GlcN) via transglutaminase (TGase), 
as well as glycation between fish gelatin hydrolysate and GlcN were 
identified by their pattern of molecular distribution using MALDI-TOF-MS.');
@lines=split(/\n/,$str);
foreach $line(@lines)
{	
	push(@words,split(/ /,$line));
}
$output=join('*',@words);
print"$output\n";

#Poblem06
@num=qw(63 96 70 0 9 50 100);
$len=scalar(@num);
for($i=0;$i<$len;$i++)
{
	for($j=0;$j<$len-1-$i;$j++)
	{
		if($num[$j]>$num[$j+1])
		{
			($num[$j],$num[$j+1])=($num[$j+1],$num[$j]);
		}
	}
}
print "sort asc:@num\n";
print "\n";

#Problem07
$content=
'							x_cor	y_cor	z_cor
ATOM	1	N	VAL	A	1	101.601	38.534	-1.962	1.00	53.29	N  
ATOM	2	CA	VAL	A	1	103.062	38.513	-2.159	1.00	47.99	C';
@lines=split(/\n/,$content);
shift(@lines);
foreach $line(@lines)
{
	@values=split(/\t/,$line);
	@cortemp=@values[6..8];
	push(@cors,@cortemp);
}
$dist2=0;
$i=0;
while($i<3)
{
	$dist2+=($cors[$i]-$cors[$i+3])**2;
	$i++;
}
$dist=$dist2**0.5;
printf("%4f\n",$dist);
print "\n";

#Problem08
$wildseq=("aagcttgctt tcattagaaa gacgagacag cagctttcca aagatacaca cagcacttga");
@wild=split(//,join('',split(/ /,$wildseq)));
$mutantseq=("aagcttgctt tcatttgaaa gacgagacag cagctttcca aagattcaca cagcacatga");
@mutant=split(//,join('',split(/ /,$mutantseq)));
$mutcount=0;
for($i=0;$i<scalar(@wild);$i++)
{
	if($wild[$i] ne $mutant[$i])
	{
		$mutindex[$mutcount]=$i;
		$mutcount++;
	}
}
foreach(@mutindex)
{
	$baseid=$_+1;
	print "BaseNo.$baseid:$wild[$_]->$mutant[$_]\n";
}
print "\n";

#Poblem09
@array=(1,3,6,3,7,34,6,3,7,9,3,0,1,4,8,5,55,90,11,24,67,90,39,2,90,34);
$length=scalar(@array);
for($i=0;$i<$length;$i++)
{
	for($j=$i+1;$j<$length;$j++)
	{
		if($array[$i]==$array[$j])
		{
			splice(@array,$j,1);
		}
	}
}
print "@array\n";
print "\n";