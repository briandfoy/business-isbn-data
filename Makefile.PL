use 5.008;
use strict;
use warnings;

                       
my $github    = 'https://github.com/briandfoy/';
my $main_file = 'lib/';

my %WriteMakefile = (
    'NAME'  	 	=> 'Business::ISBN::Data',
    'VERSION_FROM' 	=> 'lib/Business/ISBN/Data.pm',
	'LICENSE'       => 'perl',
	'AUTHOR'        => 'brian d foy <bdfoy@cpan.org>',
	'ABSTRACT_FROM' => $main_file;	
    'PREREQ_PM'     => {
		'Carp'                  => '0',
		'File::Basename'        => '0',
		'File::Spec::Functions' => '0',
		},

	'CONFIGURE_REQUIRES' => {
		'ExtUtils::MakeMaker' => '6.64',
		},

	'TEST_REQUIRES' => {
		'Test::More'          => '0.95',
		},

	'META_MERGE' => {
		'meta-spec' => { version => 2 },
		resources => {
			repository => {
				type => 'git',
				url  => 'git@github.com:briandfoy/business--isbn.git',
				web  => 'https://github.com/briandfoy/business--isbn',
				},
			},
		},

	clean => { FILES => 'Business-ISBN-Data* .DS_Store' },
	);

sub arguments { \%WriteMakefile }

do_it() unless caller;
sub do_it {
	require File::Spec;
	my $MM ='ExtUtils::MakeMaker';
	my $MM_version =
		eval{ "$MM " . $WriteMakefile{'CONFIGURE_REQUIRES'}{'ExtUtils::MakeMaker'} }
			//
		"$MM 6.64";
	eval "use $MM_version" || die "Could not load $MM_version: $@";
	eval "use Test::Manifest 1.21" 
		if -e File::Spec->catfile( qw(t test_manifest) );
	WriteMakefile( %WriteMakefile );
	}


no warnings;
__PACKAGE__;
