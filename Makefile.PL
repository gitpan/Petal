use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    'NAME'		=> 'Petal',
    'VERSION_FROM'	=> 'lib/Petal.pm', # finds $VERSION
    'PREREQ_PM'		=> {
        'HTML::TreeBuilder' => '3.12',
        'XML::Parser'       => '2.31',
    },
    ($] >= 5.005 ?    ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM => 'lib/Petal.pm', # retrieve abstract from module
       AUTHOR     => 'Jean-Michel Hiver <jhiver@mkdoc.com>') : ()),
);