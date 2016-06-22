function get_proposal( imname, outname, outdata, outselectiveS)
th = tic;
% Read image
im = imread(imname);
if size(im,3)==1
    im=cat(3,im,im,im);
end

% Get boxes
numbox = 256*4;
[boxes, hierarchy,boxesT,priority,segment] = extract_boxes(im, numbox);
boxesS = [boxes max(priority)*ones(size(priority,1),1)-priority];
save(outselectiveS,'boxesS','segment');

% Extract per region features and scores
%[scores, f7] = per_region_features(rcnn_model, rcnn_feat, im, boxes);

%save(outdata,'boxes','scores','f7');


fprintf('\n Final time: %.3fs\n', toc(th));
% Show detections
% m = min(length(cats_ids), 50);%%%former5%%%
% if exist('outname', 'var')
%     showdets(im, top_boxes(1:m,:), cats_found(1:m), cats_ids(1:m),outname);
% else
%     showdets(im, top_boxes(1:m,:), cats_found(1:m), cats_ids(1:m));
% end
end


function [boxes, hierarchy,boxesT,priority,segment] = extract_boxes(im, numbox)
th = tic;
fprintf('Extract boxes...');
fast_mode = true;
im_width = 500;
[boxes, hierarchy,boxesT,priority,segment] = selective_search_boxes(im, fast_mode, im_width);
boxes = boxes(:, [2 1 4 3]); %[y1 x1 y2 x2] to [x1 y1 x2 y2]

numbox = min(numbox, size(boxes,1));
boxes = single(boxes(1:numbox,:));
priority = priority(1:numbox,:);
segment = segment(1:numbox,:);
fprintf(' found %d boxes: done (in %.3fs)\n', size(boxes, 1), toc(th));
end


