#!/usr/bin/perl

##
## Test accessing object hashes / arrays when no methods found.
##

use warnings;
use lib 'lib';

use Test::More qw( no_plan );
use Petal;

$Petal::BASE_DIR     = './t/data/';
$Petal::DISK_CACHE   = 0;
$Petal::MEMORY_CACHE = 0;
$Petal::TAINT        = 1;
$Petal::INPUT        = 'XML';

{
    my $foo = bless { bar => 1 }, 'Foo';
    my $string = Petal->new ( 'tests_with_zero.xml' )->process();
    like ($string, qr/attr="0"/               => 'attributes');
    unlike ($string, qr/<content><\/content>/ => 'content');
    like   ($string, qr/replace:\s+0/         => 'replace');
}

