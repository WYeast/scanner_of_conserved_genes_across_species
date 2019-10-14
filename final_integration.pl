#! /usr/bin/perl
use strict;
use warnings;

open IN,"$ARGV[0]" or die $!;    ## files to be processd
open IN2,"$ARGV[1]" or die $!;    ## files to be processd
open OUT,">$ARGV[2]" or die $!;   ## processed file
my %hash;

while(<IN>){
	chomp;
	my @sp=split /\s+/,$_;
	   $hash{$sp[0]}=$sp[1];
}
while(<IN2>){
	chomp;
	my @sp=split /\s+/,$_;
	if($sp[0] eq $hash{$sp[1]}){
	    print OUT "$_\n";
	}
}
