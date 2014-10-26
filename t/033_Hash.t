#!C:/perl/bin/perl -w
package SomeObject;

sub list { [ 1, 2, 3, 4 ] }
sub as_string { 'Haro Genki' }

package main;

use strict;
use warnings;
use lib ('lib');

use Test::More qw( no_plan );
use Petal;

$|=1;

$Petal::BASE_DIR     = './t/data/';
$Petal::DISK_CACHE   = 0;
$Petal::MEMORY_CACHE = 0;
$Petal::TAINT        = 1;
$Petal::INPUT        = "XML";
$Petal::OUTPUT       = "XML";

my $template = new Petal ('hash_mustpass.xml');
my $object   = bless {}, 'SomeObject';
my $string;

eval { $string = $template->process (object => $object); };
ok(! $@, 'process hash_mustpass.xml' );
diag ($@) if ($@);


$template = new Petal ('hash_mustfail.xml');
$string   = undef;
eval { $string = $template->process (object => $object); };
ok( $@, 'process hash_mustfail.xml' );
diag ($string) if ($string);


__END__
