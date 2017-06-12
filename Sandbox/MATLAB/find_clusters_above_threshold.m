function clusters = find_clusters_above_threshold(image, thresholdValue, neighborDistance, minimumClusterSize)
% find_clusters_above_threshold(image, thresholdValue, neighborDistance, minimumClusterSize).  Finds clusters in the given 2D image.  
% 
% Finds clusters in the given 2D image.  All pixels in the cluster are >= thresholdValue and <= neighborDistance 
% pixel-widths away from at least one other pixel in the cluster.  Only clusters with at least minimumClusterSize 
% pixels in them are returned.  The return value is a 1xN cell array, where N is the number of clusters found.  Each cell 
% contains a Mx2 array of the locations (row, col) of the M pixels in the cluster.

%% Threshold the image and get a list of pixels exceed the threshold
[rows, cols] = find(image >= thresholdValue);
pixelLocations = cat(2, rows, cols);

%% Create 1-pixel cluster lists
clusterLists = cell(length(pixelLocations), 1);
for ndx = 1 : length(pixelLocations)
    clusterLists{ndx} = pixelLocations(ndx, :);
end

%% Keep comparing the pixels in clusterLists{1} with the pixels in
% clusterLists{2:end}.  If a neighbor is found, merge the list with
% clusterLists{1}.  No neighbors are found, move clusterLists{1} to
% clusters, which is the final output.
clusters = [];
while size(clusterLists, 1) > 1
    merged = false;
    for clusterNdx = 2 : size(clusterLists, 1)
        for pixelNdx = 1 : size(clusterLists{1}, 1)
            for otherPixelNdx = 1 : size(clusterLists{clusterNdx}, 1)
                pixel = clusterLists{1}(pixelNdx, :);
                otherPixel = clusterLists{clusterNdx}(otherPixelNdx, :);
                dist = sqrt( (pixel(1) - otherPixel(1))^2 + (pixel(2) - otherPixel(2))^2 );
                if dist <= (neighborDistance + eps)
                    clusterLists{1} = cat(1, clusterLists{1}, clusterLists{clusterNdx});
                    clusterLists(clusterNdx) = [];
                    merged = true;
                    break;
                end
            end
            if merged
                break;
            end
        end

        if merged
            break;
        end
        
    end

    if ~merged
        clusters = [clusters clusterLists(1)];
        clusterLists(1) = [];
    end

end

if size(clusterLists, 1) == 1
    clusters = [clusters clusterLists(1)];
    clusterLists(1) = [];
end

%% Eliminate clusters that are too small
for ndx = size(clusters, 2) : -1 : 1
    if size(clusters{1, ndx}, 1) < minimumClusterSize
        clusters(ndx) = [];
    end
end

