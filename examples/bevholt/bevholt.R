setwd("~/work/training/20160208 UW/TMB-Feb2016/examples/bevholt")
data <- read.table("bevholt.dat", header=TRUE)
parameters <- list(logalpha=0, logbeta=-5, logsigma=0)

require(TMB)
compile("bevholt.cpp"," -O0 -Wall")
dyn.load(dynlib("bevholt"))

################################################################################

model <- MakeADFun(data, parameters, DLL="bevholt")

for (i in 1:3) fit <- nlminb(model$env$last.par.best, model$fn, model$gr)

best <- model$env$last.par.best
rep <- sdreport(model)

print(best)
print(rep)

best
rep

exp(best)

model$he()

