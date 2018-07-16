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

function imuPar = getImuPar(imuName)

switch imuName
    case 'lmvpUncalibrated'
%         gyroArwDegPerRtHr = 0.25;
        gyroArwDegPerRtHr = 0.33;  %based on current noisy allan variance
        imuPar.gyroArwRadPerRtSec = gyroArwDegPerRtHr * pi/180/60;
        gyroBrwDegPerHrPerRtHr = 350;
        imuPar.gyroBrwRadPerSecPerRtSec = gyroBrwDegPerHrPerRtHr * pi/180/3600/60;
        imuPar.gyroScaleUncert = 0.01;
        imuPar.gyroAlignUncert = 0.01;
        imuPar.gyroGsensUncert = 0.0002; % 2 (mrad/s)/g = 0.0002 (mrad/s)/(m/s/s)
        imuPar.gyroBiasUncert = 0.010; % rad/s
        
%         accelVrwMetersPerSecPerRtHr = 0.1;
        accelVrwMetersPerSecPerRtHr = 0.0167; 
        imuPar.accelVrwMetersPerSecPerRtSec = accelVrwMetersPerSecPerRtHr/60;
        accelBrwMgPerRtHr = 2.5;
        imuPar.accelBrwMetersPerSec2PerRtSec = accelBrwMgPerRtHr*9.8/1000/60;
        imuPar.accelScaleUncert = 0.01;
        imuPar.accelAlignUncert = 0.01;
        imuPar.accelBiasUncert = 50 * 9.8/1000; 
        
    case 'lmvp2ndPassCalibration'
%         gyroArwDegPerRtHr = 0.25;
        gyroArwDegPerRtHr = 0.33;  %based on current noisy allan variance
        imuPar.gyroArwRadPerRtSec = gyroArwDegPerRtHr * pi/180/60;
        gyroBrwDegPerHrPerRtHr = 350;
        imuPar.gyroBrwRadPerSecPerRtSec = gyroBrwDegPerHrPerRtHr * pi/180/3600/60;
        imuPar.gyroScaleUncert = 0.002;
        imuPar.gyroAlignUncert = 0.002;
        imuPar.gyroGsensUncert = 0.0002; % 2 (mrad/s)/g = 0.0002 (mrad/s)/(m/s/s)
        imuPar.gyroBiasUncert = 0.001; % rad/s
        
%         accelVrwMetersPerSecPerRtHr = 0.1;
        accelVrwMetersPerSecPerRtHr = 0.0167;
        imuPar.accelVrwMetersPerSecPerRtSec = accelVrwMetersPerSecPerRtHr/60;
        accelBrwMgPerRtHr = 2.5;
        imuPar.accelBrwMetersPerSec2PerRtSec = accelBrwMgPerRtHr*9.8/1000/60;
        imuPar.accelScaleUncert = 0.001;
        imuPar.accelAlignUncert = 0.003;
        imuPar.accelBiasUncert = 2 * 9.8/1000; 
        
    case 'lmvp3rdPassCalibration'
%         gyroArwDegPerRtHr = 0.25;
        gyroArwDegPerRtHr = 0.33;  %based on current noisy allan variance
        imuPar.gyroArwRadPerRtSec = gyroArwDegPerRtHr * pi/180/60;
        gyroBrwDegPerHrPerRtHr = 350;
        imuPar.gyroBrwRadPerSecPerRtSec = gyroBrwDegPerHrPerRtHr * pi/180/3600/60;
        imuPar.gyroScaleUncert = 0.002;
        imuPar.gyroAlignUncert = 0.002;
        imuPar.gyroGsensUncert = 0.0001; % 2 (mrad/s)/g = 0.0002 (mrad/s)/(m/s/s)
        imuPar.gyroBiasUncert = 0.0003; % rad/s
        
%         accelVrwMetersPerSecPerRtHr = 0.1;
        accelVrwMetersPerSecPerRtHr = 0.0167;
        imuPar.accelVrwMetersPerSecPerRtSec = accelVrwMetersPerSecPerRtHr/60;
        accelBrwMgPerRtHr = 2.5;
        imuPar.accelBrwMetersPerSec2PerRtSec = accelBrwMgPerRtHr*9.8/1000/60;
        imuPar.accelScaleUncert = 0.0003;
        imuPar.accelAlignUncert = 0.0015;
        imuPar.accelBiasUncert = 0.3 * 9.8/1000; 

    case 'lmvpCalibrated'
%         gyroArwDegPerRtHr = 0.25;
        gyroArwDegPerRtHr = 0.33;  %based on current noisy allan variance
        imuPar.gyroArwRadPerRtSec = gyroArwDegPerRtHr * pi/180/60;
        gyroBrwDegPerHrPerRtHr = 350;
        imuPar.gyroBrwRadPerSecPerRtSec = gyroBrwDegPerHrPerRtHr * pi/180/3600/60;
        imuPar.gyroScaleUncert = 0.002;
        imuPar.gyroAlignUncert = 0.002;
        imuPar.gyroGsensUncert = 0.0002; % 2 (mrad/s)/g = 0.0002 (mrad/s)/(m/s/s)
        imuPar.gyroBiasUncert = 0.007; % rad/s
        
%         accelVrwMetersPerSecPerRtHr = 0.1;
        accelVrwMetersPerSecPerRtHr = 0.0167;
        imuPar.accelVrwMetersPerSecPerRtSec = accelVrwMetersPerSecPerRtHr/60;
        accelBrwMgPerRtHr = 2.5;
        imuPar.accelBrwMetersPerSec2PerRtSec = accelBrwMgPerRtHr*9.8/1000/60;
        imuPar.accelScaleUncert = 0.001;
        imuPar.accelAlignUncert = 0.003;
        imuPar.accelBiasUncert = 20 * 9.8/1000; 
        
    case 'lmvpPerfectSfmas'
%         gyroArwDegPerRtHr = 0.25;
        gyroArwDegPerRtHr = 0.33;  %based on current noisy allan variance
        imuPar.gyroArwRadPerRtSec = gyroArwDegPerRtHr * pi/180/60;
        gyroBrwDegPerHrPerRtHr = 350;
        imuPar.gyroBrwRadPerSecPerRtSec = gyroBrwDegPerHrPerRtHr * pi/180/3600/60;
        imuPar.gyroScaleUncert = 0.0;
        imuPar.gyroAlignUncert = 0.0;
        imuPar.gyroGsensUncert = 0.0; % 2 (mrad/s)/g = 0.0002 (mrad/s)/(m/s/s)
        imuPar.gyroBiasUncert = 0.007; % rad/s
        
%         accelVrwMetersPerSecPerRtHr = 0.1;
        accelVrwMetersPerSecPerRtHr = 0.0167;
        imuPar.accelVrwMetersPerSecPerRtSec = accelVrwMetersPerSecPerRtHr/60;
        accelBrwMgPerRtHr = 2.5;
        imuPar.accelBrwMetersPerSec2PerRtSec = accelBrwMgPerRtHr*9.8/1000/60;
        imuPar.accelScaleUncert = 0.0;
        imuPar.accelAlignUncert = 0.0;
        imuPar.accelBiasUncert = 20 * 9.8/1000; 

    case 'lmvp3rdPassPerfectSfmas'
%         gyroArwDegPerRtHr = 0.25;
        gyroArwDegPerRtHr = 0.33;  %based on current noisy allan variance
        imuPar.gyroArwRadPerRtSec = gyroArwDegPerRtHr * pi/180/60;
        gyroBrwDegPerHrPerRtHr = 350;
        imuPar.gyroBrwRadPerSecPerRtSec = gyroBrwDegPerHrPerRtHr * pi/180/3600/60;
        imuPar.gyroScaleUncert = 0.0;
        imuPar.gyroAlignUncert = 0.0;
        imuPar.gyroGsensUncert = 0.0; % 2 (mrad/s)/g = 0.0002 (mrad/s)/(m/s/s)
        imuPar.gyroBiasUncert = 0.0003; % rad/s
        
%         accelVrwMetersPerSecPerRtHr = 0.1;
        accelVrwMetersPerSecPerRtHr = 0.0167;
        imuPar.accelVrwMetersPerSecPerRtSec = accelVrwMetersPerSecPerRtHr/60;
        accelBrwMgPerRtHr = 2.5;
        imuPar.accelBrwMetersPerSec2PerRtSec = accelBrwMgPerRtHr*9.8/1000/60;
        imuPar.accelScaleUncert = 0.0;
        imuPar.accelAlignUncert = 0.0;
        imuPar.accelBiasUncert = 0.3 * 9.8/1000; 

    otherwise
%         gyroArwDegPerRtHr = 0.25;
        gyroArwDegPerRtHr = 0.33;  %based on current noisy allan variance
        imuPar.gyroArwRadPerRtSec = gyroArwDegPerRtHr * pi/180/60;
        gyroBrwDegPerHrPerRtHr = 350;
        imuPar.gyroBrwRadPerSecPerRtSec = gyroBrwDegPerHrPerRtHr * pi/180/3600/60;
        imuPar.gyroScaleUncert = 0.003;
        imuPar.gyroAlignUncert = 0.003;
        imuPar.gyroGsensUncert = 0.0002; % 2 (mrad/s)/g = 0.0002 (mrad/s)/(m/s/s)
        imuPar.gyroBiasUncert = 0.008; % rad/s
        
%         accelVrwMetersPerSecPerRtHr = 0.1;
        accelVrwMetersPerSecPerRtHr = 0.1; % based on current noisy allan variance
        imuPar.accelVrwMetersPerSecPerRtSec = accelVrwMetersPerSecPerRtHr/60;
        accelBrwMgPerRtHr = 2.5;
        imuPar.accelBrwMetersPerSec2PerRtSec = accelBrwMgPerRtHr*9.8/1000/60;
        imuPar.accelScaleUncert = 0.003;
        imuPar.accelAlignUncert = 0.003;
        imuPar.accelBiasUncert = 50 * 9.8/1000; 
        
end


% fudge the gyro BRW up because it was observed that the gyro bias shifts
% after periods of motion more than it does when sitting still a long time.
imuPar.gyroBrwRadPerSecPerRtSec = 4*imuPar.gyroBrwRadPerSecPerRtSec;