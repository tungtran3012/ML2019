function y=classify(X,theta_k,theta_jk)
  N=size(X,1);
  y=zeros(N,1);
  [D,K]=size(theta_jk);
  #{
  for i=1:size(X)(1)
      p=zeros(K,1);
      for k=1:K
          p(k)=0;
          for(j=1:D)
            if(X(i,j)==1)
              p(k)=p(k)+log(theta_jk(j,k));
            else
              p(k)=p(k)+log(1-theta_jk(j,k));
            end
           end
           p(k)=p(k)+log(theta_k(k));
       end
       p
       #select the greatest score
       [~,y(i)]=max(p);
  end 
  #}
  for i=1:size(X)(1)
      p=zeros(K,1);
      for k=1:K
          p(k)=0;
          for(j=1:D)
            if(X(i,j)==1)
              p(k)=p(k)+log(theta_jk(j,k));
            else
              p(k)=p(k)+log(1-theta_jk(j,k));
            endif
           endfor
           p(k)=p(k)+log(theta_k(k));
       endfor
       p
       #select the greatest score
       [~,y(i)]=max(p);
  endfor 
end