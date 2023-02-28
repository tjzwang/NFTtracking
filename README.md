# NFTtracking
System Requirements:
Code was run on Matlab R2022a with Windows 10 OS

Installation guide:
Install Matlab

Expected run time for demo on a normal desktop computer: <1 minute

Instructions for use:
1) In Imaris, do a rough alignment of data and find the ID for fiducials that should be in the same position from week-to-week. Go to statistics tab and export all data as “.xls”.
2) Place the exported data into one folder and identify the folder path in the code
3) Update the fiducial ID information in the matlab code on lines 10-14, with the ID numbers in each column corresponding to the same object across different weeks.
4) Change whether you want to scale the data (stretch/shrink) to improve alignment across weeks and set “true” if yes, or “false” if no.
5) Run code


Instructions to run demo:
1) Place “Alignment_Code_Easy_cleanup.m” and “absor” into the same folder.
2) Place statistics files that contain positional data for each reference frame, exported from Imaris, into a folder. Do not have any files other than those you wish to analyze in this folder.
3) Open the “Alignment_Code_Easy_cleanup.m” in Matlab
4) Add the folders containing the code and data to Matlab’s search path by right clicking the folder name on the left under the current folder panel and selecting “Add to path>Selected Folders”
5) In the Matlab code, specify the folder where the data files live using the same format following “myFolder = ….” On line 5. 
6) Press run. 

Expected output:

Now reading [Filepath]\Week1.xls

Now reading [Filepath]\Week2.xls

Now reading [Filepath]\Week3.xls

Now reading [Filepath]\Week4.xls

Now reading [Filepath]\Week5.xls


For the following reference frame
     2

rotate this many degrees XY Plane
   -2.6495

rotate this many degrees XZ Plane
    4.7499

rotate this many degrees YZ plane
   -1.9524

translate XY Plane this many microns
   35.2929

translate XZ Plane this many microns
    4.4255

translate YZ plane this many microns
  -26.9786

scaling factor

ans =
    1.0175


For the following reference frame
     3

rotate this many degrees XY Plane
    1.2070

rotate this many degrees XZ Plane
    0.2535

rotate this many degrees YZ plane
    0.7208

translate XY Plane this many microns
   -6.7286

translate XZ Plane this many microns
  -16.5414

translate YZ plane this many microns
   -7.1804

scaling factor

ans =
1.0365


For the following reference frame
     4

rotate this many degrees XY Plane
   -0.7895

rotate this many degrees XZ Plane
   -1.9727

rotate this many degrees YZ plane
    0.2842

translate XY Plane this many microns
-5.4535

translate XZ Plane this many microns
    8.207

translate YZ plane this many microns
    8.923

scaling factor

ans =
0.9957


For the following reference frame
     5

rotate this many degrees XY Plane
   -1.0973

rotate this many degrees XZ Plane
   -0.6203

rotate this many degrees YZ plane
    1.7307

translate XY Plane this many microns
  -29.3592

translate XZ Plane this many microns
  -15.3199

translate YZ plane this many microns
  -20.4002

scaling factor

ans =
    1.0736
    
