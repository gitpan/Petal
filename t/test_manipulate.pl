#!/usr/bin/perl

package Configuration;

sub new {
	return bless({}, shift);
}

sub get_identity_field_name {
	return 'id';
}

use Test;
BEGIN { print "1..2\n"; }
END { print "not ok 1\n" unless $loaded;}
use Petal;
$loaded = 1;
print "ok 1\n";

my $template = new Petal('manipulate.html');
$template->process(
	configuration => Configuration->new()
) =~ m!<input petal:attributes="value entry/id;" type="hidden" name="id">!msg ?
	print "ok 2\n" : print "not ok 2\n";


