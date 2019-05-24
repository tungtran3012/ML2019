function a=acc(X,y,theta,threshold=0.5)
  prediction=X*theta>threshold;
  match=(prediction==y);
  N=length(y);
  a=sum(match)/N;
endfunction