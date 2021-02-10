#Assignment 5 

install.packages("rentrez")

ncbi_ids <- c("HQ433692.1","HQ433694.1","HQ433691.1") #creating a character class of ncbi Id's
library(rentrez)  #load rentrez package 
Bburg<-entrez_fetch(db = "nuccore", id = ncbi_ids, rettype = "fasta") #entrez_fetch gets a complete reresentation (DNA sequence) of the record of interest. In this case,
#the rettype is fasta, so a fasta type will be found and summarized 

Sequences <- strsplit(Bburg, split = "\n\n")

Sequences<-unlist(Sequences)

header<-gsub("(^>.*sequence)\\n[ATCG].*","\\1",Sequences)
seq<-gsub("^>.*sequence\\n([ATCG].*)","\\1",Sequences)
Sequences<-data.frame(Name=header,Sequence=seq)
Sequences

Sequences <- gsub("\n", "", Sequences$Sequence)
