setwd("~/work/training/20160208 UW/TMB-Feb2016/examples/bevholt")
data <- read.table("bevholt.dat", header=TRUE)
parameters <- list(logalpha=0, logbeta=-5, logSigma=0)

require(TMB)
compile("bevholt.cpp"," -O0 -Wall")
dyn.load(dynlib("bevholt"))

################################################################################

model <- MakeADFun(data, parameters, DLL="bevholt")
fit <- nlminb(model$par, model$fn, model$gr)

best <- model$env$last.par.best
rep <- sdreport(model)

print(best)
print(rep)

best
rep
