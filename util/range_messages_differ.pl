#!/usr/bin/perl
use v5.10;

my @xml =
	map {
		s|<MessageDate>.*</MessageDate>||;
		s|<MessageSerialNumber>.*</MessageSerialNumber>||;
		$_;
		}
	map { local(@ARGV, $/) = $_; scalar <> }
	@ARGV;

say "Files are ", $xml[0] eq $xml[1] ? 'the same' : 'different';
say "0: <$xml[0]>\n1: <$xml[1]>\n";

exit( $xml[0] eq $xml[1] );  # 0 means they differ (aren't the same) - unix success
                             # 1 means they don't differ (are the same) - unix failure
