#Problem01
$input=<STDIN>;
chomp($input);  #del "\n"
print("$input,welcome to Perl programming course!\n");

#Problem02
$input=<STDIN>;
printf("Decimal:%d\n",$input); #dec
printf("Hexadecimal:%X\n",$input); #hex
printf("Octonary:%o\n",$input); #oct

#Problem03
$in1=<STDIN>;
chomp($in1);
$in2=<STDIN>;
chomp($in2);
printf("$in1+$in2=%d\n",$in1+$in2);
printf("$in1-$in2=%d\n",$in1-$in2);
printf("$in1*$in2=%d\n",$in1*$in2);
printf("$in1/$in2=%.3f\n",$in1/$in2);
printf("$in1^$in2=%d\n",$in1**$in2);

#Problem04
$radius=<STDIN>;
$pi=3.14;
$perimeter=2*$pi*$radius;
$area=$pi*($radius**2);
print("The perimeter of the circle is $perimeter\n");
print("The area of the circle is $area\n");

#Problem05
$input=<STDIN>;
if($input>50)
{
	print("he data is bigger than 50!\n");
}
else
{
	print("The data is less than 50!\n");
}

#Problem06
$int=0;
$count=0;
$sum=0;
while($int<50)
{
	$int++;
	if($int%2==0)
	{	next;	}
	else
	{
		$sum=$sum+$int;
		$count++;
		if($count<5)
		{	
			print("$int\t");
		}
		else
		{
			print("$int\n");
			$count=0;
		}
	}
}
print("sum=$sum\n");

#Problem07
$ch1=abcdfeg;
$ch2=higklmn;
$ch3=$ch1.$ch2;
$len=length($ch3);
print("$ch3\n");
$int=0;
while($int<$len)
{
	$char=chop($ch3);
	print("$char");
	$int++;
}

#Problem08
print("Please input your ID:");
$id=<STDIN>;
chomp($id);
if($id ne 'perlbaby')
{
	print("Your input ID is not authorized!\n");
}
else
{
	print("Welcome perlbaby!\n");
	$count=0;
	while($count<3)
	{
		print("Please input your password:\n");
		$pwd=<STDIN>;
		chomp($pwd);
		if($pwd ne 'helloperl')
		{
			print("Your password is wrong!\n");
			$count++;
		}
		else
		{
			print("Your password is correct!\n");
			last;
		}
	}
	if($count==3)
	{
		print("Sorry, please try again tomorrow!\n");
	}
}

#Problem09
$i=1;
while($i<=6)
{
	if($i==4)
	{
		$i++;
		next;
	}
	else
	{
		print("*"x$i);
		$i++;
		print("\n");
	}
}

#Problem10
open(FILE,"seq.txt");  
my $seq=<FILE>;  
close(FILE); 
chomp($seq);
$len=length($seq);
print("The length of the sequence is: $len\n");
my $count = ($seq =~ s/A/X/g);
print("The num of A is: $count\n");
$per=$count/$len*100;
printf("The percentage of A is : %.4f%\n",$per);
