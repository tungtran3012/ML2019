B=load('iris.train.txt');
y=B(:,1);
X=B(:,2:end);
mu=mean(X);
N=size(X,1);
barX=X-repmat(mu,N,1);
A=(barX'*barX)/(N-1);
[theta,V]=eig(A);
[~,order]=sort(diag(V),'descend');
d=2;
theta=theta(:,order(1:d));
Z=X*theta;


g1 = (y == 1);
plot(Z(g1,1), Z(g1,2), 'or'); 
hold on;
g2 = (y == 2);
plot(Z(g2,1), Z(g2,2), '*b'); 
hold on;
g3 = (y == 3);
plot(Z(g3,1), Z(g3,2), '+k'); 
hold off;