#include <TMB.hpp>

template<class Type>
Type objective_function<Type>::operator() ()
{
<<<<<<< HEAD
  // DATA_VECTOR(x);
=======
>>>>>>> upstream
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

  // Ricker
  Rhat = alpha * S * exp(-beta * S);
  neglogL = -sum(dnorm(R, Rhat, sigma, true));

  // JIM THORSON JUST ROCK'N TMB
  std::cout << alpha <<"  " << beta << " " << sigma <<"\n ";

  REPORT(alpha);
  REPORT(beta);
  REPORT(sigma);
  ADREPORT(Rhat);
=======
  PARAMETER(loga);
  PARAMETER(logb);
  PARAMETER(logSigma);
  Type a = exp(loga);
  Type b = exp(logb);
  Type sigma = exp(logSigma);
  vector<Type> Rhat(n);

  Type neglogL = 0;

  Rhat = a * S * exp(-b*S);
  ADREPORT(Rhat);
  neglogL = -sum(dnorm(R, Rhat, sigma, true));
>>>>>>> upstream

  return neglogL;
}
