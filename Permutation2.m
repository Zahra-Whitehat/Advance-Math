function Det = Permutation(Matrix)
 [r,c] = size(Matrix)
  perm_sign = 1
  a = 1
  for fc = 1 : r
      a = a*fc
  endfor
  results = zeros(a , r)
  p = [1 : r]
  all_perms = perms (p)
  for n = 1 : a
    for l = 1 : c
       results(n,l) = Matrix(i , (all_perms(n,l))
    #endfor
 # endfor
  result = 0 
  for i = 1 : c
   #  perm_i = Matrix( i , : )
    # perm_i = p
       for k = 1 : length(Matrix)
          for h = k+1 : length(Matrix)
                if (all_perms(k) > all_perms(h))
                    tmp = all_perms(h) ;
                   all_perms(h) = all_perms(k)
                    all_perms(k) = tmp
                    perm_sign = -1*perm_sign
                    result = result + perm_sign*(prod(all_perms))
                endif
            endfor
        endfor      
    endfor
    
     Det = sum(result)
endfunction