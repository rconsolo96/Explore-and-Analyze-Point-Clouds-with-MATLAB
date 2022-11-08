% Explore and Analyze Point Clouds with MATLAB

%% Use the 'GenerateSamplePointClouds' to generate the two sample point cloud objects that can be used with the apps. 
if exist('SamplePointClouds.mat', 'file')
    load('SamplePointClouds.mat');
else
    [pCloud, pCloud_DownSampled] = GenerateSamplePointClouds;
    save('SamplePointClouds.mat', 'pCloud', 'pCloud_DownSampled');
end

%% You can visualize the point clouds using 'pcshow':
pcshow(pCloud);

%% Once you have the point cloud objects loaded in the MATLAB workspace, run the ExplorePointCloud App
ExplorePointCloud(pCloud_DownSampled);

%% If you have the 'Objects' cell array containing the sub point clouds loaded in the MATLAB workspace, run the AnalyzePointCloud App:
AnalyzePointCloud(Objects);

%% Now try the Apps with your own Point Clouds!