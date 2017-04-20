close all;

% first get mean compara for bit rates summed across the other

% average for bit rate summed across upscales
%X_b3_str= mean(vid_1data(1:8,27))
%X_b6_str= mean(vid_1data(9:16,27))
%X_b9_str= mean(vid_1data(17:24,27))

vid1 = mean(mean(vid_1data))
vid2 = mean(mean(vid_2data))
vid3 = mean(mean(vid_3data))


group_std_table_1 = [std(vid_1data(1:8, :)'); std(vid_1data(9:16, :)'); std(vid_1data(17:24, :)')];
group_std_table_2 = [std(vid_2data(1:8, :)'); std(vid_2data(9:16, :)'); std(vid_2data(17:24, :)')];
group_std_table_3 = [std(vid_3data(1:8, :)'); std(vid_3data(9:16, :)'); std(vid_3data(17:24, :)')];



group_avg_table_1 = [mean(vid_1data(1:8, :), 2)'; mean(vid_1data(9:16, :), 2)'; mean(vid_1data(17:24, :), 2)'];
group_avg_table_2 = [mean(vid_2data(1:8, :), 2)'; mean(vid_2data(9:16, :), 2)'; mean(vid_2data(17:24, :), 2)'];
group_avg_table_3 = [mean(vid_3data(1:8, :), 2)'; mean(vid_3data(9:16, :), 2)'; mean(vid_3data(17:24, :), 2)'];


l1 = group_avg_table_1(1, :);
l2 = group_avg_table_1(2, :);
l3 = group_avg_table_1(3, :);

avgLine = mean(group_avg_table_1(:, 1:8));

plot(l1, 'LineWidth', 2)
hold on
plot(l2, 'LineWidth', 2)
hold on
plot(l3, 'g', 'LineWidth', 2)
hold on
plot(avgLine, 'LineWidth', 2)
hold on
plot(4.5, mean(l1), 'bo', 'LineWidth', 2)
hold on
plot(4.5, mean(l2), 'ro', 'LineWidth', 2)
hold on
plot(4.5, mean(l3), 'go', 'LineWidth', 2)
title('Interaction Visualization Plot for video src01')
xlabel('Upscaler')
ylabel('Average Rating')
legend('bit rate 3 Mbps', 'bit rate 6 Mbps', 'bit rate 9 Mbps', 'Average Over Bit rate', 'Upscaler avg for bit rate 3 Mbps', 'Upscaler avg for bit rate 6 Mbps', 'Upscaler avg for bit rate 9 Mbps' )
set(gca,'FontSize',16)
set(findall(gcf,'type','text'),'FontSize',16)
print('Interaction_src01','-djpeg')




l1 = group_avg_table_2(1, :);
l2 = group_avg_table_2(2, :);
l3 = group_avg_table_2(3, :);

avgLine = mean(group_avg_table_2(:, 1:8));

figure
plot(l1, 'LineWidth', 2)
hold on
plot(l2, 'LineWidth', 2)
hold on
plot(l3, 'g', 'LineWidth', 2)
hold on
plot(avgLine, 'LineWidth', 2)
hold on
plot(4.5, mean(l1), 'bo', 'LineWidth', 2)
hold on
plot(4.5, mean(l2), 'ro', 'LineWidth', 2)
hold on
plot(4.5, mean(l3), 'go', 'LineWidth', 2)
title('Interaction Visualization Plot for video src02')
xlabel('Upscaler')
ylabel('Average Rating')
legend('bit rate 3 Mbps', 'bit rate 6 Mbps', 'bit rate 9 Mbps', 'Average Over Bit rate', 'Upscaler avg for bit rate 3 Mbps', 'Upscaler avg for bit rate 6 Mbps', 'Upscaler avg for bit rate 9 Mbps' )
set(gca,'FontSize',16)
set(findall(gcf,'type','text'),'FontSize',16)
print('Interaction_src02','-djpeg')


l1 = group_avg_table_3(1, :);
l2 = group_avg_table_3(2, :);
l3 = group_avg_table_3(3, :);

avgLine = mean(group_avg_table_3(:, 1:8));

figure
plot(l1, 'LineWidth', 2)
hold on
plot(l2, 'LineWidth', 2)
hold on
plot(l3, 'g', 'LineWidth', 2)
hold on
plot(avgLine, 'LineWidth', 2)
hold on
plot(4.5, mean(l1), 'bo', 'LineWidth', 2)
hold on
plot(4.5, mean(l2), 'ro', 'LineWidth', 2)
hold on
plot(4.5, mean(l3), 'go', 'LineWidth', 2)
title('Interaction Visualization Plot for video src05')
xlabel('Upscaler')
ylabel('Average Rating')
legend('bit rate 3 Mbps', 'bit rate 6 Mbps', 'bit rate 9 Mbps', 'Average Over Bit rate', 'Upscaler avg for bit rate 3 Mbps', 'Upscaler avg for bit rate 6 Mbps', 'Upscaler avg for bit rate 9 Mbps' )
set(gca,'FontSize',16)
set(findall(gcf,'type','text'),'FontSize',16)
print('Interaction_src05','-djpeg')

%%%%%%%%5 vid 1
% average for bitrate summing across upscales.
% X_b_star= sum(group_avg_table,2)/8
% 
% % average for upscales summing across bitrates
% X_star_up= sum(group_avg_table,1)/3