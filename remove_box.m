function [ s_boxes, s_scores ] = remove_box( boxes, scores )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[ind_c, c] = find(scores > 0);
s_boxes = boxes(unique(ind_c),:);
s_scores = scores(unique(ind_c),:);
[ind_c, c] = find(s_scores > 0);
s = zeros(size(c,1),1);
for ii=1:size(c,1)
    s(ii,1)=double(s_scores(ind_c(ii,1),c(ii,1)));
end
s_scores = sparse(ind_c,c,s);

end

