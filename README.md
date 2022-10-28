# Explore and Analyze Point Clouds with MATLAB

## Description

This demo includes two proof of concept apps designed using MATLAB® App Designer and the Computer Vision Toolbox™. The goal of these apps is to showcase some of the point cloud processing functionalities that can be performed using MATLAB. 

### ExplorePointCloud App
The "ExplorePointCloud" App allows the user to load a point cloud object and easily navigate through and around it, using keyboard shortcuts and the mouse pointer. The app also enables the selection of certain regions of interest within the point cloud which can then be saved as separate point cloud objects. This app is useful for inspection of point clouds, for example scans of building/ construction sites, or driving scenarios that have been recorded using LIDAR sensors. The selection and extraction feature of the app is also useful to easily generate smaller point cloud of objects, which can then be analyzed individually. 

### AnalyzePointCloud App
The "AnalyzePointCloud" App loads the selected sub point clouds extracted using the "ExplorePointCloud" App and allows the user to perform some analysis on them. These functionalities include shape fitting, clustering and feature measurement of the point cloud objects. The app also provides the option to save the processed point clouds objects to a file, or even generate the code of the function that generates them, so that it can be used programmatically. This app is useful to interactively apply and test many of the point cloud processing functionalities that MATLAB offers. The app is also convenient to analyze and measure any kind of object scanned in the point cloud, and to generate code that can be used in an automated workflow. 


## Usage
I included the MATLAB script used to generate the sample point clouds used to test the apps during development. It produces two point cloud objects, the original and the down-sampled version, that you can use to familiarize with the app functionalies. Depending on the specs of the machine used, it might be recommended to use the down-sampled point cloud to observe improved performance. Note that if you generate code from the "AnalyzePointCloud" App using the down-sampled point cloud, you can reuse the same code on the fully sampled pointcloud, to extract the same objects at a higher point density. 

Additionally, note that once you use a different point cloud object with the apps, you might need to modify some of the 'hyperparameters' in the 'properties' section of the app, in case you notice that the app is not working as expected. Hyperparameters such as 'MouseRatio' or 'TimerPeriod' will depend on the machine settings and mouse sensitivity used to run the apps. Meanwhile other hyperparameters such as 'PointSize', 'PointDensity' and 'ObjectSizes' will depend on the format/size/density of the point cloud object used. 

Once a point cloud object is loaded in the MATLAB workspace, you can run the "ExplorePointCloud" App either using app designer or using the command window by passing the point cloud object as the only input argument to the app. Please see the following example syntax for running this app in the command window:

    >> ExplorePointCloud(pCloud); %pCloud is any point cloud object in the workspace

The "ExplorePointCloud" App includes an 'instructions' tab that describes all the possible shortcuts that can be used in the app.

After you select and save some regions of interest in the main point cloud, you can then run the "AnalyzePointCloud" App by pressing the "Launch AnalyzePointCloud" button in the "ExplorePointCloud" App. 
Alternatively, you can select and and export the sub point clouds using the "Export Selected" button, which will generate an "ExportedObjects.mat" file containing the selected objects in your current directory. Once you load that file into MATLAB, a variable 'Objects' will show up in the working space. You can then run the "AnalyzePointCloud" App either using app designer or using the command window and passing the 'Objects' variable as the only input argument to the app. Please see the following example syntax for running this app in the command window:

    >> AnalyzePointCloud(Objects); %Objects is the cell array generated with the ExplorePointCloud App


### MathWorks® Products (http://www.mathworks.com)

Requires MATLAB release R2021b or newer
- [Computer Vision Toolbox™](https://www.mathworks.com/products/computer-vision.html)

[![View Explore and Analyze Point Clouds with MATLAB on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://www.mathworks.com/matlabcentral/fileexchange/117840-explore-and-analyze-point-clouds-with-matlab)

## Support
If you have any questions on how to use the apps, or if you have some feedback to share, please feel free to contact me at: rconsolo@mathworks.com 


## Authors and acknowledgment
Author: Riccardo Consolo

## License
The license is available in the License file within this repository.







