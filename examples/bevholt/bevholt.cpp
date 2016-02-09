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

  return neglogL;
}
