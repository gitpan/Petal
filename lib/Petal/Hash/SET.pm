=head1 NAME

Petal::Hash::SET - A modifier that sets an expression within the
template hash

=head1 SYNOPSIS

  # these two lines are the same
  $hash->{foo} = $hash->{':var bar baz'};
  $hash->{':set bar baz'};

=head1 AUTHOR

Jean-Michel Hiver <jhiver@mkdoc.com>

This module is redistributed under the same license as Perl itself.


=head1 SEE ALSO

The template hash module:

  Petal::Hash

=cut
package Petal::Hash::SET;
use strict;
use warnings;
use Carp;


sub process
{
    my $class = shift;
    my $hash  = shift;
    my $argument = shift;
    
    my @split = split /\s+/, $argument;
    my $set   = shift (@split) or confess "bad syntax for $class: $argument (\$set)";
    
    my $value = $hash->FETCH (join ' ', @split);
    $hash->{$set} = $value;
    return '';
}


1;