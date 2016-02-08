#include <TMB.hpp>
 
template<class Type>
Type objective_function<Type>::operator() ()
{
  DATA_VECTOR(x);
  PARAMETER(mu);
  PARAMETER(logSigma);
  
  
  Type f;
  std::cout << "f " << f << std::endl;
  f = -sum(dnorm(x,mu,exp(logSigma), true));
  return f;
}
