#!/usr/bin/perl

# If you run into an ISBN that you think is valid but this module
# says is invalid, put it here.
#
# Grab the latest RangeMessage.xml file and see if the distributed
# data is just out of date.
my @isbns_from_issues = qw(
	9782021183061
	);


use Test::More;

use File::Spec::Functions qw(catfile);

subtest 'compile' => sub {
	my @modules = qw( Business::ISBN Business::ISBN::Data );
	foreach my $module ( @modules ) {
		BAIL_OUT( "Could not load $module" ) unless use_ok( $module );
		}
	};

subtest 'check_isbns' => sub {
	foreach my $isbn ( @isbns_from_issues ) {
		my $i = Business::ISBN->new( $isbn );
		ok( $i->is_valid, "$isbn is valid" );
		}
	};

done_testing();
