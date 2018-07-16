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



%% LMVP 3.0
load simImuData.mat;

seqId = 1:length(simImuData);
tstamp = cumsum(simImuData(8,:));


imu = [seqId' seqId' tstamp' simImuData(2:8,:)'];  %make it have 10 cols like logged data format

% 1: SeqID
% 2: DeviceID
% 3: timestamp (sec)
% 4-6: gyroXYZ (rad/sec)
% 7-9: accelXYZ (m/s^2)
% 10: temperature (degC)

dataRate = 1 / mean(diff(imu(:, 3)));
testDurSec = length(imu) / dataRate;
secPerHour = 3600;
mgPerG = 1000;

dataRate = round(dataRate);

%% [ GYROSCOPE ]
rps2dps = 180 / pi;
figure(1); subplot(1,2,1);
for i = 4:6
    data = struct('freq', imu(:, i) .* rps2dps .* secPerHour, 'rate', dataRate, 'units', 'deg/h');
    allan(data, 2 .^ (1:testDurSec) ./ dataRate, 'LMVP 4 Gyros (20602)', 1, i-3);
end

if true
    % TODO: Automate so as to not require manual plot inspection
    gyroBiasStab = [10 8 3]; % Where the plot levels out in log space
    gyroNoiseDensity = [0.03 0.004 0.008]; % Slope -0.5 at around 1 second averaging

%     text(0.0002, 5, ['Noise Density (x,y,z) : [' num2str(gyroNoiseDensity(1)) ', ' ...
%         num2str(gyroNoiseDensity(2)) ',' num2str(gyroNoiseDensity(3)) '] ' char(176) '/s/root(Hz)']);
%     % text(0.0002, 4, ['(Noise Density Spec. is 0.015 /s/root(Hz))']);
%     text(0.0002, 3, ['Bias Stability (x,y,z): [' num2str(gyroBiasStab(1)) ', ' ...
%         num2str(gyroBiasStab(2)) ', ' num2str(gyroBiasStab(3)) '] ' char(176) '/hr']);
%     text(0.0002, 2, 'Dynamic Range Setting: 2000 dps');
end

%% [ ACCELEROMETER ]
mpss2mg = 1 / 9.80655 * 1000;

subplot(1,2,2);% figure(2);
for i = 7:9
    data = struct('freq', imu(:, i) .* mpss2mg, 'rate', dataRate, 'units', 'mg');
    allan(data, 2 .^ (1:testDurSec) ./ dataRate, 'LMVP 4 Accels (20602)', 1, i-6);
end


if true
    % TODO: Automate so as to not require manual plot inspection
    accelBiasStab = [0.02 0.02 0.10]; % Where the plot levels out in log space
    accelNoiseDensity = [70 50 150]; % Slope -0.5 at around 1 second averaging
   
%     text(0.0002, 0.05, ['Noise Density (x,y,z): [' num2str(accelNoiseDensity(1)) ', ' ...
%         num2str(accelNoiseDensity(2)) ', ' num2str(accelNoiseDensity(3)) '] uG/root(Hz)'])
%     % text(0.0002, 0.04, ['(Noise Density Spec. is 230 uG/root(Hz))']);
%     text(0.0002, 0.03, ['Bias Stability (x,y,z): [' num2str(accelBiasStab(1)) ', ' ...
%         num2str(accelBiasStab(2)) ', ' num2str(accelBiasStab(3)) '] mg'])
%     text(0.0002, 0.02, 'Dynamic Range Setting: 4g');
end

findfigs;