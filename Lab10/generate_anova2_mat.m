clear;
close all;

% read in data correctly
load('vid_1data.mat')
load('vid_2data.mat')
load('vid_3data.mat')

%%%%%%%%%%%%%%%%555

% generate anova2 data matrices for vid 1,2 and 3

anova2_vid1_mat= vid_1data(1:8,:)';
anova2_vid1_mat= [anova2_vid1_mat; vid_1data(9:16,:)'];
anova2_vid1_mat= [anova2_vid1_mat; vid_1data(17:24,:)'];

save('anova2_vid1_mat.mat','anova2_vid1_mat');

%%%%%%%%%%%%%%%%%% for vid 2

anova2_vid2_mat= vid_2data(1:8,:)';
anova2_vid2_mat= [anova2_vid2_mat; vid_2data(9:16,:)'];
anova2_vid2_mat= [anova2_vid2_mat; vid_2data(17:24,:)'];

save('anova2_vid2_mat.mat','anova2_vid2_mat');

%%%%%%%%%%%%%%%%5 for vid 3

anova2_vid3_mat= vid_3data(1:8,:)';
anova2_vid3_mat= [anova2_vid3_mat; vid_3data(9:16,:)'];
anova2_vid3_mat= [anova2_vid3_mat; vid_3data(17:24,:)'];

save('anova2_vid3_mat.mat','anova2_vid3_mat');
