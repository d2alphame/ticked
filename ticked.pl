use v5.26;

my $holding_blank = 0;					# Set to 1 whenever we read a blank line
my $temp;


# Read files specified in stdin
while(<>) {

	if(/^\s*$/) {
		$holding_blank = 1;
	}

	if($holding_blank) {
		$temp = <>;
		$_ = <>;

		if(/^\s*$/) {
			if($temp =~ s%^####\t([^\s].*)$%<h1>$1</h1>%) {
				next;
			}
			if($temp =~ s%^====\t([^\s].*)$%<h2>$1</h2>%) {
				next;
			}
			if($temp =~ s%^----\t([^\s].*)$%<h3>$1</h3>%) {
				next;
			}
		}

	}

}