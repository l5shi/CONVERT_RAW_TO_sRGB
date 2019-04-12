# CONVERT_RAW_TO_sRGB
UCSD ECE 253 Digital Image Processing Camera Pipeline

## Convert a raw sensor image to a sRGB color image
1. read a raw sensor le (lab1.dng) using the given read dng.m.
2. The `read dng' function will return a color lter array with an information structure,
which is described in Figure 1. You need to use the eld information to process the
remaining procedure.
3. linearize the color lter array.
4. demosaic the linearized color lter array using the Matlab function, `demosaic'.
5. read sRGB colors of the 24 checkerboard from `colorchecker.txt'. They should be the
same values in the Table, which was shown during the class.
6. read the 24 patch coordinators from `patch coor.txt'. The le format is depicted in
Figure 2. The coordinators are based on the origin of an image.
7. Derive device rgb values of the 24 patches. You may use any robust method.
8. Derive a 3x3 color space conversion matrix from a device color space to a linear sRGB
color space.
9. Apply the derived color space conversion matrix to the demosaiced sensor image. This
step creates a linear sRGB image.
