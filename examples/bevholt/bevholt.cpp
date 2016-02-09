#include <TMB.hpp>

template<class Type>
Type objective_function<Type>::operator() ()
{
<<<<<<< HEAD
  // DATA_VECTOR(x);
=======
>>>>>>> upstream/master
  DATA_VECTOR(R);
  DATA_VECTOR(S);
  int n = R.size();

<<<<<<< HEAD
  PARAMETER(logalpha);
  PARAMETER(logbeta);
  PARAMETER(logsigma);

  Type alpha = exp(logalpha);
  Type beta  = exp(logbeta);
  Type sigma = exp(logsigma);

  vector<Type> Rhat(n);

  Type neglogL = 0.0;

  Rhat = S / (alpha + (beta * S));
  neglogL = -sum(dnorm(R, Rhat, sigma, true));

  // JIM THORSON JUST ROCK'N TMB
  std::cout << alpha <<"  " << beta << " " << sigma <<"\n ";

  REPORT(alpha);
  REPORT(beta);
  REPORT(sigma);
  ADREPORT(Rhat);
=======
  PARAMETER(logRmax);
  PARAMETER(logS50);
  PARAMETER(logSigma);
  Type Rmax = exp(logRmax);
  Type S50 = exp(logS50);
  Type sigma = exp(logSigma);
  vector<Type> Rhat(n);

  Type neglogL = 0;

  Rhat = Rmax * S / (S + S50);
  ADREPORT(Rhat);
  neglogL = -sum(dnorm(R, Rhat, sigma, true));
>>>>>>> upstream/master

  return neglogL;
}
