use v5.26;

my $first;
my $second;

$first = <>;
$second = <>;

while(<>) {

	if(/^\s*$/) {
		if($first =~ /^\s*$/ && $second =~ s%^####\t([^\s].*)$%<h1>$1</h1>%) {
			print $second;
			$first = $second;
			$second = $_;
			next;
		}

		if($first =~ /^\s*$/ && $second =~ s%^====\t([^\s].*)$%<h2>$1</h2>%) {
			print $second;
			$first = $second;
			$second = $_;
			next;
		}

		if($first =~ /^\s*$/ && $second =~ s%^----\t([^\s].*)$%<h3>$1</h3>%) {
			print $second;
			$first = $second;
			$second = $_;
			next;
		}

	}

	if($second =~ /^\s*$/) {
		if($_ =~ s%^(\t*)#\t([^\s].*)$%<li>$2</li>%) {
			say '<ol>';
			print;
			$first = $second;
			$second = $_;
			next;
		}
	}


	$first = $second;
	$second = $_;
}