dataDir = '/home/zhongjie/Dataset/VSB100/Motion_train_fullres/Images/';
imgDir = 'pouring_tea/image';
Type = '.jpg';
outDir = '/home/zhongjie/Dataset/lsdaResults/VSB100/Motion_train_fullres/Images/';


imgnum=50;
imgNum = sprintf('%.3d',imgnum);
filename = [dataDir imgDir imgNum Type];
output = [outDir imgDir imgNum Type];

more_boxes(rcnn_model, rcnn_feat,filename);%, output);






