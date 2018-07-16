% Copyright (C) 2017-18 Leap Motion, Inc.
% 
%    Licensed under the Apache License, Version 2.0 (the "License");
%    you may not use this file except in compliance with the License.
%    You may obtain a copy of the License at
% 
%        http://www.apache.org/licenses/LICENSE-2.0
% 
%    Unless required by applicable law or agreed to in writing, software
%    distributed under the License is distributed on an "AS IS" BASIS,
%    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
%    See the License for the specific language governing permissions and
%    limitations under the License.
% Author: Tom Calloway

function stereo_cal = getOpticalCalfile

fid = fopen('optical_calibration.txt');

% Read 6 header lines
fgetl(fid); fgetl(fid); fgetl(fid);
fgetl(fid); fgetl(fid); fgetl(fid);
fgetl(fid); fgetl(fid); fgetl(fid);

stereo_cal.calType = uint8(str2num(fgetl(fid)));

% Legacy Leap Motion lens calibration
leftStr = fgetl(fid);
rightStr = fgetl(fid);
extrinsicsStr = fgetl(fid);

left = single(str2num(leftStr));
right = single(str2num(rightStr));
extrinsic = single(str2num(extrinsicsStr));

i = uint8(1);
stereo_cal.fM = [left(i), right(i)]; i = i + 1;
stereo_cal.u0 = [left(i), right(i)]; i = i + 1;
stereo_cal.v0 = [left(i), right(i)]; i = i + 1;
stereo_cal.p1 = [left(i), right(i)]; i = i + 1;
stereo_cal.p2 = [left(i), right(i)]; i = i + 1;
stereo_cal.k1 = [left(i), right(i)]; i = i + 1;
stereo_cal.k2 = [left(i), right(i)]; i = i + 1;
stereo_cal.k3 = [left(i), right(i)]; i = i + 1;
stereo_cal.k4 = [left(i), right(i)]; i = i + 1;
stereo_cal.k5 = [left(i), right(i)]; i = i + 1;
stereo_cal.k6 = [left(i), right(i)]; i = i + 1;
stereo_cal.x0 = [left(i), right(i)]; i = i + 1;
stereo_cal.y0 = [left(i), right(i)]; i = i + 1;
stereo_cal.rx = [left(i), right(i)]; i = i + 1;
stereo_cal.ry = [left(i), right(i)]; i = i + 1;
stereo_cal.rz = [left(i), right(i)]; i = i + 1;
stereo_cal.baseline = extrinsic(1);
stereo_cal.resolution = [extrinsic(2), extrinsic(3)];

% MATLAB fisheye lens calibration
matlab_extrinsics_str = fgetl(fid);
fisheye_left_str = fgetl(fid);
fisheye_right_str = fgetl(fid);

matlab_extrinsics = single(str2num(matlab_extrinsics_str));
fisheye_left = single(str2num(fisheye_left_str));
fisheye_right = single(str2num(fisheye_right_str));

stereo_cal.Ext_r21 = [matlab_extrinsics(1), matlab_extrinsics(2), matlab_extrinsics(3)]';
stereo_cal.Ext_R21 = [matlab_extrinsics(4), matlab_extrinsics(5), matlab_extrinsics(6);
    matlab_extrinsics(7), matlab_extrinsics(8), matlab_extrinsics(9);
    matlab_extrinsics(10), matlab_extrinsics(11), matlab_extrinsics(12);]';
stereo_cal.Fisheye_map_left = [fisheye_left(1), fisheye_left(2), ...
    fisheye_left(3), fisheye_left(4)]';
stereo_cal.Fisheye_map_right = [fisheye_right(1), fisheye_right(2), ...
    fisheye_right(3), fisheye_right(4)]';
stereo_cal.Fisheye_resolution_left = [fisheye_left(5); fisheye_left(6)];
stereo_cal.Fisheye_resolution_right = [fisheye_right(5); fisheye_right(6)];
stereo_cal.Fisheye_center_pixel_left = [fisheye_left(7); fisheye_left(8)];
stereo_cal.Fisheye_center_pixel_right = [fisheye_right(7); fisheye_right(8)];
stereo_cal.Fisheye_stretch_matrix_left = [fisheye_left(9), fisheye_left(10); ...
    fisheye_left(11), fisheye_left(12)];
stereo_cal.Fisheye_stretch_matrix_right = [fisheye_right(9), fisheye_right(10); ...
    fisheye_right(11), fisheye_right(12)];

% MATLAB standard lens calibration
std_left_str = fgetl(fid);
std_right_str = fgetl(fid);

std_left = single(str2num(std_left_str));
std_right = single(str2num(std_right_str));

stereo_cal.std_f_left = [std_left(1); std_left(2)];
stereo_cal.std_f_right = [std_right(1); std_right(2)];
stereo_cal.std_center_pixel_left = [std_left(3); std_left(4)];
stereo_cal.std_center_pixel_right = [std_right(3); std_right(4)];
stereo_cal.std_k_left = [std_left(5); std_left(6); std_left(7)];
stereo_cal.std_k_right = [std_right(5); std_right(6); std_right(7)];
stereo_cal.std_tangential_left = [std_left(8); std_left(9)];
stereo_cal.std_tangential_right = [std_right(8); std_right(9)];
stereo_cal.std_skew_left = std_left(10);
stereo_cal.std_skew_right = std_right(10);

fclose(fid);