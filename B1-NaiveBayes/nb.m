#Naive Bayes Model

  #step1: Load Data set
  A=load('auto.txt');
  X=A(:,1:3);
  y=A(:,4);
  y=y+1;
  
  
  #step2:Training:
  [theta_k,theta_jk]=train(X,y);
  
  #step3:Classify a new data point
  #X=[1,0,1,0];
  #0,1,0,1]
  
  #classify the training data
  y_predicted=classify(X,theta_k,theta_jk);
  
  #accuracy of model
  match=(y==y_predicted);
  printf("accuracy = %6.4f\n",sum(match)/length(match));