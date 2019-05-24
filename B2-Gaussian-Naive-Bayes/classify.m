function y=classify(x,mu0,sigma0,mu1,sigma1,theta)
  u=-log(sqrt(2*pi)*sigma0)-((x-mu0).^2)./(sigma0.^2)/2; #tử số
  a=sum(u)+log(theta(1));
  
  v=-log(sqrt(2*pi)*sigma1)-((x-mu1).^2)./(sigma1.^2)/2; #tử số
  b=sum(v)+log(theta(2));
 
  logalpha=a-b;
  y=0;
  if(logalpha<0)
    y=1;
  end 
end