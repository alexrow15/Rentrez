#Assignment 5 

install.packages("rentrez")

ncbi_ids <- c("HQ433692.1","HQ433694.1","HQ433691.1") #creating a character class of ncbi Id's
library(rentrez)  #load rentrez package 
Bburg<-entrez_fetch(db = "nuccore", id = ncbi_ids, rettype = "fasta") #entrez_fetch gets a complete reresentation (DNA sequence) of the record of interest. In this case,
#the rettype is fasta, so a fasta type will be found and summarized 

Sequences <- strsplit(Bburg, split = "\n\n")  #separate the 3 variants by \n\n

Sequences<-unlist(Sequences) 

header<-gsub("(^>.*sequence)\\n[ATCG].*","\\1",Sequences)  #select only the header
seq<-gsub("^>.*sequence\\n([ATCG].*)","\\1",Sequences)    #select only the sequence
Sequences<-data.frame(Name=header,Sequence=seq)  #create dataframe

Sequences <- gsub("\n", "", Sequences$Sequence)  #remove newline characters
Sequences <- data.frame(Name = header, Sequence = Sequences)   #create dataframe of sequence and variant
write.csv(Sequences, "Sequences.csv")   #write out the data to file called Seqeunces.csv

