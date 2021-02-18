function Det = Permutation(Matrix)
 [r,c] = size(Matrix)
  a = 1;
  
  for fc = 1 : r
      a = a*fc;
  endfor
  results = zeros(a , r);
  perm_sign = ones(a,1);
  fin_results = ones(a,1);
  p = [1 : r]
  all_perms = perms (p)
  
  for n = 1 : a
     for l = 1 : c
         results(n,l) = Matrix(l, (all_perms(n,l)));
    endfor
  endfor
  results
  result = 0; 

  for x = 1 : a
       for k = 1 : r
          for h = k+1 : r
                if (all_perms(x,k) > all_perms(x,h))
                    tmp = all_perms(x,h) ;
                    all_perms(x,h) = all_perms(x,k);
                    all_perms(x,k) = tmp;
                    perm_sign(x) = (-1)*perm_sign(x);
            endif
                    result =  perm_sign(x)*(prod(results(x,:)));
                    fin_results(x) = result;
            endfor
      endfor    
   endfor
   Det  = sum(fin_results)
endfunction


