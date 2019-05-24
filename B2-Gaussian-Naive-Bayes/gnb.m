A=load('wdbc.data');
y=A(:,2);
X=A(:,3:12);

X_test=X(1:120,:);
y_test=y(1:120,:);
X_train=X(121:end,:);
y_train=y(121:end,:);

[mu0,sigma0,mu1,sigma1,theta]=train(X_train,y_train);

N=length(y_test);
predictions=zeros(N,1);
for i=1:N
  x=X_test(i,:);
  predictions(i)=classify(x,mu0,sigma0,mu1,sigma1,theta);
end

match=(y_test==predictions);
accuracy=sum(match)/N;
printf('accuracy=%6.4f\n',accuracy);