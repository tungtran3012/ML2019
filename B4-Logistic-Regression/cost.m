function [J,dJ]=cost(X,y,theta)
  #gereral
  J=0;
  N=length(y);
  dJ=zeros(size(theta));
  
  #Cách thông thường
  #{
  for i=1:N
    h=X(i,:)*theta;
    J=J+y(i)*log(h)+(1-y(i))*log(1-h);  
  endfor
  J=-J/N;
  
  for j=1:length(theta);
    s=0;
    for i=1:N
      s=s+(g(X(i,:)*theta)-y(i))*X(i,j);
    endfor
    dJ=s;  
  endfor
    #}
  
  #Cách vecto hoa
  h=g(X*theta);
  J=y'*log(h)+(1-y)'*log(1-h);
  J=-J/N;
  
  dJ=X'*(g(X*theta)-y);
  dJ=dJ/N;
endfunction
