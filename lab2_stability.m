% LAB 2 FLIGHT TRAJECTORY SCRIPT

function f = lab2_script()


LN = .1;
D = .05;
alpha = .5;

fin_num = 4;
CR = .06;
CT = .025;
XF = .39;
XS = .045;
CN_an = 2;
S = 0.04; 
LF = sqrt(S^2 + (XS + (CT/2) - (CR/2))^2);
XN = alpha*LN;
beta = 16;
X_cg = .25;

CN_af = beta*((S/D)^2)/(1 + sqrt(1 + (2*LF/(CR +CT))^2));
K_fb = 1 + (D/(2*S + D));
CN_fb = K_fb* CN_af;

Xf = XF +(XS*(CR +2*CT))/(3*(CR + CT)) +....
        (1/6)*(CR + CT - CR*CT/(CR + CT));
X_cp = (CN_an*XN + CN_fb*Xf)/(CN_an + CN_fb);  

static_margin = (X_cp - X_cg)/D;


fprintf('Static Margin = %10.3f\n',static_margin);
f = X_cp;

end