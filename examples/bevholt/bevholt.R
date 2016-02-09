<<<<<<< HEAD
setwd("~/work/training/20160208 UW/TMB-Feb2016/examples/bevholt")
data <- read.table("bevholt.dat", header=TRUE)
parameters <- list(logalpha=0, logbeta=-5, logsigma=0)

require(TMB)
compile("bevholt.cpp"," -O0 -Wall")
=======
data <- read.table("bevholt.dat", header=TRUE)
## plot(R~S, data, xlim=c(0,400), ylim=c(0,200))

parameters <- list(logRmax=log(400), logS50=log(100), logSigma=0)

require(TMB)
compile("bevholt.cpp")
>>>>>>> upstream/master
dyn.load(dynlib("bevholt"))

################################################################################

model <- MakeADFun(data, parameters, DLL="bevholt")
<<<<<<< HEAD

for (i in 1:3) fit <- nlminb(model$env$last.par.best, model$fn, model$gr)
=======
fit <- nlminb(model$par, model$fn, model$gr)
>>>>>>> upstream/master

best <- model$env$last.par.best
rep <- sdreport(model)

print(best)
print(rep)

<<<<<<< HEAD
best
rep

exp(best)

model$he()

jointrep <- sdreport(model, getJointPrecision=TRUE)

solve(model$he())

cov2cor(solve(model$he()))

summary(rep)
summary(rep,select="all")

=======
Svec <- seq(0, 4000, 20)
Rmax <- exp(best[["logRmax"]])
S50 <- exp(best[["logS50"]])
Rvec <- Rmax * Svec / (Svec + S50)
## lines(Rvec~Svec)
>>>>>>> upstream/master
