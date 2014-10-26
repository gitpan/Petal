#!/usr/bin/perl
use Test::More 'no_plan';
use warnings;
use lib 'lib';
use Petal;

$Petal::DISK_CACHE = 0;
$Petal::MEMORY_CACHE = 0;
$Petal::BASE_DIR = ('t/data');
my $file     = 'metal_use_macro.xml';

{
    my $t = new Petal ( file => 'metal_use_macro.xml' );
    my $s = $t->process();
    like ($s, qr/This is some stuff which should appear/);
    like ($s, qr/<test>Foo<\/test>/);
}

