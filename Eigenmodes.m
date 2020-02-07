nx = 50;
ny = 50;

G = sparse(nx*ny, nx*ny);
Delta = 1;

for j = 1:ny
    
   for i = 1:nx
      
       n = j + (i - 1)*ny;
       nxm = j + (i - 2)*ny;
       nxp = j + i*ny;
       nym = (j - 1) + (i - 1)*ny;
       nyp = (j + 1) + (i - 1)*ny;
       
       if i == 1 || i == nx || j == 1 || j == 1 || j == ny
          
           G(n,:) = 0;
           G(n,n) = 1;
           
       else
           
           G(n,n) = -4/Delta;
           G(n,nym) = 1/Delta;
           G(n,nyp) = 1/Delta;
           G(n, nxp) = 1/Delta;
           G(n, nxm) = 1/Delta;
           
       end
       
   end
    
end

[E, D] = eigs(G, 9, 'SM');

for n = 1:9
   
    currentE = E(:,n);
    currentE = reshape(currentE, [ny nx]);
    figure;
    surf(currentE);
    
end
