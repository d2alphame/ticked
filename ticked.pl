use v5.26;

my $tmplines = "";                      # For temporarily holding a line
my @tokens;                             # 'Types' of lines are stored here
my $start 	= 0;
my $h1      = 1;
my $h2      = 2;
my $h3      = 3;
my $hr      = 4;
my $p       = 5;
my $bq      = 6;
my $blank   = 7;
my $oli     = 8;        # Ordered list item
my $uli     = 9;        # Unordered list item
my $dt      = 10;       # Definition term
my $code    = 11;
my $edl		= 12;		# Marks the end of a definition list

my $buffer 	= "";
my $lines   = "";

push @tokens, $start;

# Read lines from files specified in stdin
while(<>) {

    if(/^#####*\t\s*[^\s].*$/) {
		push @tokens, $h1;
		$lines .= $_;
		next;
	}

	if(/^=====*\t\s*[^\s].*$/) {
		push @tokens, $h2;
		$lines .= $_;
		next;
	}

    if(/^-----*\t\s*[^\s].*$/) {
		push @tokens, $h3;
		$lines .= $_;
		next;
	}

    if(/^````*\s*$/) { 
		push @tokens, $code;
		$lines .= $_;
		next;
	}

    if(/^\s*$/) {
		push @tokens, $blank;
		$lines .= $_;
		next;
	}

    if(/^\s*#\t\s*[^\s].*/) {
		push @tokens, $oli;
		$lines .= $_;
		next;
	}

	if(/^\s*\+\t\s*[^\s].*/) {
		push @tokens, $uli;
		$lines .= $_;
		next;
	}

    if(/^\s*_____*\s*$/) {
		push @tokens, $hr;
		$lines .= $_;
		next;
	}

	if(/^\s*-\s[^\s].*$/) {
		push @tokens, $dt;
		$lines .= $_;
		next;
	}

	if(/^\t\s*[^\s].*/) {
		push @tokens, $bq;
		$lines .= $_;
		next;
	}

    push @tokens, $p;
	$lines .= $_;
	next;

}



say "@tokens";
print $lines;