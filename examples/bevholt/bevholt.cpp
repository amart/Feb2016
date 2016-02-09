#include <TMB.hpp>

template<class Type>
Type objective_function<Type>::operator() ()
{
  // DATA_VECTOR(x);
  DATA_VECTOR(R);
  DATA_VECTOR(S);
  int n = R.size();

  PARAMETER(logalpha);
  PARAMETER(logbeta);
  PARAMETER(logSigma);

  Type alpha = exp(logalpha);
  Type beta  = exp(logbeta);

  vector<Type> Rhat(n);

  Type neglogL = 0.0;

  Rhat = S / (alpha + (beta * S));
  neglogL = -sum(dnorm(R, Rhat, exp(logSigma), true));

  // JIM THORSON JUST ROCK'N TMB
  std::cout << alpha <<"  " << beta << " " << logSigma <<"\n ";
  REPORT(alpha);
  REPORT(beta);

  return neglogL;
}
