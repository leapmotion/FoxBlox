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

function modelDef = getModelDef(calibrateSFMA)

modelDef.trackAccelBiases = true;
modelDef.trackAccelSfma = calibrateSFMA;
modelDef.trackGyroSfma = calibrateSFMA;
modelDef.trackGyroGsens = false;
modelDef.numStates = 12 + 3*modelDef.trackAccelBiases ...
                        + 9*modelDef.trackAccelSfma...
                        + 9*modelDef.trackGyroSfma ...
                        + 9*modelDef.trackGyroGsens;
modelDef.accelDefinesExtrinsics = true;

modelDef.maxNumDelayedPoses = uint8(5);
modelDef.statesPerDelayedPose = uint8(6);

