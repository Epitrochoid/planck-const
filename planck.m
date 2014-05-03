lambda = [3650.153, 4046.563, 4358.328, 5460.735, 5790.65] .* 10^-10;
f = 3e8 ./ lambda;

V = [1.93, 1.615, 1.39, 0.80, 0.68];


syms h_over_e psi_over_e
solutions = [];

for i = 1:5
   for j = 1:5
       if i ~= j
           eqns = [V(i) == h_over_e * f(i) - psi_over_e, V(j) == h_over_e * f(j) - psi_over_e];
           solution = vpasolve(eqns, [h_over_e, psi_over_e], [3.8e-15, 1.5]);
           solutions = [solutions solution];
       end
   end
end    

    
psi_over_e_vals = solutions.psi_over_e;
psi_over_e_mean = mean(psi_over_e_vals)

h_over_e_vals = solutions.h_over_e;
h_over_e_mean = mean(h_over_e_vals)
