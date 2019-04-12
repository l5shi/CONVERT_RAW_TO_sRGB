% ECE 253
% LAB1
% Lianming Shi
% A99097650

clear;
clc;
%% part 1&2
[cfa,info] = read_dng('lab1.dng');

%% part 3
cfa_linear = cfa*255 / (max(cfa(:)) - min(cfa(:)));
cfa_linear = uint8(cfa_linear);

%% part 4
A = demosaic(cfa_linear,'grbg');

%% part 5
fileID = fopen('colorchecker.txt','r');
color = fscanf(fileID,'%d');
fclose(fileID);
color = reshape(color,[3,24])';
color = uint8(color);
color = imadjust(color,[],[],2.2);
color = single(color);
%% part 6
 
fileID = fopen('patch_coor.txt','r');
patches = fscanf(fileID,'%d',[2,96]);
fclose(fileID);
patches = patches';

%% part 7&8

C = im2double(A);

for i = 0:23
    area = C(patches(1+4*i,2):patches(3+4*i,2),patches(1+4*i,1):patches(2+4*i,1),:);
    color1(i+1,:) = reshape(mode(mode(area)),[1,3]);
end
%hold off;
device_color = color1 * 255;
conv_matrix = inv(device_color' * device_color) * device_color' * color;

%% part 9
[x,y,z] = size(A);

for j = 1:x
    B(j,:,:) = reshape(C(j,:,:),[4064,3]) * conv_matrix;
end

%% part 10
image = imadjust(B,[],[],1/2.2);
figure(1)
imshow(image)
image = double(image);
imwrite(image,'lab1_output.tif');

