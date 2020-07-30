use v5.26;

my $tmplines;                           # For temporarily holding a line
my @tokens;                             # For use as a stack for 
my $h1      = 1;
my $h2      = 2;
my $h3      = 3;
my $hr      = 4;
my $p       = 5;
my $bq      = 6;
my $blank   = 7;

# Read files specified in stdin
while(<>) {

    # H1 begins with 4 hashes (#) and at least 1 tab and must contain at least
    # 1 non-whitespace character. They must also be followed by a blank line
    if(/^####\t\s*[^\s].*/) {

        # If we had something that looked like an H1, then read the next line
        # to ensure it's blank. If it is, then the previous line was an H1
        $tmplines = $_;
        $_ = <>;                 

        if(/^\s*$/) {
            $tmplines =~ s%^####\t\s*([^\s].*)%<h1>$1</h1>%;
            print $tmplines;
            next;
        }

    }


    # H2 begins with 4 equals (=) and at least 1 tab and must contain at least
    # 1 non-whitespace character. They must also be followed by a blank line
    if(/^====\t\s*[^\s].*/) {

        # If we had something that looked like an H1, then read the next line
        # to ensure it's blank. If it is, then the previous line was an H1
        $tmplines = $_;
        $_ = <>;                 

        if(/^\s*$/) {
            $tmplines =~ s%^====\t\s*([^\s].*)%<h1>$1</h1>%;
            print $tmplines;
            next;
        }

    }



}