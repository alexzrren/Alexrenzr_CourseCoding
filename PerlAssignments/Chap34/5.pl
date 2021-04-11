use warnings;
use strict;
my $lineid=0;
my $queryseq='';
my $queryseqb='';
my $sbjctseq='';
my $sbjctseqb='';
#read lines
while(<DATA>)
{
	if($lineid==0)
	{
		#concatenate Query sequence
		my @temp=split(/\s+/,$_);
		$queryseq=$queryseq.$temp[2];
		#concatenate Query sequence without '-'
		my @aatemp=split(//,$temp[2]);
		my @savetemp=();
		foreach(@aatemp)
		{
			if($_ ne '-')
			{	push(@savetemp,$_);		}
		}
		$queryseqb=$queryseqb.join('',@savetemp);
		$lineid++;
	}
	elsif($lineid==1)
	{	$lineid++;	}
	elsif($lineid==2)
	{
		#concatenate Sbjct sequence
		my @temp=split(/\s+/,$_);
		$sbjctseq=$sbjctseq.$temp[2];
		#concatenate Query sequence without '-' and '*' for scanning diads
		my @aatemp=split(//,$temp[2]);
		my @savetemp=();
		foreach(@aatemp)
		{
			if($_ ne '-' && $_ ne '*')
			{	push(@savetemp,$_);		}
		}
		$sbjctseqb=$sbjctseqb.join('',@savetemp);
		$lineid++;
	}
	else
	{	$lineid++;	$lineid=0;	}
}
my $qlen=length($queryseqb);
my $slen=length($sbjctseqb);
print"===Task.a===\n"; #Task.a
print"Query sequence:\n$queryseq\n";
print"Sbjct sequence:\n$sbjctseq\n";
print"\n===Task.b===\n"; #Task.b
print"Query sequence:\n$queryseqb\n";
print"Sbjct sequence:\n$sbjctseqb\n";

#create hash of aa diads;
my @aatype=qw/A R N D C Q E G H I L K M F P S T W Y V/;
my %qbicount=();
my %sbicount=();
foreach my $aa1(@aatype)
{
	foreach my $aa2(@aatype)
	{	
		$sbicount{$aa1.$aa2}=0;	
		$qbicount{$aa1.$aa2}=0;
	}
}

my @qaas=split(//,$queryseqb);
my $qcount=0;
for(my $i=0;$i<length($queryseqb)-1;$i++)
{
	my $bi=$qaas[$i].$qaas[$i+1];
	$qbicount{$bi}++;
	$qcount++;
}
my @saas=split(//,$sbjctseqb);
my $scount=0;
for(my $i=0;$i<length($sbjctseqb)-1;$i++)
{
	my $bi=$saas[$i].$saas[$i+1];
	$sbicount{$bi}++;
	$scount++;
}
my @key=keys %sbicount;
#Task.c
print"\n===Task.c===\n";
printf("Length of Query sequence:%d(original) %d(processed)\n",length($queryseq),length($queryseqb));
printf("Length of Sbjct sequence:%d(original) %d(processed)\n",length($sbjctseq),length($sbjctseqb));
print"AA\tSbjct\t\t|\tQuery\t\n";
print"==============================================\n";
foreach(@key)
{
	printf("$_\t$sbicount{$_}\t%.3f%%\t|\t$qbicount{$_}\t%.3f%%\n",$sbicount{$_}/$scount*100,$qbicount{$_}/$qcount*100);
}
print"Total\t$scount\t\t|\t$qcount\n";

__DATA__
Query  333     WISLGAVKRLQEQNAIDMEIIVNPKT------------------------------LDGG  362
               W++L A+K+L E +A+ MEII NPK                               +DG 
Sbjct  751020  WVNLKAIKKLVEADALKMEIIPNPKVPAWLMHSFLFLQFFHSLLSNQRKTANSIQEVDG-  750844

Query  363     LNVIQLETAVGAAIKS--------------------------------FENSLGINVPRS  390
               + V+QLETA GAAI+                                 F+N++G+NVPRS
Sbjct  750843  VKVLQLETAAGAAIRVYMPVLVARFEI*NANSNLFLTPFSCDSVSKQFFDNAIGVNVPRS  750664

Query  391     RFLPVKTTSDLLLV-------------------------------MSNLYSLNAGSLTMS  419
               RFLPVK +SDLLLV                                S+LY+L  G +T +
Sbjct  750663  RFLPVKASSDLLLVQVNSIHHV*QRNRVTNIF*NI*LMI*VFFLPQSDLYTLVDGFVTRN  750484

Query  420     EKREFPTVPLVKLGSSFTKVQD-----------------------------YLRRFESIP  450
               + R  P+ P ++LG  F KV +                             +L RF+SIP
Sbjct  750483  KARTNPSNPSIELGPEFKKVNEENDFLTSPICHFYLDS*ASLSVSV*QVATFLSRFKSIP  750304

Query  451     DMLELDHLTVSGDVTFGKNVSLK  473
                ++ELD L VSGDV FG ++ LK
Sbjct  750303  SIVELDSLKVSGDVWFGSSIVLK  750235
