library(BatchQC)

ncond  <- 2
nrep   <- 10
nbatch <- 3

# Simulate matrix using rnaseq_sim
data.matrix <- rnaseq_sim(nbatch=nbatch,
                          ncond=ncond, 
                          npercond=nrep)

# Set the sample labels
batch <- rep(1:nbatch, each=ncond*nrep)
condition <- rep(rep(1:ncond, each=nrep), nbatch)

# Run BatchQC on the original data
batchQC(data.matrix, batch=batch, condition=condition)











### Control batch effects using ComBat

# Setup model matrix
pdata <- data.frame(1:ncond*nrep*nbatch, batch, condition)
modmatrix <- model.matrix(~as.factor(condition), data=pdata)

# Run Combat
combat_data.matrix <- ComBat(dat=data.matrix, batch=batch, mod=modmatrix)

# Run BatchQC on the corrected data
batchQC(combat_data.matrix, batch=batch, condition=condition)

