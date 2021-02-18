#This is a program Jacobi method of matrix n*n written by Zahra Dorostkar

function Jac = Jacobi()
  k = 20
  D = [1 , -3 , 5 , 7 ; -3 , 9 , 11 , 13 ; 5 , 11 , 15 , -17 ; 7 , 13 , -17 , 19]
  C = [ 0.5 , 0 , 1 , 1 ; 0 , 0.5 , 0 , 0 ; 1 , 0 , 0.5 , 0 ; 1 , 0 , 0 , 0.5]
  A = D + k*C
  acc = 100 ; 
  
 %{   while(true)
    if acc < 0.001
      break
    endif
    %}
    for m = 1 : 7
     U = zeros(4) ;
      #Constructing B that is A without the main diagonal
          B = zeros(4);
          for( i = 1 : 4 )
           for(  j = 1 : 4 )
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
         for i = 1 : 4
           for j = 1: 4
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
   %  endwhile
   
endfunction

