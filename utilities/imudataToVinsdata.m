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



% SeqID, DeviceID, timestamp (sec), gyroXYZ (rad/sec), accelXYZ (m/s^2), temperature (degC)
imudata = csvread('imudata.txt', 2);  


% 0, timestamp (usec), accels (m/s^2), gyros (rad/s), vidCap (s), synchronized
zerocol = zeros(length(imudata), 1);
vins_data = [zerocol round(1e6*imudata(:,3))  imudata(:,7:9) imudata(:,4:6) zerocol zerocol];

dlmwrite('vins_data.txt', vins_data, 'precision',' %10.5f');

Fs = 1/mean(diff(imudata(:,3)));