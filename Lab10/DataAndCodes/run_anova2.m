%%%% run anova2 on anovaamatrices generated

% rows: bit rates columns: upscalers

% src 1 
[p1,tbl] = anova2(anova2_vid1_mat,26);

% src 2 
[p2,tb2] = anova2(anova2_vid2_mat,26);

% src 3 
[p3,tb3] = anova2(anova2_vid3_mat,26);
