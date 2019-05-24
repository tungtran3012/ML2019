function accuracy=eval(X,y,theta)
  M=length(y);
  prediction=zeros(M,1);
  for i=1:M
    prediction(i)=classify(X(i,:),theta);
  end
  correct=sum(y==prediction);
  accuracy=correct/M;
end