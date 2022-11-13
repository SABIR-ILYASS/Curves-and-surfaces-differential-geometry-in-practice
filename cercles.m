% trace un arc de cercle (frac represente la fraction du cercle complet a tracer, frac=1 => cercle complet)
% centree sur le point P

function cercles(Cx,Cy,Px,Py)

long=2;
R=sqrt((Px-Cx).^2+(Py-Cy).^2);
 
% on construit le cercle unite:
theta=sign(Py-Cy).*acos((Px-Cx)./R); % angle entre le vecteur (1,0) et le vecteur (Px-Cx,Py-Cy)
theta(Py==Cy)=(Px(Py==Cy)<Cx(Py==Cy))*pi;

% on trace tous les cercles:
for i=1:length(R)
    f=long/(2*pi*R(i));
    f=min(f,.25);
    t=-f/2:.01:f/2;
    x=cos(2*pi*t+theta(i));
    y=sin(2*pi*t+theta(i));
    plot(x*R(i)+Cx(i),y*R(i)+Cy(i),'Color',[0.5 0.5 0.5]);
%    plot(x*R(i)+Cx(i),y*R(i)+Cy(i),'Color',[1 0 0],'LineWidth',4);
end