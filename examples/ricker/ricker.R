<<<<<<< HEAD
setwd("~/work/training/20160208 UW/TMB-Feb2016/examples/ricker")
data <- read.table("ricker.dat", header=TRUE)
parameters <- list(logalpha=log(2), logbeta=log(0.0004), logsigma=0)

require(TMB)
compile("ricker.cpp"," -O0 -Wall")
=======
data <- read.table("ricker.dat", header=TRUE)[-1]
## plot(R~S, data, xlim=c(0,4000), ylim=c(0,1800))

parameters <- list(loga=log(5), logb=log(0.002), logSigma=0)

require(TMB)
compile("ricker.cpp")
>>>>>>> upstream
dyn.load(dynlib("ricker"))

################################################################################

model <- MakeADFun(data, parameters, DLL="ricker")
<<<<<<< HEAD

for (i in 1:3) fit <- nlminb(model$env$last.par.best, model$fn, model$gr)
=======
fit <- nlminb(model$par, model$fn, model$gr)
>>>>>>> upstream

best <- model$env$last.par.best
rep <- sdreport(model)

print(best)
print(rep)

<<<<<<< HEAD
fit
best
rep

exp(best)

model$he()

jointrep <- sdreport(model, getJointPrecision=TRUE)

solve(model$he())

cov2cor(solve(model$he()))

summary(rep)
summary(rep,select="all")

plot(data$S,data$R,type="p")
points(data$S,rep$value,pch=19)

=======
Svec <- seq(0, 4000, 20)
a <- exp(best[["loga"]])
b <- exp(best[["logb"]])
Rvec <- a * Svec * exp(-b*Svec)
## lines(Rvec~Svec)
>>>>>>> upstream
