setwd("~/work/training/20160208 UW/TMB-Feb2016/examples/mini")

data <- list(x=rivers)
parameters <- list(mu=0,logSigma=0)

require(TMB)
# compile('mini.cpp') # ,'-fno-gnu-unique -O0 -Wall')
## This with these compiler options reduces "optimization" and makes it compile faster
compile('mini.cpp' ,' -O0 -Wall -g')
dyn.load(dynlib('mini'))

##################
model <- MakeADFun(data,parameters)
fit   <- nlminb(model$par, model$fn, model$gr)
rep   <- sdreport(model)
rep
