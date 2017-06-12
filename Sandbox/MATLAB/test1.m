% Garret Lamb
clf; % clear figure
colormap(gray);
P1 = imread('planes1.jpg'); % load image as an array
subplot(5,1,1);
subplot(5,1,2);
subplot(5,1,3);
subplot(5,1,4);
subplot(5,1,5);
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
mask = BW;
neighborhood = mask(i-1:i+1,j-1:j+1);
for i = 1:1:251;
    for j = 1:1:232;
        if sum(sum(BW(neighborhood))) <= 3;
            mask(i,j) = 0;
        end
    end
end
subplot(5:1:5);
imagesc(BW);