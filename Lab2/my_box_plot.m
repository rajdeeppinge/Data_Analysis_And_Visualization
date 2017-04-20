function [q1,q2,q3] = my_box_plot(x,x_s,x_e,range_x,range_y)

x= sortrows(x); 

N= length(x);
min_n = x(1);

max_n= x(N);

q2= x(floor((N+1)/2));
q1= x(floor((N+1)/4));
q3=  x(floor(3*(N+1)/4));

axis([0 range_x 0 range_y]);

line([x_s,x_e],[min_n,min_n],[0,0],'LineStyle','-','Color','r');
line([x_s,x_e],[max_n,max_n],[0,0],'LineStyle','-','Color','g');
line([x_s,x_e],[q1,q1],[0,0],'LineStyle','-','Color','c');
line([x_s,x_e],[q2,q2],[0,0],'LineStyle','-','Color','m');
line([x_s,x_e],[q3,q3],[0,0],'LineStyle','-','Color','k');

%txt1 = strcat('\leftarrow min',num2str(min_n) );
%text(x_e,min_n,txt1);
  text(x_e+0.5,min_n,[ 'Min ' '(' num2str(min_n) ')'])
  text(x_e+0.5,q1,[ 'Q1 ' '(' num2str(q1) ')'])
  text(x_e+0.5,q2,[ 'Q2 ' '(' num2str(q2) ')'])
  text(x_e+0.5,q3,[ 'Q3 ' '(' num2str(q3) ')'])
  text(x_e+0.5,max_n,[ 'Max ' '(' num2str(max_n) ')'])
