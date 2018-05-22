
a = 2.111e-5;
n = 0.62;
m_dotox = 1.916e-3;
rho_f = 1180;
t = linspace(0,60,6000);
D_i = 0.5*0.0254;
L = 5.858*0.0254;
relation = ((2^(2*n+1)*(2*n + 1)*a)/(pi^n*D_i^(2*n+1)))*m_dotox^n.*t;

D_t = D_i.*(relation + 1).^(1/(2*n+1));
r_t = 0.5*D_t;

J_ox = m_dotox./(pi*(r_t.^2));


% find the derivative of r_t


r_dot =a*(J_ox.^n);

m_dotf = r_dot*pi*rho_f.*D_t*L;
OF_ratio = m_dotox./m_dotf;


mw_f = 100.114;
mw_ox = 16;
eq_ratio = (mw_f/mw_ox)*OF_ratio;
 plot(t,eq_ratio)
 xlabel('time (sec)')
 ylabel('equivalence ratio')
