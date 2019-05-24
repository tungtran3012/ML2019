#A=load('auto.txt');
A=load('weather.txt');
#Lay tat ca cac hang cot 1->3
#X=A(:,1:3);
X=A(:,1:4);
#Lay tat ca cac hang cot 4
#y=A(:,4);
y=A(:,5);
y=y+1;

      #1) params of Naive Bayes Model
      #D là số feature là số cột matrix X,size(X)(2) trả về tham số thứ 2 của size 
      D=size(X)(2);

      #Số nhãn(label, class) của mỗi điểm dữ liệu, unique là lệnh lọc ra các số khác nhau
      K=length(unique(y));
      #tham số của mô hình Naive Bayes: params
      theta_k=zeros(K,1);
      theta_jk=zeros(D,K);
      #2)Estimate the values of the paramers(Learning)
      #theta_k(1),theta_k(2),...,theta_k(K)
      #theta_k(k)=xác suất mỗi điểm dữ liệu có nhãn là k
      
      #tính theta_k
      for k=1:K
        #lênh y==1 trả về vecto logic hàng nào của y có giá trị k nó trả về true(1), ngược lại false
        index=(y==k);
        #sum(index) là lệnh đếm số dòng của vectơ logic có giá trị true
        theta_k(k)=sum(index);
        #Tính theo tư duy bình thường
        #{
        s1=0;
        N=length(y);
        for i=1:N
          if(y(i)==1)            
            s1=s1+1;
          end
        end
        theta_k(1)=s1/N;
        #}
      end
      
      #Tính theta_jk=P(x_j=1|y=k)
      N=length(y);
      
      for k=1:K
          #theta_jk=count(x_j==1 and y==k)/count(y=k)
          index=(y==k);
          X_k=X(index,:);
          theta_jk(:,k)=sum(X_k)./theta_k(k);
      end  
      theta_k=theta_k./N;
      
      
      #3) Use model to classify new data points
      #x=[0,1,0];
      x=[1,0,1,0];
      #y=? We compute P(y=k|x) for all k=1,2,..,K and select most probable
      #P(y=k|x)=P(y=k,x)/P(x)
      #        =P(x,y=k)/P(x)
      #        =P(x|y=k)*P(y=k)/P(x)
      #P(x|y=k)=P(x_1=1,x_2=0,x_3=1|y=k)
      #        =P(x_1=1|y=k)*P(x_2=0|y=k)*P(x_3=1|y=k)
      
      #Tinh P(y=k|x)
      p=zeros(K,1);
      for k=1:K
          #{
          pk=1;#posterior probability P(y=k|x)
          for(j=1:D)
            if(x(j)==1)
              pk=pk*theta_jk(j,k);
            else
              pk=pk*(1-theta_jk(j,k));
            end
           end
           pk=pk*theta_k(k);
           #}
          p(k)=0;#log of posterior probability, that is log[P(y=k|x)]
          for(j=1:D)
            if(x(j)==1)
              p(k)=p(k)+log(theta_jk(j,k));
            else
              p(k)=p(k)+log(1-theta_jk(j,k));
            end
           end
           p(k)=p(k)+log(theta_k(k));
       end
       p
       #select the greatest score
       [~,y]=max(p)