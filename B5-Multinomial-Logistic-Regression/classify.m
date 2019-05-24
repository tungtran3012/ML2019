function y= classify(x,theta)
  score=g(x*theta);
  [~,y]=max(score);
end