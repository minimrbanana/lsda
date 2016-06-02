dataDir = '/BS/siyu-project/work/MulticutMotionTracking/dataset/VSB100/';
Type = '*.png';
outDir = '/BS/siyu-project/work/MulticutMotionTracking/experiment/VSB100/ImageRes/';
outMat = '/BS/siyu-project/work/MulticutMotionTracking/experiment/VSB100/bbxes/';
temp = load('folders.mat');
folder = temp.imgDir;
clear temp;

for i=54:60
    imgDir = folder(i).name;
    Files=dir([dataDir imgDir Type]);
    LengthFiles = length(Files);
    for imgnum=1:LengthFiles
        imgNum = sprintf('%.3d',imgnum);
        imgName = Files(imgnum).name;

        filename = [dataDir imgDir imgName];
        output = [outDir imgDir imgName];
        matName = imgName; matName(end-3:end)='.mat';
        outbox = [outMat imgDir matName];

        detect10k_demo(rcnn_model, rcnn_feat,filename, output, outbox);
        fprintf('\n Image %.3d Processd\n', imgnum);
    end
    fprintf('\n Folder %.3d Processd\n', i);
end
