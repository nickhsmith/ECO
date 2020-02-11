# IDP project for TUM 
This project was designed as a semester project to adapt existing tracking software to be user friendly and track single objects from overhead drone footage. This is meant to aide a researcher interested in the tracking of players or objects using video/images as input. The results are x,y pixel information as well as a "confidence" value output by the tracker.

This tracker uses the ECO tracker designed and built by [Martin Danelljan](https://martin-danelljan.github.io/), Goutam Bhat, Fahad Khan, Michael Felsberg.  Their original README is appended to the end of my suggestions


### Runtime requirements
1) Install ECO and it's requirements (outlined below)
2) Split Video file frame by frame into a directory  [ffmpeg](https://www.ffmpeg.org/) is a good tool for this
	- Only images are contained in this folder
	- All images within that file must be named in the following way:    
		- 0001.jpg  0002.jpg  ...  9999.jpg    
3) Run matlab with the -softwareopengl option  
	- Open terminal  
	- type `matlab -softwareopengl` to open Matlab  
4) Navigate to the demo_ECO.m file change options as needed
5) type `demo_ECO` into the terminal and hit enter

If all things have gone correctly you should be prompted with a couple of steps  
1) Select the folder containing all of the images you previously split
2) A prompt on the command line, asking if you want to record the tracking results overlayed onto the video
	- type `1` and hit enter to record the resulting tracking video output
	- type anything else to not record
2a) If you had typed 1 previously. Tell the program where to store the output file
3) You will be prompted to define how many frames to use. This number represents how many frames will be used (3-5 seems to work well)
	- 1 means every frame is used
	- 2 means every other frame is used
	- 10 means every 10th frame is used
	- etc
4) Using the bounding box tool. Select the player/object to track
5) At any point during the video you can reset the bounding box or stop the video. If you decided to record the output (step 2) you *can not* change the size of the video during playback
6) results of the tracking box are definied in the created object. `results.res` This matrix represents the columns (height,width,box height, box width, confidence measure (low is good), reset_flag-1 if you manually reset the box at this time step)  

  
###Installation
### For Linux users the installation process is outlined below.  
  
### Using git clone

1. Clone the GIT repository:

   $ git clone https://github.com/nickhsmith/ECO.git

2. Clone the submodules.  
   In the repository directory, run the commands:

   $ git submodule init  
   $ git submodule update

3. Start Matlab and navigate to the repository.  
   Run the install script:

   |>> install

4. Run the demo script to test the tracker:

   |>> demo_ECO


Note:  
This package requires matconvnet [1], if you want to use deep CNN features, and PDollar Toolbox [2], if you want to use HOG features. Both these externals are included as git submodules and should be installed by following step 2. above.


### Without using git

You could also downlad and install without using git. This is however not recommented since it will be harder to incorporate updates and you will not get the correct versions of matconvnet and PDollar Toolbox.

1. Download ZIP file from https://github.com/martin-danelljan/ECO and unpack it somewhere.

2. Download matconvnet ZIP file from https://github.com/vlfeat/matconvnet and unpack it in the external_libs/matconvnet/ folder of the repository.
   
   Download PDollar Toolbox ZIP file from https://github.com/pdollar/toolbox and unpack it in the external_libs/pdollar_toolbox/ folder of the repository.

Lastly, perform steps 3. and 4. above.  

  
###For Windows users installation is trickier.

1) Download this repository  
	- from the command line: `git clone https://github.com/nickhsmith/ECO.git`
	- download the zip file and unzip in the location of your choosing 
2) Install Visual Studio C/C++ compilers
	- download the community package from [Here](https://visualstudio.microsoft.com/vs/community/)
	- follow the links and make sure to install the **C/C++ development tools**
3) Open Matlab using the softwareopengl option  
	- type into the command console `mex setup C++`
	- you should be able to see the visual studio option. Run the command to change your compiler `mex setup v
4) Edit the Matlab Convnet compiler file. /ECO/external_libs/matconvnet/matlab/vl_compilenn.m
	- On line 647 it should point to you visual studio compiler (cl.exe)
	- Our example points to C://Program Files/Visual Studio/VC/Tools/MSVC/14.16.27023/bin/HostX64/x64. You may need to change your path to reflect your installation
		- `cl_path = fullfile(cc.Location,"VC","Tools","MSVC","14.16.27023","bin","HostX64","x64");`

5) Hopefully this all worked and you can run the command `install` from the matlab console prompt.



Below is the information for ECO
==========
# ECO

Matlab implementation of the Efficient Convolution Operator (ECO) tracker.

## Publication

Details about the tracker can be found in the CVPR 2017 paper:

[Martin Danelljan](https://martin-danelljan.github.io/), Goutam Bhat, Fahad Khan, Michael Felsberg.  
<a href="https://arxiv.org/abs/1611.09224">ECO: Efficient Convolution Operators for Tracking</a>.  
In Proceedings of the IEEE Conference on Computer Vision and Pattern Recognition (CVPR), 2017. 

Please cite the above publication if you use the code or compare with the ECO tracker in your work. Bibtex entry:

@InProceedings{DanelljanCVPR2017,  
	Title                    = {ECO: Efficient Convolution Operators for Tracking},  
	Author                   = {Danelljan, Martin and Bhat, Goutam and Shahbaz Khan, Fahad and Felsberg, Michael},  
	Booktitle                = {CVPR},  
	Year                     = {2017}  
}


## Project Webpage

http://www.cvl.isy.liu.se/research/objrec/visualtracking/ecotrack/index.html


## Contact

[Martin Danelljan](https://martin-danelljan.github.io/)

## Installation

### Using git clone

1. Clone the GIT repository:

   $ git clone https://github.com/nickhsmith/ECO.git

2. Clone the submodules.  
   In the repository directory, run the commands:

   $ git submodule init  
   $ git submodule update

3. Start Matlab and navigate to the repository.  
   Run the install script:

   |>> install

4. Run the demo script to test the tracker:

   |>> demo_ECO


Note:  
This package requires matconvnet [1], if you want to use deep CNN features, and PDollar Toolbox [2], if you want to use HOG features. Both these externals are included as git submodules and should be installed by following step 2. above.


### Without using git

You could also downlad and install without using git. This is however not recommented since it will be harder to incorporate updates and you will not get the correct versions of matconvnet and PDollar Toolbox.

1. Download ZIP file from https://github.com/martin-danelljan/ECO and unpack it somewhere.

2. Download matconvnet ZIP file from https://github.com/vlfeat/matconvnet and unpack it in the external_libs/matconvnet/ folder of the repository.
   
   Download PDollar Toolbox ZIP file from https://github.com/pdollar/toolbox and unpack it in the external_libs/pdollar_toolbox/ folder of the repository.

Lastly, perform steps 3. and 4. above.


## Description and Instructions

### Runfiles

The files in the runfiles/ directory are uset to set parameters and run the tracker. You can create your own runfiles by copying an existing one and then play around with different parameters and feature combinations. 

These runfiles are included:

* OTB_DEEP_settings.m  -  Settings in the paper used for the deep feature version of ECO on the OTB, UAV123 and TempleColor datasets.

* OTB_HC_settings.m  -  Settings in the paper used for the hand-crafted feature version of ECO (ECO-HC) on the OTB, UAV123 and TempleColor datasets.

* VOT2016_DEEP_settings.m  -  Settings in the paper used for the deep feature version of ECO on the VOT2016 dataset.

* VOT2016_HC_settings.m  -  Settings in the paper used for the hand-crafted feature version of ECO (ECO-HC) on the VOT2016 dataset.

* testing_ECO.m  -  Demo file which contains the same settings as OTB_DEEP_settings.m by default.

* testing_ECO_gpu.m  -  Same as testing_ECO, but uses GPU.

* testing_ECO_HC.m  -  Demo file which contains the same settings as OTB_HC_settings.m by default.

* SRDCF_settings.m  -  Settings that roughly correspond to our previous SRDCF tracker [4] from 2015. The main difference is the optimization method.

Tracking performance on the OTB-2015 dataset is shown bellow for different settings. For comparison, results of our previous trackers C-COT [3], SRDCF [4], DeepSRDCF [5] and DSST [6] are included.

<img src="https://github.com/martin-danelljan/ECO/blob/master/result_plots/OTB-2015_succsess_plot.png" alt="Could not display image" height=400 width=500>


### Features

This package includes a quite general framework for feature extraction. You can easily incorporate your own features in the same manner by adding a corresponding "get_featureX.m" function.

Currently, four types of features are included:

1. Deep CNN features. It uses matconvnet [1], which is included as a git submodule in external_libs/matconvnet/. The imagenet-vgg-m-2048 network available at http://www.vlfeat.org/matconvnet/pretrained/ was used in the ECCV paper. You can use other networks, by placing them in the feature_extraction/networks/ folder.

2. HOG features. It uses the PDollar Toolbox [2], which is included as a git submodule in external_libs/pdollar_toolbox/.

3. Lookup table features. These are implemented as a lookup table that directly maps an RGB or grayscale value to a feature vector. Currently, Color Names [8] and Intensity Channels [9] are included.

4. Colorspace features. Currently grayscale and RGB are implemented.

The tracker supports almost any combination of features. Currently, the only limitation is that you can only use deep features from a single network (but you can use several different layers from the same network).

Each feature has its own parameter settings. You can set the cell size for each non-CNN feature independently. ECO does not assume the same cell size for all feature channels. For the CNN features, you can control the cell size by setting an additional down-sampling factor for each layer.

See the runfile testing.m for examples of how to integrate different features. You can uncomment several features at once in the params.t_features cell array.


### fDSST Scale Filter

This reposetery also includes an implementation of the optimized scale filter, which was originally proposed in the fDSST [7]. It is here used in the ECO-HC version of the tracker for speeding-up the scale estimation.


### GPU Support

GPU support is activated by setting the parameter "params.use_gpu = true" in the runfile. This requires MatConvNet to be compiled with GPU support. If the install script fails, please visit http://www.vlfeat.org/matconvnet/install/ for instructions.


### Integration Into OTB

It should be easy to integrate the tracker into the Online Tracking Benchmark [10]. The runfiles supports the OTB interface, so you just have to copy and rename the runfile you want to use and then add the necessary paths (see setup_paths.m).


### Integration Into VOT

To integrate the tracker into the Visual Object Tracking (VOT) challenge toolkit [11], check the VOT_integration folder. Copy the configuration file to your VOT workspace and set the path to the ECO reposetory inside it. The tracker now supports the trax protocol, which is necessary for VOT2017 version of the toolkit.


### Raw Results

All raw result files used in our CVPR 2017 paper can be found at the project webpage:
http://www.cvl.isy.liu.se/research/objrec/visualtracking/ecotrack/index.html


### Why Does the Result Change?

Tracking performance may vary slightly on different machines and whether GPU support is activated. This is due to small numerical effects which can accumulate over time (all trackers are affected by this). Generally, this only affects the performance marginally. More significant changes are rare, but can occur in some videos. 

## Code References

*[visionml/pytracking](https://github.com/visionml/pytracking)*: Python (PyTorch) implementation of ECO and general tracking library containing official implementation of our latest trackers [ATOM](https://arxiv.org/pdf/1811.07628.pdf) and [DiMP](https://arxiv.org/pdf/1904.07220.pdf)  

*[rockkingjy/OpenTracker](https://github.com/rockkingjy/OpenTracker)*: C++ Implementation of ECO and other trackers 

## References

[1] Webpage: http://www.vlfeat.org/matconvnet/  
    GitHub: https://github.com/vlfeat/matconvnet

[2] Piotr Dollár.  
    "Piotr’s Image and Video Matlab Toolbox (PMT)."  
    Webpage: https://pdollar.github.io/toolbox/  
    GitHub: https://github.com/pdollar/toolbox  

[3] Martin Danelljan, Andreas Robinson, Fahad Khan, Michael Felsberg.  
    Beyond Correlation Filters: Learning Continuous Convolution Operators for Visual Tracking.  
    In Proceedings of the European Conference on Computer Vision (ECCV), 2016.  
    http://www.cvl.isy.liu.se/research/objrec/visualtracking/conttrack/index.html
    
[4] Martin Danelljan, Gustav Häger, Fahad Khan, Michael Felsberg.  
    Learning Spatially Regularized Correlation Filters for Visual Tracking.  
    In Proceedings of the International Conference in Computer Vision (ICCV), 2015.  
    http://www.cvl.isy.liu.se/research/objrec/visualtracking/regvistrack/index.html

[5] Martin Danelljan, Gustav Häger, Fahad Khan, Michael Felsberg.  
    Convolutional Features for Correlation Filter Based Visual Tracking.  
    ICCV workshop on the Visual Object Tracking (VOT) Challenge, 2015.  
    http://www.cvl.isy.liu.se/research/objrec/visualtracking/regvistrack/index.html
	
[6] Martin Danelljan, Gustav Häger, Fahad Khan and Michael Felsberg.  
    Accurate Scale Estimation for Robust Visual Tracking.  
    In Proceedings of the British Machine Vision Conference (BMVC), 2014.  
    http://www.cvl.isy.liu.se/research/objrec/visualtracking/scalvistrack/index.html
    
[7] Martin Danelljan, Gustav Häger, Fahad Khan, Michael Felsberg.  
    Discriminative Scale Space Tracking.  
    Transactions on Pattern Analysis and Machine Intelligence (TPAMI), 2017.  
    http://www.cvl.isy.liu.se/research/objrec/visualtracking/scalvistrack/index.html

[8] J. van de Weijer, C. Schmid, J. J. Verbeek, and D. Larlus.  
    Learning color names for real-world applications.  
    TIP, 18(7):1512–1524, 2009.  

[9] M. Felsberg.  
    Enhanced distribution field tracking using channel representations.  
    In ICCV Workshop, 2013.

[10] Y. Wu, J. Lim, and M.-H. Yang.  
    Online object tracking: A benchmark.  
    In CVPR, 2013.  
    https://sites.google.com/site/trackerbenchmark/benchmarks/v10

[11] http://votchallenge.net/

