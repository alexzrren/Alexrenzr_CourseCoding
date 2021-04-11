use strict;
use warnings;
&file_print("C:/Users/Alex Ren/Desktop", "C:/Users/Alex Ren/Desktop");
sub file_print
{
    my $dir = $_[0];
    my $out = $_[1].'/'."filepath.txt";
    opendir (DIR, $dir) || die "Unable to open directory, $!";
	open WRITE, ">>", $out || die "Unable to open file, $!";
    my @direc = ();
    while (my $file = readdir DIR)
    {
            $file = $dir."/".$file;
            if(-f $file)
            {
                print("$file\n");
                print WRITE "$file\n";
            }
            elsif(-d $file and $file !~ /.*\.$/)
            {
                push(@direc, "$file");
            }
    }
    closedir DIR;
    close WRITE;
    if(scalar @direc != 0)
    {
        foreach (@direc)
        {
            file_print($_, $_[1]);
        }
    }
}
