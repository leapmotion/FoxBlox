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



figure('Position', [500 100 900 600])

% first row
ax(26) = subplot(3,3,1);
plot(simout.Ggyr.Time, squeeze(simout.Ggyr.Data(1,1,:)) )
xlabel('time (s)');
hold on;
plot(simout.sigmas.Time, simout.sigmas.Data(34,:), 'k')
plot(simout.sigmas.Time, -simout.sigmas.Data(34,:), 'k')

ax(27) = subplot(3,3,2);
plot(simout.Ggyr.Time, squeeze(simout.Ggyr.Data(1,2,:)) )
xlabel('time (s)');
hold on;
plot(simout.sigmas.Time, simout.sigmas.Data(37,:), 'k')
plot(simout.sigmas.Time, -simout.sigmas.Data(37,:), 'k')

ax(28) = subplot(3,3,3);
plot(simout.Ggyr.Time, squeeze(simout.Ggyr.Data(1,3,:)) )
xlabel('time (s)');
hold on;
plot(simout.sigmas.Time, simout.sigmas.Data(40,:), 'k')
plot(simout.sigmas.Time, -simout.sigmas.Data(40,:), 'k')


% row 2
ax(29) = subplot(3,3,4);
plot(simout.Ggyr.Time, squeeze(simout.Ggyr.Data(2,1,:)) )
xlabel('time (s)');
hold on;
plot(simout.sigmas.Time, simout.sigmas.Data(35,:), 'k')
plot(simout.sigmas.Time, -simout.sigmas.Data(35,:), 'k')

ax(30) = subplot(3,3,5);
plot(simout.Ggyr.Time, squeeze(simout.Ggyr.Data(2,2,:)) )
xlabel('time (s)');
hold on;
plot(simout.sigmas.Time, simout.sigmas.Data(38,:), 'k')
plot(simout.sigmas.Time, -simout.sigmas.Data(38,:), 'k')

ax(31) = subplot(3,3,6);
plot(simout.Ggyr.Time, squeeze(simout.Ggyr.Data(2,3,:)) )
xlabel('time (s)');
hold on;
plot(simout.sigmas.Time, simout.sigmas.Data(41,:), 'k')
plot(simout.sigmas.Time, -simout.sigmas.Data(41,:), 'k')




% row 3
ax(32) = subplot(3,3,7);
plot(simout.Ggyr.Time, squeeze(simout.Ggyr.Data(3,1,:)) )
xlabel('time (s)');
hold on;
plot(simout.sigmas.Time, simout.sigmas.Data(36,:), 'k')
plot(simout.sigmas.Time, -simout.sigmas.Data(36,:), 'k')

ax(33) = subplot(3,3,8);
plot(simout.Ggyr.Time, squeeze(simout.Ggyr.Data(3,2,:)) )
xlabel('time (s)');
hold on;
plot(simout.sigmas.Time, simout.sigmas.Data(39,:), 'k')
plot(simout.sigmas.Time, -simout.sigmas.Data(39,:), 'k')

ax(34) = subplot(3,3,9);
plot(simout.Ggyr.Time, squeeze(simout.Ggyr.Data(3,3,:)) )

xlabel('time (s)');
hold on;
plot(simout.sigmas.Time, simout.sigmas.Data(42,:), 'k')
plot(simout.sigmas.Time, -simout.sigmas.Data(42,:), 'k')

linkaxes(ax, 'x');

mtit('Gyro G-Sensitivity Matrix (rad/s)/(m/s/s)')