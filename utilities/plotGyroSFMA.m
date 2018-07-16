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



figure('Position', [300 100 900 600])

% first row
ax(17) = subplot(3,3,1);
plot(simout.Mgyr.Time, squeeze(simout.Mgyr.Data(1,1,:)) )
xlabel('time (s)');
hold on;
plot(simout.sigmas.Time, simout.sigmas.Data(16,:), 'k')
plot(simout.sigmas.Time, -simout.sigmas.Data(16,:), 'k')

ax(18) = subplot(3,3,2);
plot(simout.Mgyr.Time, squeeze(simout.Mgyr.Data(1,2,:)) )
xlabel('time (s)');
hold on;
plot(simout.sigmas.Time, simout.sigmas.Data(19,:), 'k')
plot(simout.sigmas.Time, -simout.sigmas.Data(19,:), 'k')

ax(19) = subplot(3,3,3);
plot(simout.Mgyr.Time, squeeze(simout.Mgyr.Data(1,3,:)) )
xlabel('time (s)');
hold on;
plot(simout.sigmas.Time, simout.sigmas.Data(22,:), 'k')
plot(simout.sigmas.Time, -simout.sigmas.Data(22,:), 'k')


% row 2
ax(20) = subplot(3,3,4);
plot(simout.Mgyr.Time, squeeze(simout.Mgyr.Data(2,1,:)) )
xlabel('time (s)');
hold on;
plot(simout.sigmas.Time, simout.sigmas.Data(17,:), 'k')
plot(simout.sigmas.Time, -simout.sigmas.Data(17,:), 'k')

ax(21) = subplot(3,3,5);
plot(simout.Mgyr.Time, squeeze(simout.Mgyr.Data(2,2,:)) )
xlabel('time (s)');
hold on;
plot(simout.sigmas.Time, simout.sigmas.Data(20,:), 'k')
plot(simout.sigmas.Time, -simout.sigmas.Data(20,:), 'k')

ax(22) = subplot(3,3,6);
plot(simout.Mgyr.Time, squeeze(simout.Mgyr.Data(2,3,:)) )
xlabel('time (s)');
hold on;
plot(simout.sigmas.Time, simout.sigmas.Data(23,:), 'k')
plot(simout.sigmas.Time, -simout.sigmas.Data(23,:), 'k')




% row 3
ax(23) = subplot(3,3,7);
plot(simout.Mgyr.Time, squeeze(simout.Mgyr.Data(3,1,:)) )
xlabel('time (s)');
hold on;
plot(simout.sigmas.Time, simout.sigmas.Data(18,:), 'k')
plot(simout.sigmas.Time, -simout.sigmas.Data(18,:), 'k')

ax(24) = subplot(3,3,8);
plot(simout.Mgyr.Time, squeeze(simout.Mgyr.Data(3,2,:)) )
xlabel('time (s)');
hold on;
plot(simout.sigmas.Time, simout.sigmas.Data(21,:), 'k')
plot(simout.sigmas.Time, -simout.sigmas.Data(21,:), 'k')

ax(25) = subplot(3,3,9);
plot(simout.Mgyr.Time, squeeze(simout.Mgyr.Data(3,3,:)) )

xlabel('time (s)');
hold on;
plot(simout.sigmas.Time, simout.sigmas.Data(24,:), 'k')
plot(simout.sigmas.Time, -simout.sigmas.Data(24,:), 'k')

linkaxes(ax, 'x');

mtit('Gyro Scale Factor and Misalignment Matrix')