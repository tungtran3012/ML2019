function [mu0,sigma0,mu1,sigma1,theta]=train(X,y)
  X0=X(y==0,:);
  X1=X(y==1,:);
  
  mu0=mean(X0);
  sigma0=std(X0);
  
  mu1=mean(X1);
  sigma1=std(X1);
  
  theta=zeros(2,1);
  theta(1)=sum(y==0)/length(y);
  theta(2)=sum(y==1)/length(y);
end