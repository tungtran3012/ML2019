A=load('exams.txt');
X=A(:,1:2);
y=A(:,3);
[N, D] = size(X);
X=[ones(N,1) X];

#Giam gradient
alpha=0.01;
theta=zeros(D+1,1);
Js=zeros(100,1);
for t=1:100
  [Js(t),dJ]=cost(X,y,theta);
  theta=theta-alpha*dJ;
endfor

plot(1:100,Js,'r');