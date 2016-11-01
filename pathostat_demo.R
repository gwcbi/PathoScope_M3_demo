library(PathoStat)

# Load PathoStat R data
pstat <- loadPstat(indir=system.file("data", package = "PathoStat"), 
                   infileName="pstat_data.rda")

# Run PathoStat
runPathoStat(pstat)
