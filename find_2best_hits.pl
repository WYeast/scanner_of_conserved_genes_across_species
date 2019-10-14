#! /usr/bin/perl
use strict;
use warnings;

open IN,"$ARGV[0]" or die $!;    ## files to be processd
open OUT,">$ARGV[1]" or die $!;   ## processed file
my %hash;
while(<IN>){
    if(($_=~/NONHSAT/)){
        chomp;
	my $tmp1=$_;
	my @sp1=split /\s+/,$tmp1;
	my $id1=substr $sp1[0],-15;
	for (my $i=0;;$i++){
	    last if $i==9;
	    my $useless_line=<IN>;
	    }
	    my $testline=<IN>;
	    if (($testline=~/best/)){
	        chomp (my $tmp2=<IN>);
	        my @sp2=split /\s+/,$tmp2;
	        my $id2=$sp2[0];
	        $hash{$id1}=$id2;
	        print OUT "$id1\t$id2\n";
	    }
    }
}
