A=load('wdbc.data');
y=A(:,2);
X0=A(:,3:12);

N=length(y);
X=[ones(N,1),X0];

#x1=X(1,:);
#y1_hat=x1*theta; #y1_hat là y dự báo, y1_hat =  0.034098-> gần 0 hơn gần 1, nhiều khả năng là 0, y1=0

X_test=X(1:120,:);
y_test=y(1:120,:);

y_train=y(121:end,:);
X_train=X(121:end,:);
N_test=length(y_test);

theta=(X_train'*X_train)^(-1)*X_train'*y_train;

#tổng bình phương sai số: sum of squares of errors
u=X*theta-y;
J=u'*u;

#compute our prediction of all N samples 
printf("test accuracy=%6.4f\n",acc(X_test,y_test,theta));
printf("train accuracy=%6.4f\n",acc(X_train,y_train,theta));

t=0.3:0.01:0.9;#tạo 1 dãy từ 0.3->0.9 với bước nhảy 0.05
a=zeros(length(t),1);
for k=1:length(t)
  a(k)=acc(X_test,y_test,theta,t(k));
endfor

plot(t,a,'-r','linewidt',2);
xlabel('threshold')
xlabel('accuracy')

[bestA,j]=max(a);
printf("best threshold for our prediction=%6.4f\n",t(j));
printf("best accuracy=%6.4f\n",bestA);

