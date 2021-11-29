
%% ST0532623: case:1 - original data set (no fault)
clc 
clear all

load ('d00_te.dat') % load the data set
figure(1)
plot(1:52,d00_te) % plot the original data set

% We have to normalize the data set . Here i have used matlab built in
% function 'normalize'. It will scale the original data in between 0 & 1.
normalize_data=normalize(d00_te);

% After normalizing the data I will use 'center' & 'maverage' function from
% the 'datana' toolbox for centering the data and smotthing the data.
data_centered_original = center(maverage((normalize_data),13,0,1));

% Now i have applied matlab builtin function 'pca' to the center data set
% in this function coeff will give the principle component coefficients
% which is known as loadings, Score is the principle component scores,
% latent will return eigenvalues of covariance matrix of the dataset,
% tsquared is known as hotteling tsquare and explained will give the
% percentage of total variance explained by the each principle component.

[coeff0,score0,latent0,tsquared0,explained0]=pca((data_centered_original));
% now i will plot a biplot with scores and loadings of principle componet
% analysis
figure (2); hold on; grid on;
plotbi(score0,coeff0,1,2,1:size(data_centered_original,1),[],1:size(score0,1),1:size(score0,2));
figure(3); plot(tsquared0)
figure(4);plot(explained0)

%  we can determine coefficient of determination from 'explained' output of pca
rsquared=cumsum(explained0);

%DPCA (Dynamic Principle Component Analysis)
% Another apporach (related to Russel article)
% I will create the new matrix. for this i have created a function which name is 'time_lag_matrix'. 
% At first i have Created the new matrix with lag 1

lag_mat=time_lag_matrix(d00_te,1);
% After creating the new matrix i have normalized the data in the scale of 0 & 1.
norm_lag_mat=normalize(lag_mat);
% In the new normalize matrix i have applied built in function 'pca'.

[coeff0_new,score0_new,latent0_new,tsquared0_new,explained0_new]=pca((norm_lag_mat));
figure (5); hold on; grid on;
plotbi(score0_new,coeff0_new,1,2,1:size(norm_lag_mat,1),[],1:size(score0_new,1),1:size(score0_new,2));
% plot the hotteling tsquare and explained variables
figure(6); plot(tsquared0_new)
figure(7);plot(explained0_new)
% we can find the new coefficient of determination
rsquarednew=cumsum(explained0_new);

% Now Create the new matrix with lag 2
lag2_mat=time_lag_matrix(d00_te,2);
% normalize the new data
norm_lag2_mat=normalize(lag2_mat);
[coeff02_new,score02_new,latent02_new,tsquared02_new,explained02_new]=pca((norm_lag2_mat));
figure (8); hold on; grid on;
plotbi(score02_new,coeff02_new,1,2,1:size(norm_lag2_mat,1),[],1:size(score02_new,1),1:size(score02_new,2));
figure(9); plot(tsquared02_new)
figure(10);plot(explained02_new)

% Create the new matrix with lag 3
lag3_mat=time_lag_matrix(d00_te,3);
% normalize the new data
norm_lag3_mat=normalize(lag3_mat);
[coeff03_new,score03_new,latent03_new,tsquared03_new,explained03_new]=pca((norm_lag3_mat));
figure (11); hold on; grid on;
plotbi(score03_new,coeff03_new,1,2,1:size(norm_lag3_mat,1),[],1:size(score03_new,1),1:size(score03_new,2));
figure(12); plot(tsquared03_new)
figure(13);plot(explained03_new)

% Create the new matrix with lag 6

lag6_mat=time_lag_matrix(d00_te,6);
% normalize the new data
norm_lag6_mat=normalize(lag6_mat);
[coeff06_new,score06_new,latent06_new,tsquared06_new,explained06_new]=pca((norm_lag6_mat));
figure (14); hold on; grid on;
plotbi(score06_new,coeff06_new,1,2,1:size(norm_lag6_mat,1),[],1:size(score06_new,1),1:size(score06_new,2));
figure(15); plot(tsquared06_new)
figure(16);plot(explained06_new)



%% ST0532623: Case:2 (difficult data set: data set 9)
% load the data set
% all the procedure will be same as previous. that's why I ain't comment
% all the lines as it is repetation.
load ('d09_te.dat')
figure(17)
plot(1:52,d09_te)
% scale the data set
normalize_data_9=normalize(d09_te);
data_centered_original_9 = center(maverage((normalize_data_9),13,0,1));
[coeff9,score9,latent9,tsquared9,explained9]=pca((data_centered_original_9)); % done pca
figure (18); hold on; grid on;
plotbi(score9,coeff9,1,2,1:size(data_centered_original_9,1),[],1:size(score9,1),1:size(score9,2));
figure(19); plot(tsquared9)
figure(20);plot(explained9)
% coefficient of determination
rsquared9=cumsum(explained9);

%DPCA
% Create the new matrix with lag 1
lag_mat9=time_lag_matrix(d09_te,1);
% normalize the new data
norm_lag_mat_9=normalize(lag_mat9);
[coeff9_new,score9_new,latent9_new,tsquared9_new,explained9_new]=pca((norm_lag_mat_9));
figure (21); hold on; grid on;
plotbi(score9_new,coeff9_new,1,2,1:size(norm_lag_mat_9,1),[],1:size(score9_new,1),1:size(score9_new,2));
figure(22); plot(tsquared9_new)
figure(23);plot(explained9_new)
rsquarednew9=cumsum(explained9_new);

% Create the new matrix with lag 2

lag2_mat9=time_lag_matrix(d09_te,2);
% normalize the new data
norm_lag2_mat_9=normalize(lag2_mat9);
[coeff92_new,score92_new,latent92_new,tsquared92_new,explained92_new]=pca((norm_lag2_mat_9));
figure (24); hold on; grid on;
plotbi(score92_new,coeff92_new,1,2,1:size(norm_lag2_mat_9,1),[],1:size(score92_new,1),1:size(score92_new,2));
figure(25); plot(tsquared92_new)
figure(26);plot(explained92_new)
% rsquarednew9=cumsum(explained92_new)

% Create the new matrix with lag 3

lag3_mat9=time_lag_matrix(d09_te,3);
% normalize the new data
norm_lag3_mat_9=normalize(lag3_mat9);
[coeff93_new,score93_new,latent93_new,tsquared93_new,explained93_new]=pca((norm_lag3_mat_9));
figure (27); hold on; grid on;
plotbi(score93_new,coeff93_new,1,2,1:size(norm_lag3_mat_9,1),[],1:size(score93_new,1),1:size(score93_new,2));
figure(28); plot(tsquared93_new)
figure(29);plot(explained93_new)
% rsquarednew9=cumsum(explained93_new)

% Create the new matrix with lag 6

lag6_mat9=time_lag_matrix(d09_te,6);
% normalize the new data
norm_lag6_mat_9=normalize(lag6_mat9);
[coeff96_new,score96_new,latent96_new,tsquared96_new,explained96_new]=pca((norm_lag6_mat_9));
figure (30); hold on; grid on;
plotbi(score96_new,coeff96_new,1,2,1:size(norm_lag6_mat_9,1),[],1:size(score96_new,1),1:size(score96_new,2));
figure(31); plot(tsquared96_new)
figure(32);plot(explained96_new)
% rsquarednew9=cumsum(explained96_new)


%% ST0532623: Case 3: (data set 2- d02_te)
% All the process are same as previous. So I am not commenting all the
% lines.

load ('d02_te.dat')
figure(33)
plot(1:52,d02_te)
% normalize the data
normalize_data_2=normalize(d02_te);
data_centered_original_2 = center(maverage((normalize_data_2),13,0,1));
[coeff2,score2,latent2,tsquared2,explained2]=pca((data_centered_original_2)); % done pca
figure (34); hold on; grid on;
plotbi(score2,coeff2,1,2,1:size(data_centered_original_2,1),[],1:size(score2,1),1:size(score2,2));
figure(35); plot(tsquared2)
figure(36);plot(explained2)
% coefficient of determination
% rsquared2=cumsum(explained2)

%DPCA
% Create the new matrix with lag 1
lag_mat2=time_lag_matrix(d02_te,1);
% normalize the new data
norm_lag_mat_2=normalize(lag_mat2);
[coeff2_new,score2_new,latent2_new,tsquared2_new,explained2_new]=pca((norm_lag_mat_2));
figure (37); hold on; grid on;
plotbi(score2_new,coeff2_new,1,2,1:size(norm_lag_mat_2,1),[],1:size(score2_new,1),1:size(score2_new,2));
figure(38); plot(tsquared2_new)
figure(39);plot(explained2_new)
% rsquarednew2=cumsum(explained2_new)

% Create the new matrix with lag 2
lag_mat2_2=time_lag_matrix(d02_te,2);
% normalize the new data
norm_lag_mat_2_2=normalize(lag_mat2_2);
[coeff2_new_2,score2_new_2,latent2_new_2,tsquared2_new_2,explained2_new_2]=pca((norm_lag_mat_2_2));
figure (40); hold on; grid on;
plotbi(score2_new_2,coeff2_new_2,1,2,1:size(norm_lag_mat_2_2,1),[],1:size(score2_new_2,1),1:size(score2_new_2,2));
figure(41); plot(tsquared2_new_2)
figure(42);plot(explained2_new_2)

% Create the new matrix with lag 3
lag_mat2_3=time_lag_matrix(d02_te,3);
% normalize the new data
norm_lag_mat_2_3=normalize(lag_mat2_3);
[coeff2_new_3,score2_new_3,latent2_new_3,tsquared2_new_3,explained2_new_3]=pca((norm_lag_mat_2_3));
figure (43); hold on; grid on;
plotbi(score2_new_3,coeff2_new_3,1,2,1:size(norm_lag_mat_2_3,1),[],1:size(score2_new_3,1),1:size(score2_new_3,2));
figure(44); plot(tsquared2_new_3)
figure(45);plot(explained2_new_3)

% Create the new matrix with lag 6
lag_mat2_6=time_lag_matrix(d02_te,6);
% normalize the new data
norm_lag_mat_2_6=normalize(lag_mat2_6);
[coeff2_new_6,score2_new_6,latent2_new_6,tsquared2_new_6,explained2_new_6]=pca((norm_lag_mat_2_6));
figure (46); hold on; grid on;
plotbi(score2_new_6,coeff2_new_6,1,2,1:size(norm_lag_mat_2_6,1),[],1:size(score2_new_6,1),1:size(score2_new_6,2));
figure(47); plot(tsquared2_new_6)
figure(48);plot(explained2_new_6)

%% ST0532623: Case 4:( Data set 18-d18_te)
% All the process are same as previous that's why i am not commenting all
% the lines as it is repetation.

load ('d18_te.dat')
figure(49)
plot(1:52,d18_te)
% normalize the data
normalize_data_18=normalize(d18_te);
data_centered_original_18 = center(maverage((normalize_data_18),13,0,1));
[coeff18,score18,latent18,tsquared18,explained18]=pca((data_centered_original_18));
figure (50); hold on; grid on;
plotbi(score18,coeff18,1,2,1:size(data_centered_original_18,1),[],1:size(score18,1),1:size(score18,2));
figure(51); plot(tsquared18)
figure(52);plot(explained18)
% coefficient of determination
% rsquared2=cumsum(explained2)
%DPCA
% Create the new matrix with lag 1
lag_mat18=time_lag_matrix(d18_te,1);
% normalize the new data
norm_lag_mat_18=normalize(lag_mat18);
[coeff18_new,score18_new,latent18_new,tsquared18_new,explained18_new]=pca((norm_lag_mat_18));
figure (53); hold on; grid on;
plotbi(score18_new,coeff18_new,1,2,1:size(norm_lag_mat_18,1),[],1:size(score18_new,1),1:size(score18_new,2));
figure(54); plot(tsquared18_new)
figure(55);plot(explained18_new)
% rsquarednew2=cumsum(explained2_new)

% Create the new matrix with lag 2
lag_mat18_2=time_lag_matrix(d18_te,2);
% normalize the new data
norm_lag_mat_18_2=normalize(lag_mat18_2);
[coeff18_new_2,score18_new_2,latent18_new_2,tsquared18_new_2,explained18_new_2]=pca((norm_lag_mat_18_2));
figure (56); hold on; grid on;
plotbi(score18_new_2,coeff18_new_2,1,2,1:size(norm_lag_mat_18_2,1),[],1:size(score18_new_2,1),1:size(score18_new_2,2));
figure(57); plot(tsquared18_new_2)
figure(58);plot(explained18_new_2)

% Create the new matrix with lag 3
lag_mat18_3=time_lag_matrix(d18_te,3);
% normalize the new data
norm_lag_mat_18_3=normalize(lag_mat18_3);
[coeff18_new_3,score18_new_3,latent18_new_3,tsquared18_new_3,explained18_new_3]=pca((norm_lag_mat_18_3));
figure (59); hold on; grid on;
plotbi(score18_new_3,coeff18_new_3,1,2,1:size(norm_lag_mat_18_3,1),[],1:size(score18_new_3,1),1:size(score18_new_3,2));
figure(60); plot(tsquared18_new_3)
figure(61);plot(explained18_new_3)

% Create the new matrix with lag 6
lag_mat18_6=time_lag_matrix(d18_te,6);
% normalize the new data
norm_lag_mat_18_6=normalize(lag_mat18_6);
[coeff18_new_6,score18_new_6,latent18_new_6,tsquared18_new_6,explained18_new_6]=pca((norm_lag_mat_18_6));
figure (62); hold on; grid on;
plotbi(score18_new_6,coeff18_new_6,1,2,1:size(norm_lag_mat_18_6,1),[],1:size(score18_new_6,1),1:size(score18_new_6,2));
figure(63); plot(tsquared18_new_6)
figure(64);plot(explained18_new_6)

% Reference for 'center' and 'maverage' code: Teaching assistant has
% provided sample solution in Exercise 3 task 5. It was uploded in the
% moodle.
