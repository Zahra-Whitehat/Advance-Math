

function Jac = jacobi()
  A =  [2 3 1 ; -3 2 2 ; 1 2 1]

    for m = 1 : 7
     U = zeros(3) ;
      #Constructing B that is A without the main diagonal
          B = zeros(3);
          for( i = 1 : 3 )
           for(  j = 1 : 3 )
               if( i == j )
                   continue
               else
                   B(i,j)= B(i,j)+ A(i,j) ;
               end 
           endfor
         endfor
         B 
        #Findind the max off-diagonal element of A by means of B
         Max_of_B = max(max(B));
         [row,column] = find(B == Max_of_B) ;
         a = [row,column];
         a_sorted = sortrows(a);
         Max_index = a_sorted(1, : );
         #Constructing matrix U by means of phi which found by A and max element
         phi = (1/2)*atan(2*A(Max_index(1,1), Max_index(1,2))/ A(Max_index(1,1), Max_index(1,1))-A(Max_index(1,2), Max_index(1,2))) ;
         for i = 1 : 3
           for j = 1: 3
             if i == j
                 if  (i ==  Max_index(1,1) || i == Max_index(1,2))
                    U(i,j) = cos(phi) ;
                  else
                     U(i,j) = 1 ;
                   end
              elseif ( i ==  Max_index(1,1)) || (i == Max_index(1,2) ) 
                   U(Max_index(1,1), Max_index(1,2)) = -sin(phi) ;
                   U(Max_index(1,2), Max_index(1,1)) = sin(phi) ;
               end
          endfor
         endfor
         U
         U'
         #Creating the new A for next round
         A = U'*A*U
         %{Condition for breaking the algorithm
         acc = max(max(abs(A)));
         %}
      %}   
       endfor
        
% for i = 1 : 3
  
%  for j = 1 : 4
    %for k = 1 : 4
      %B =  A + 3 ;
    %endfor
  %endfor
  %B
  
  %for j = 1 : 4
    %for k = 1 : 4
    %  U = 3 * A ;
      %U = 2*U;
    %endfor
  %endfor
  %U
  %A = 2*U
%endfor
%C = B
  
    
%
 

%  The function jacobi applies Jacobi's method to solve A*x = b.
 

%  On entry:
 

%    A       coefficient matrix of the linear system;
 

%    b       right-hand side vector of the linear system;
 

%    x       initial approximation;
 

%    eps     accuracy requirement: stop when norm(dx) < eps;
 

%    N       maximal number of steps allowed.
 

%  On return:
 

%    x       approximation for the solution of A*x = b;
 

%    dx      vector last used to update x,
 

%            if success, then norm(dx) < eps.
 
%
 

%  Example:
 

%    Q = orth(rand(5)); D = diag(rand(1,5));
 

%    A = Q*D*Q'; z = rand(5,1); b = A*z;
 

%    x = z + rand(5,1)*1e-4;
 

%    [x,dx] = jacobi(A,b,x,1e-8,50)
 
%
 
%{
n = size(A,1);

fprintf('Running the method of Jacobi...\n');

for i = 1:N

   dx = b - A*x;

   for j = 1:n

      dx(j) = dx(j)/A(j,j);

      x(j) = x(j) + dx(j);

   end;

   fprintf('  norm(dx) = %.4e\n', norm(dx));

   if (norm(dx) < eps)

      fprintf('Succeeded in %d steps\n', i);

      return;

   end;

end;

fprintf('Failed to reached accuracy requirement in %d steps.\n', N);

%}

endfunction
