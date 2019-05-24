A=load('wdbc.data');
X=A(:,3:end);
y=A(:,2);
[N, D] = size(X);
X=[ones(N,1) X];

#Giam gradient
alpha=0.01;
theta=zeros(D+1,1);
Js=zeros(100,1);
for t=1:100
  [Js(t),dJ]=cost(X,y,theta);
  size(dJ)
  theta=theta-alpha*dJ;
endfor
plot(Js,'r');