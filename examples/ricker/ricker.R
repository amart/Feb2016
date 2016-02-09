setwd("~/work/training/20160208 UW/TMB-Feb2016/examples/ricker")
data <- read.table("ricker.dat", header=TRUE)
parameters <- list(logalpha=1, logbeta=1, logsigma=0)

require(TMB)
compile("ricker.cpp"," -O0 -Wall")
dyn.load(dynlib("ricker"))

################################################################################

model <- MakeADFun(data, parameters, DLL="ricker")

for (i in 1:3) fit <- nlminb(model$env$last.par.best, model$fn, model$gr)

best <- model$env$last.par.best
rep <- sdreport(model)

print(best)
print(rep)

best
rep

exp(best)

model$he()

jointrep <- sdreport(model, getJointPrecision=TRUE)

solve(model$he())

cov2cor(solve(model$he()))

summary(rep)
summary(rep,select="all")

