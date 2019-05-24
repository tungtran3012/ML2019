A=load('iris.train.txt');
X=A(:,2:end);
#{
sepalL=X(:,1);
petalL=X(:,3);
plot(sepalL,petalL,'or','markerfacecolor','blue');
#}


[N,D]=size(X);
K=3;
#c=rand(K,D)*8
c=[4.86 6.79 1.16 6.27;
  0.04 1 3 4.97;
  0.64 5.64 5.33 5.10];
  
T=50;
clusters=zeros(N,1);
for t=1:T
  distances=zeros(N,K);
  for i=1:N
    for k=1:K
      distances(i,k)=norm(X(i,:)-c(k,:));
    end
  end

  #Mẫu dữ liệu i thuộc cái nào(mang clusters là chỉ số cụm)
  for i=1:N
    [~,clusters(i)]=min(distances(i,:));
  end

  for k=1:K
    idk=(clusters==k);
    #sum(idk)
    c(k,:)=mean(X(idk,:));
  end
  #c
end
clusters