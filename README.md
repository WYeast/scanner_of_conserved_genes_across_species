# scanner_of_conserved_genes_across_species
Introduction

The purpose of this pipline is to scan conserved genes/RNAs/proteins across two species. The strategy used here is called "Two best hit". Mouse and human lincRNAs sequence files
(mm10.lncRNA.fa GRCh38.lncRNA.fa) were downloaded from NONCODE.

Take finding conserved pairs between mouse lincRNAs and human lincRNAs as an illustration:
First, fasta36 is used to find homologs of mouse lincRNA in human lincRNA, command line is as follow

fasta36 -b 1 -d 0 -U -E 1e-6 -S -c "0.1 0.02" mm10.lncRNA.fa GRCh38.lncRNA.fa > mm_to_hs.1e-6.fa

(E value cutoff was 1e-6 here, which is a quite stringent threhold according to Pearson's recommendation (Ref 1).It can be adjusted by users. ) 

This step is reciprocally repeated to find homologs of human lincRNA in mouse lincRNA.

fasta36 -b 1 -d 0 -U -E 1e-6 -S -c "0.1 0.02" GRCh38.lncRNA.fa mm10.lncRNA.fa  > hs_to_mm.1e-6.fa

Then using find_2best_hits.pl script to extract best hit pairs .txt file from files generated.

perl find_2best_hits.pl mm_to_hs.1e-6.fa mm2hs.txt

perl find_2best_hits.pl hs_to_mm.1e-6.fa hs2mm.txt

Finally, only if the best hit of one mouse lincRNA in human lincRNAs also bestly hits the origin mouse lincRNA in mouse lincRNAs' set, this pair can be called "2 best hit".
Final extraction of "2 best hits" is performed by final_integration.pl

perl final_integration.pl mm2hs.txt hs2mm.txt 2best_hits.txt

If sequence information is needed, write_fasta.pl can be used to extract sequence from .fa file. 2best_hits_in_mouse.txt is the mouse lincRNAs from 2best_hits.txt

perl write_fasta.pl 2best_hits_in_mouse.txt mm10.lncRNA.fa 2best_hits_in_mm_linc.fasta

Reference
1. Flexible Sequence Similarity Searching with the FASTA3 Program Package.  Pearson WR. Methods Mol Biol. 2000
