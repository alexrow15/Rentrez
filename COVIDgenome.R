install.packages("rentrez")
library(rentrez)
ncbi_ids <- c("NC_045512.2")
Covid <-entrez_fetch(db = "nuccore", id = ncbi_ids, rettype = "fasta")
CovidSeq<-gsub("^>.*genome\\n([ATCG].*)","\\1",Covid)
CovidFullSeq <- gsub("\n", "", CovidSeq)
str(CovidFullSeq)
covspl <- strsplit(CovidFullSeq, split = "")
test <- covspl[[1]][21563:25384]
coltest <- paste(test, collapse = "")
coltest



Sprotein <- gsub("(^ATGTTTGTTTTTCTT+TTACATTACACATAA$)", "\\1", CovidFullSeq)
Sprotein
covspl[[1]][25360:25384]


# I would say that this gene is highly conserved. In all results teh Query Cover is 100%, indicating that each result perfectcly matches teh DNA seqeunce. 
# Additionally, the Max score is identical to the Total score, indicating that the entire segment seqeunces mathes the query sequence. In other words, all 
# variants have the same sequence (100 percent in the percent identification column for almost all
# variants). The graphic summary shows complete overlap in sequences. 
