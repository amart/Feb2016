setwd("~/work/training/20160208 UW/TMB-Feb2016/examples/catage")
load("fsa.RData") # gets "dat"

library(TMB)
compile("fsa2.cpp")
dyn.load(dynlib("fsa2"))

parameters <- list(
  logN1Y=rep(0,nrow(dat$catchNo)),   # numbers-at-age in the first year
  logN1A=rep(0,ncol(dat$catchNo)-1), # recruits in each year
  logFY=rep(0,ncol(dat$catchNo)),    # annual F
  logFA=rep(0,nrow(dat$catchNo)),    # F at each age -> selectivity
  logVarLogCatch=c(0,0),             # ???
  logQ=rep(0,nrow(dat$Q1)),          # survey selectivity
  logVarLogSurvey=0
)

# fixes sel for ages 5, 6, and 7 to be the same value (log value is 0, so actual value is 1)
obj <- MakeADFun(dat,parameters,DLL="fsa2", map=list(logFA=factor(c(1:4,NA,NA,NA))), silent=TRUE)

opt <- nlminb(obj$par, obj$fn, obj$gr, control=list(iter.max=1000,eval.max=1000))
rep <- sdreport(obj)
srep<-summary(sdreport(obj))
ssb<-srep[rownames(srep)=="ssb",]

plot(ssb[,1], type="l", lwd=5, col="red", ylim=c(0,550000))
lines(ssb[,1]-2*ssb[,2], type="l", lwd=1, col="red")
lines(ssb[,1]+2*ssb[,2], type="l", lwd=1, col="red")


best <- obj$env$last.par.best

best
rep

exp(best)

obj$he()

jointrep <- sdreport(obj, getJointPrecision=TRUE)

solve(obj$he())

cov2cor(solve(obj$he()))

summary(rep)
summary(rep,select="all")


