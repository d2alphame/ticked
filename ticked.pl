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
my $oli     = 8;        # Ordered list item
my $uli     = 9;        # Unordered list item
my $dl      = 10;       # Definition list
my $dli     = 11;       # Definition list item

my $lines   = "";

# Read files specified in stdin
while(<>) {

    /^#####*\t\s*[^\s].*$/  &&  push @tokens, $h1    and next;           # H1
    /^=====*\t\s*[^\s].*$/  &&  push @tokens, $h2    and next;           # H2
    /^-----*\t\s*[^\s].*$/  &&  push @tokens, $h3    and next;           # H3
    /^\s*$/                 &&  push @tokens, $blank and next;           # Blank
    /^\s*#\t\s*.*/          &&  push @tokens, $oli   and next;           # Ordered list item
    /^\s*\+\t\s*.*/         &&  push @tokens, $uli   and next;           # Unordered list item
                                push @tokens, $p     and next;
}

say "@tokens";