% ECE 253: Fundamentals of Digital Image Processing
% Cheolhong An
% Copyright 2017
% University of California, San Diego
% lab 1: raw sensor to srgb image

function [cfa, info] = read_dng(filename)
warning off MATLAB:tifflib:TIFFReadDirectory:libraryWarning
warning off MATLAB:imagesci:tiffmexutils:libtiffWarning
t = Tiff(filename,'r');
offsets = getTag(t,'SubIFD');
setSubDirectory(t,offsets(1));
raw = read(t);

meta_info = imfinfo(filename);
info.width = meta_info.SubIFDs{1}.DefaultCropSize(1);
info.height = meta_info.SubIFDs{1}.DefaultCropSize(2);
xo        = meta_info.SubIFDs{1}.ActiveArea(2);
yo        = meta_info.SubIFDs{1}.ActiveArea(1);
info.black = meta_info.SubIFDs{1}.BlackLevel(1);
info.white = meta_info.SubIFDs{1}.WhiteLevel;
info.bitdepth = meta_info.SubIFDs{1}.BitDepth;
cfa = double(raw(yo+1:yo+info.height,xo+1:xo+info.width));
info.bayer_type = 'grbg'; 
%imshow(cfa,[]);
close(t);