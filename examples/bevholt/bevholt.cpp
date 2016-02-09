#include <TMB.hpp>

template<class Type>
Type objective_function<Type>::operator() ()
{
  // DATA_VECTOR(x);
  DATA_VECTOR(R);
  DATA_VECTOR(S);
  int n = R.size();

  PARAMETER(Rmax);
  PARAMETER(S50);
  PARAMETER(logSigma);

  vector<Type> Rhat(n);

  Type neglogL = 0.0;

  Rhat = Rmax * S / (S + S50);
  neglogL = -sum(dnorm(R, Rhat, exp(logSigma), true));

  // JIM THORSON JUST ROCK'N TMB
  std::cout << Rmax <<"  " << S50 << " " << logSigma <<"\n ";

  return neglogL;
}
