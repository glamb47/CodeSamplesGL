% Garret Lamb
function Z = juliaF(c, maxstep, m, wid) % define function
cx=0; cy=0; % center of a rectangle
x=linspace(cx-wid,cx+wid,m); % real
y=linspace(cy-wid,cy+wid,m); % imaginary
[X,Y]=meshgrid(x,y);
Z=X+1i*Y; % juliaset function
for k=1:maxstep; % run the function maxstep times
  Z=Z.^2+c; % z is repeatedly updated
  W=exp(-abs(Z)); % color test
end
colormap prism(256)
pcolor(W); % pseudocolor plot / show W
shading flat; % each line/face has a constant color
xlabel(['c = ', num2str(c)]) % add x- axis label with variable c