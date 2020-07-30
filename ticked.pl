use v5.26;

my $tmplines;                           # For temporarily holding a line
my $prev = "";                          # Holds the content of a previous line


# Read files specified in stdin
while(<>) {

    # Headings should be surrounding by blank lines

    # H1 begins with 4 hashes (#) and at least 1 tab and must contain at least
    # 1 non-whitespace character. They must also be followed by a blank line
    if(($prev eq ""  || $prev =~ /^\s*$/ ) && /^####\t\s*[^\s].*/) {

        # If we had something that looked like an H1, then read the next line
        # to ensure it's blank. If it is, then the previous line was an H1
        $tmplines = $_;

        $prev = $_;                             # Save the current content of the line before loading the next one
        $_ = <>;                 

        if(/^\s*$/) {
            $tmplines =~ s%^####\t\s*([^\s].*)%<h1>$1</h1>%;
            print $tmplines;

            $prev = $_;                         #  Again, save the content of the current line before loading the next one
            next;
        }

        # If the following isn't a blank line, then continue with processing the supposed H1
        $_ = $tmplines;

    }


    # H2 begins with 4 equals (=) and at least 1 tab and must contain at least
    # 1 non-whitespace character. They must also be followed by a blank line
    if(($prev eq ""  || $prev =~ /^\s*$/ ) && /^====\t\s*[^\s].*/) {

        # If we had something that looked like an H2, then read the next line
        # to ensure it's blank. If it is, then the previous line was an H2
        $tmplines = $_;

        $prev = $_;                             # Save the current content of the line before loading the next one
        $_ = <>;                 

        if(/^\s*$/) {
            $tmplines =~ s%^====\t\s*([^\s].*)%<h2>$1</h2>%;
            print $tmplines;

            $prev = $_;                         #  Again, save the content of the current line before loading the next one
            next;
        }

        # If the following isn't a blank line, then continue with processing the supposed H2
        $_ = $tmplines;

    }



}