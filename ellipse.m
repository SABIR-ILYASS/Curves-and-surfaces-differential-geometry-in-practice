function X=ellipse(a,b,n)

t=0:1/(n-3):1+2/(n-3);

X(1,:)=a*cos(2*pi*t);
X(2,:)=b*sin(2*pi*t);
