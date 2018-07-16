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
% Author: Eric Foxlin

function [Hgyro, Haccel, Hmag] = parseImuCalJson(path)
files = dir(path);
calFileName = 'NoCalFileFound';
for i = 1:length(files)
    [~, name, ext] = fileparts(files(i).name);
    if strcmp(ext, '.json')
        calFileName = files(i).name;
        break;
    end
end

if strcmp(calFileName, 'NoCalFileFound')
    Hgyro = [1 0 0 0; 0 1 0 0; 0 0 1 0];
    Haccel = [1 0 0 0; 0 1 0 0; 0 0 1 0];
    Hmag = [1 0 0 0; 0 1 0 0; 0 0 1 0];
else
    cal = loadjson(fullfile(path, calFileName));
    
    Hgyro = cal.gyroscope.x0x30_;
    Hgyro = reshape(Hgyro, 3, 4);
    
    Haccel = cal.accelerometer.x0x30_;
    Haccel = reshape(Haccel, 3, 4);
    
    Hmag = cal.magnetometer.x0x30_;
    Hmag = reshape(Hmag, 3, 4);
end
end