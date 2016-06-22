dataDir = '/BS/joint-multicut/work/visual-tracking-benchmark/';
Type = '*.jpg';
outMat = '/BS/joint-multicut/work/DetectionRes/visual-tracking-benchmark_LC/';
outMatS = '/BS/joint-multicut/work/DetectionRes/visual-tracking-benchmark_SC/';

folder = dir(dataDir);
folder(1:2)=[];

for i=1:size(folder,1)
    imgDir = [folder(i).name '/'];
    Files=dir([dataDir imgDir 'img/' Type]);
    LengthFiles = length(Files);
    if(~exist([outMat imgDir],'dir'))
        mkdir([outMat imgDir]) ;
    end
    if(~exist([outMatS imgDir],'dir'))
        mkdir([outMatS imgDir]) ;
    end
    for imgnum=1:LengthFiles
        imgNum = sprintf('%.3d',imgnum);
        imgName = Files(imgnum).name;

        filename = [dataDir imgDir 'img/' imgName];
        matName = imgName; matName(end-3:end)='.mat';
        outbox = [outMat imgDir matName];
        outSelectiveBox = [outMatS imgDir matName];

        get_proposal(filename, [], outbox, outSelectiveBox);
        fprintf('\n Image %.3d Processd\n', imgnum);
    end
    fprintf('\n Folder %.3d Processd\n', i);
end