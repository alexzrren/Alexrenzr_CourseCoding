use strict;
use warnings;
my %atom = ();
while(<DATA>)
{
	my @table = split(/\s+/, $_);
	my @cor = ($table[6], $table[7], $table[8],$table[3]);
	$atom{$table[1]} = [@cor]; #Using HoA to save data
	#print "$table[1]=>\[@cor\]\n";
}
&Dist(\%atom);
&Maxdist(\%atom);
	
sub Dist{
	my $first=shift(@_); 
	my %data = %{$first};
	my $maxdist=0;
	my $maxres='';
	foreach my $atom1(keys %data)
	{
		my $temp = $data{$atom1};
		delete $data{$atom1};
		foreach my $atom2(keys %data)
		{
			my $dist=&EucDist(\@{$temp},\@{$data{$atom2}});
			my $residue="$atom1(@{$temp}[3])<-->$atom2(@{$data{$atom2}}[3])\t$dist\n";
			if(!$_[0]) #Realize different function depending on the parameter
			{	
				print"$residue";
			}
			else
			{
				if($dist>$maxdist)
				{	
					$maxdist=$dist;
					$maxres=$residue;
				}
			}	
		}
	}
	if($_[0])
	{
		print"MAX DISTANCE:\n";
		print"$maxres";
	}
}	
sub EucDist{
	my @cor1=@{$_[0]};
	my @cor2=@{$_[1]};
	my $dimen=0;
	my $sqsum=0;
	while($dimen <3)
	{
		$sqsum+=($cor1[$dimen]-$cor2[$dimen])**2;
		$dimen++;
	}
	my $dist=sqrt($sqsum);
	return $dist;
}
sub Maxdist{
	my %data = %{$_[0]};
	Dist(\%data,1); #using a optional parameter to realize similar effect as an overloaded function
}
	
		
__DATA__
ATOM   4542  CA  LYS D 130      27.728  42.781 107.352  1.00 53.17           C  
ATOM   4551  CA  VAL D 131      28.783  40.337 110.073  1.00 46.40           C  
ATOM   4558  CA  LYS D 132      30.084  42.479 112.907  1.00 52.26           C  
ATOM   4567  CA  ALA D 133      31.868  41.767 116.183  1.00 53.70           C  
ATOM   4572  CA  LYS D 134      28.704  41.872 118.303  1.00 71.02           C  
ATOM   4581  CA  SER D 135      26.883  39.124 116.249  1.00 78.80           C  
ATOM   4587  CA  ILE D 136      29.774  36.647 116.820  1.00 93.90           C  
ATOM   4595  CA  VAL D 137      28.482  35.979 120.344  1.00117.21           C  
ATOM   4602  CA  PHE D 138      27.994  33.911 123.464  1.00133.01           C  
ATOM   4613  CA  HIS D 139      26.718  30.262 123.566  1.00139.94           C  
ATOM   4623  CA  ARG D 140      29.353  28.808 121.207  1.00139.51           C  
ATOM   4634  CA  LYS D 141      30.584  25.201 121.443  1.00131.58           C  
ATOM   4642  CA  LYS D 142      33.749  25.778 123.504  1.00113.11           C  
ATOM   4651  CA  ASN D 143      37.231  24.833 122.254  1.00 94.20           C  
ATOM   4659  CA  LEU D 144      36.495  27.447 119.636  1.00 69.72           C  
ATOM   4667  CA  GLN D 145      38.015  30.917 119.225  1.00 40.46           C  
ATOM   4676  CA  TYR D 146      37.259  33.717 116.776  1.00 28.66           C  
ATOM   4688  CA  TYR D 147      39.566  36.141 114.844  1.00 24.27           C  
ATOM   4700  CA  ASP D 148      38.913  38.812 112.220  1.00 32.21           C  
ATOM   4708  CA  ILE D 149      41.467  38.220 109.408  1.00 35.28           C  
ATOM   4716  CA  SER D 150      42.088  39.987 106.101  1.00 32.96           C  
ATOM   4722  CA  ALA D 151      43.967  37.479 103.880  1.00 32.91           C  
ATOM   4727  CA  LYS D 152      44.860  40.086 101.166  1.00 35.10           C  
ATOM   4736  CA  SER D 153      46.596  42.467 103.623  1.00 32.49           C  
ATOM   4742  CA  ASN D 154      47.988  39.768 105.958  1.00 28.75           C  