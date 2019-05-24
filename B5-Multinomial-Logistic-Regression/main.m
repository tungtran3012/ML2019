A=load('iris.train.txt');
X_train=A(:,2:end);
y_train=A(:,1);
[N, D] = size(X_train);

K=length(unique(y_train));
y_train_1=(y_train==1);
y_train_2=(y_train==2);
y_train_3=(y_train==3);

X_train=[ones(N,1) X_train];
theta=zeros(D+1,1);

#Đặt option là có hỗ trợ gradient để tính nhanh hơn, MaxIter số bước lặp tối đa là 100
options=optimset('GradObj','on','MaxIter',100);
#@(t)cost(X_train,y_train_1,t) là hàm cần tối ưu(t chỉ là biến hình thức,theta là giá trị khởi tạo)
[best_theta_1,minJ]=fminunc(@(t)cost(X_train,y_train_1,t),theta,options);
[best_theta_2,minJ]=fminunc(@(t)cost(X_train,y_train_2,t),theta,options);
[best_theta_3,minJ]=fminunc(@(t)cost(X_train,y_train_3,t),theta,options);

A_test=load('iris.test.txt');
X_test=A_test(:,2:end);
y_test=A_test(:,1);
X_test=[ones(length(y_test),1) X_test];

best_theta=[best_theta_1,best_theta_2,best_theta_3];
y=classify(X_test(10,:),best_theta);
test_accuracy=eval(X_test,y_test,best_theta)
