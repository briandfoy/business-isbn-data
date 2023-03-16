#!/usr/bin/perl

my @xml =
	map {
		s|<MessageDate>.*</MessageDate>||;
		s|<MessageSerialNumber>.*</MessageSerialNumber>||;
		$_;
		}
	map { local(@ARGV, $/) = $_; scalar <> }
	@ARGV;

exit $xml[0] eq $xml[1];  # 0 means they differ (aren't the same) - unix success
                          # 1 means they don't differ (are the same) - unix failure
