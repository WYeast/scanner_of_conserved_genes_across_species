#! /usr/bin/perl
use strict;
use warnings;

open IN,"$ARGV[0]" or die $!;    ## files to be processd
open IN2,"$ARGV[1]" or die $!;    ## files to be processd
open OUT,">$ARGV[2]" or die $!;   ## processed file
my %hash;
my $id;
my $seq;
while(<IN>){
	if($_=~/>/){
		$id=substr($_,1,15);
	    $hash{$id}=$seq;
	    next;
	}
	chomp;
	$seq.="$_\n";
}
	    
my $i=0;
while(<IN2>){
	chomp;
	my @sp=split /\s+/;
	if($hash{$sp[0]}){
		print OUT "$sp[0]\n$hash{$sp[0]}";
		$i++;
	}
}
print "$i";