use strict;
use warnings;
my $inputdir=$ARGV[0];
defined($inputdir) || die "Lack of parameter! Please use:\n>perl additional2.pl <DIRECOTRY>\n";
my %tempfile=('tmp'=>1,'_m_p'=>1,'bak'=>1,'old'=>1,'syd'=>1,'gid'=>1,'chk'=>1,'dir'=>1,'dmp'=>1,'nch'=>1);
&file_print($inputdir);
sub file_print
{
    my $dir = $_[0];
    my $success=0;
	opendir (DIR, $dir) || die "Unable to open directory, $!";
    my @direc = ();
    while (my $file = readdir DIR)
    {
			$file = $dir."/".$file;
			$file =~ /\.([a-zA-Z]{3}|_m_p)$/;
			if(-d $file and $file !~ /.*\.$/)
            {
				push(@direc, "$file");
            }
			$file =~ /\.([a-zA-Z]{3}|_m_p)$/;
			my $expandname=$1;
			if(defined($expandname))
			{	
				if(defined($tempfile{$expandname}))
				{
					unlink "$file";
					print "$file DELETED!\n";
					$success++;
				}		
			}		
    }
    closedir DIR;
    if(scalar @direc != 0)
    {
        foreach (@direc)
        {
            file_print($_);
        }
    }
}
