function X=saisir_courbe()


cont=true;
X=[];
figure;
axis equal;
axis([0 10 0 10]);
hold on;

while cont
    [x,y,button] = ginput(1);
    if(button==3)
        cont=false;
    else
        plot(x,y,'.r');
        X(:,end+1)=[x;y];
    end
end
