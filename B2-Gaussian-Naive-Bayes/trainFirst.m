A=load('wdbc.data');
y=A(:,2);
X=A(:,3:end);
C=sum(y==0);     #ung thư ác tính malignant(0): 212
NC=length(y)-C;  #ung thư lành tính benign(1): 357

X_0=X(y==0,:);   #Lấy tất cả các hàng mà có y=0, những bệnh nhân có nhãn là 0(bệnh nhân ung thư)
size(X_0);
mu0=mean(X_0);    #Lấy trung bình các hàng của tất cả các cột X_0

X_1=X(y==1,:);
size(X_1);
mu1=mean(X_1);

sigma0=std(X_0);  #Độ lệch chuẩn của các feature bệnh nhân ung thư với giá trị trung bình
sigma1=std(X_1);