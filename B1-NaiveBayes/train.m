function [theta_k,theta_jk]=train(X,y)
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
        index=(y==k);
        theta_k(k)=sum(index);
      end
      N=length(y);  
      
      
      
      for k=1:K
          #theta_jk=count(x_j==1 and y==k)/count(y=k)
          index=(y==k);
          X_k=X(index,:);
          theta_jk(:,k)=sum(X_k)./theta_k(k);
      end  
      
      theta_k=theta_k./N;
endfunction