close all
clear all

%Specify the folder where the files live
myFolder = 'C:\Users\tjz4\Desktop\NeuronDisappearingSet2\Rough Alignment\mk024-1';

%Specificy the ID numbers from each week


wk1_index = [174, 55, 136, 317, 137, 318, 373, 262];
wk2_index = [226, 73, 240, 577, 248, 585, 782, 540];
wk3_index = [183, 76, 196, 434, 244, 450, 585, 400];
wk4_index = [121, 33, 153, 442, 194, 456, 644, 408];
wk5_index = [201, 67, 180, 532, 221, 567, 759, 457];

NumRefFrames = 5;

% Check to make sure that folder actually exists.  Warn user if it doesn't.
if ~isfolder(myFolder)
    errorMessage = sprintf('Error: The following folder does not exist:\n%s\nPlease specify a new folder.', myFolder);
    uiwait(warndlg(errorMessage));
    myFolder = uigetdir(); % Ask for a new one.
    if myFolder == 0
         % User clicked Cancel
         return;
    end
end

%Set output structure


% Get a list of all files in the folder with the desired file name pattern.
filePattern = fullfile(myFolder, '*.xls'); % Change to whatever pattern you need.
theFiles = dir(filePattern);
for k = 1 : length(theFiles)
    baseFileName = theFiles(k).name;
    fullFileName = fullfile(theFiles(k).folder, baseFileName);
    [filepath,name,ext] = fileparts(fullFileName);
    fprintf(1, 'Now reading %s\n', fullFileName);
    % Now do whatever you want with this file name,
    % such as reading it in as an image array with imread()
    %Load the data



[~,sheet_name]=xlsfinfo(baseFileName);
IndexA = find(strcmp(sheet_name,'Position Reference Frame'));
  [num{k},text{k},raw{k}]=xlsread(baseFileName,sheet_name{IndexA});

end

%Desired output is fiducial coordinates from reference (Week 1) in each
%reference frame to compare to others AND fiducial coordinates from others
% in their reference frame ((i.e. Week 2, reference frame 2))

%copy for number of weeks

Week1_alldata = num{1,1};
Week2_alldata = num{1,2};
Week3_alldata = num{1,3};
Week4_alldata = num{1,4};
Week5_alldata = num{1,5};

%copy for number of weeks

%week 1
for j = 1:NumRefFrames

    for i = 1:length(wk1_index);
    [row,col] = find(Week1_alldata==wk1_index(1,i));
    Week1_Fid_Coord(i,1:3) = Week1_alldata(row(j),1:3);
    end
    Ref_Fid_Coord{j} = Week1_Fid_Coord;

end

%week 2
    for i = 1:length(wk2_index)
    [row,col] = find(Week2_alldata==wk2_index(1,i));
    Week2_Fid_Coord(i,1:3) = Week2_alldata(row(2),1:3);
    end
    Changing_Fid_Coord{2} = Week2_Fid_Coord;

%week 3
    for i = 1:length(wk3_index)
    [row,col] = find(Week3_alldata==wk3_index(1,i));
    Week3_Fid_Coord(i,1:3) = Week3_alldata(row(3),1:3);
    end
    Changing_Fid_Coord{3} = Week3_Fid_Coord;

%week 4

    for i = 1:length(wk4_index)
    [row,col] = find(Week4_alldata==wk4_index(1,i));
    Week4_Fid_Coord(i,1:3) = Week4_alldata(row(4),1:3);
    end
    Changing_Fid_Coord{4} = Week4_Fid_Coord;

%week 5

     for i = 1:length(wk5_index)
     [row,col] = find(Week5_alldata==wk5_index(1,i));
     Week5_Fid_Coord(i,1:3) = Week5_alldata(row(5),1:3);
 end
    Changing_Fid_Coord{5} = Week5_Fid_Coord;



%alignment code

%Need to somehow get changing week to change for m...

for m = 2:NumRefFrames
ChangingWeek = (Changing_Fid_Coord{m})';
RefWeek = (Ref_Fid_Coord{m})';
%Need to add absor.m to the path to run.
%set doScale to true if you expect shrinking/swelling across weeks and want
%that incorporated in your rotation/translation. Set doScale to false if
%you want to align the data as they are, without accounting for any swelling changes across the entire image.
[regParams,Bfit,ErrorStats]=absor(ChangingWeek,RefWeek,'doScale',true);
%output Rotation in Z,Y,X
eul = rotm2eul(regParams.R)*180/pi;
regParams.t;

%Do all rotations first before doing all translations
disp('For the following reference frame')
disp(m)
disp('rotate this many degrees XY Plane') 
disp(eul(1,1))
disp('rotate this many degrees XZ Plane') 
disp(eul(1,2))
disp('rotate this many degrees YZ plane') 
disp(eul(1,3))



disp('translate XY Plane this many microns') 
disp(regParams.t(3,1))
disp('translate XZ Plane this many microns') 
disp(regParams.t(2,1))
disp('translate YZ plane this many microns') 
disp(regParams.t(1,1))

disp('scaling factor')
regParams.s


TestFit = regParams.R*ChangingWeek*regParams.s+regParams.t;
TestFit = TestFit';
Bfit = Bfit';


end


% 
% % for i = 1:length(wk1_index)
% %   IndexWk1{i} = find([num{1,1}]==wk1_index(1,i))
% % end
%     IndexWk2 = find([num{1,2}]==13)
%     IndexWk3= find([num{1,3}]==13)
%     IndexWk4 = find([num{1,4}]==13)
%     IndexWk5 = find([num{1,5}]==13)