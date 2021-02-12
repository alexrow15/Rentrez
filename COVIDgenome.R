install.packages("rentrez") #install rentrez
library(rentrez)   #load package
ncbi_ids <- c("NC_045512.2") 
Covid <-entrez_fetch(db = "nuccore", id = ncbi_ids, rettype = "fasta") #download specifc Covid seqeunce in fasta format
CovidSeq<-gsub("^>.*genome\\n([ATCG].*)","\\1",Covid)   #remove the header and keep only the sequence
CovidFullSeq <- gsub("\n", "", CovidSeq)   #remove the newline characters 
covspl <- strsplit(CovidFullSeq, split = "")  #split up the sequence to make it easier to index
CovidSProtein <- covspl[[1]][21563:25384]  #index the specic sequence of the Sprotein
CovidSProtein <- paste(test, collapse = "")  #visuallise and collapse the sequence to habe no spaces 
print(CovidSProtein) #print the seqeunce in order to copy and paste into BLAST


# I would say that this gene is highly conserved. In all results teh Query Cover is 100%, indicating that each result perfectcly matches teh DNA seqeunce. 
# Additionally, the Max score is identical to the Total score, indicating that the entire segment seqeunces mathes the query sequence. In other words, all 
# variants have the same sequence (100 percent in the percent identification column for almost all
# variants). The graphic summary shows complete overlap in sequences. 

