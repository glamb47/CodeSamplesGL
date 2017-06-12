% Garret Lamb
clf; % clear figure
P1 = imread('planes1.jpg'); % load image as an array
figure
colormap(gray);
subplot(5,1,1);
imagesc(P1); % plot image
axis off;
title('Planes 1', 'FontWeight', 'bold');
subplot(5,1,2);
P2 = imread('planes2.jpg');
imagesc(P2);
axis off;
title('Planes 2', 'FontWeight', 'bold');
Diff = P1 - P2; % create image showing difference of two images
subplot(5,1,3);
imagesc(Diff);
axis off;
title('Difference', 'FontWeight', 'bold');
[row, col] = find(Diff == max(Diff(:)));
hold on;
plot(42,201,'.r');
text(50,230,'max','Color','red');
BW = im2bw(Diff, .1); % create black and white image
subplot(5,1,4);
imagesc(BW);
axis off;
title('Difference > thresholdValue', 'FontWeight', 'bold');
maskluster = im2bw(Diff, .1);
num_rows = size(maskluster, 1); % set variable to number of rows
num_cols = size(maskluster, 2); % set variable to number of columns
for i = 2:1:250;
    for j = 2:1:231; % nested for loop to go through every pixel
        neighborhood = maskluster(i-1:i+1,j-1:j+1); % filter mask
       if sum(sum(neighborhood)) <= 3, maskluster(i,j) = 0; % set pixel to 0 if the sum of the neighborhood is less than or equal to 3
       end;
    end;
end;
subplot(5,1,5);
imagesc(maskluster);
axis off;
title('Masked and Clustered', 'FontWeight', 'Bold');
clusters = find_clusters_above_threshold(maskluster, 1, sqrt(2), 19); % find clusters, returns cells containing locations of clusters (row,col)
cluster_1 = rectangle('Position', [40, 184, 19, 20]); % place rectangle (x,y,width,height)
set(cluster_1, 'EdgeColor', [0, 1, 0]); % make perimiter of rectangle green
cluster_2 = rectangle('Position', [79, 224, 20, 21]);
set(cluster_2, 'EdgeColor', [0, 1, 0]);
cluster_3 = rectangle('Position', [106, 129, 17, 20]);
set(cluster_3, 'EdgeColor', [0, 1, 0]);