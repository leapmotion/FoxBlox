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



figure('Position', [400 100 900 600])

% first row
ax(17) = subplot(3,3,1);
plot(simout.Macc.Time, squeeze(simout.Macc.Data(1,1,:)) )
xlabel('time (s)');
hold on;
plot(simout.sigmas.Time, simout.sigmas.Data(25,:), 'k')
plot(simout.sigmas.Time, -simout.sigmas.Data(25,:), 'k')

ax(18) = subplot(3,3,2);
plot(simout.Macc.Time, squeeze(simout.Macc.Data(1,2,:)) )
xlabel('time (s)');
hold on;
plot(simout.sigmas.Time, simout.sigmas.Data(28,:), 'k')
plot(simout.sigmas.Time, -simout.sigmas.Data(28,:), 'k')

ax(19) = subplot(3,3,3);
plot(simout.Macc.Time, squeeze(simout.Macc.Data(1,3,:)) )
xlabel('time (s)');
hold on;
plot(simout.sigmas.Time, simout.sigmas.Data(31,:), 'k')
plot(simout.sigmas.Time, -simout.sigmas.Data(31,:), 'k')


% row 2
ax(20) = subplot(3,3,4);
plot(simout.Macc.Time, squeeze(simout.Macc.Data(2,1,:)) )
xlabel('time (s)');
hold on;
plot(simout.sigmas.Time, simout.sigmas.Data(26,:), 'k')
plot(simout.sigmas.Time, -simout.sigmas.Data(26,:), 'k')

ax(21) = subplot(3,3,5);
plot(simout.Macc.Time, squeeze(simout.Macc.Data(2,2,:)) )
xlabel('time (s)');
hold on;
plot(simout.sigmas.Time, simout.sigmas.Data(29,:), 'k')
plot(simout.sigmas.Time, -simout.sigmas.Data(29,:), 'k')

ax(22) = subplot(3,3,6);
plot(simout.Macc.Time, squeeze(simout.Macc.Data(2,3,:)) )
xlabel('time (s)');
hold on;
plot(simout.sigmas.Time, simout.sigmas.Data(32,:), 'k')
plot(simout.sigmas.Time, -simout.sigmas.Data(32,:), 'k')




% row 3
ax(23) = subplot(3,3,7);
plot(simout.Macc.Time, squeeze(simout.Macc.Data(3,1,:)) )
xlabel('time (s)');
hold on;
plot(simout.sigmas.Time, simout.sigmas.Data(27,:), 'k')
plot(simout.sigmas.Time, -simout.sigmas.Data(27,:), 'k')

ax(24) = subplot(3,3,8);
plot(simout.Macc.Time, squeeze(simout.Macc.Data(3,2,:)) )
xlabel('time (s)');
hold on;
plot(simout.sigmas.Time, simout.sigmas.Data(30,:), 'k')
plot(simout.sigmas.Time, -simout.sigmas.Data(30,:), 'k')

ax(25) = subplot(3,3,9);
plot(simout.Macc.Time, squeeze(simout.Macc.Data(3,3,:)) )

xlabel('time (s)');
hold on;
plot(simout.sigmas.Time, simout.sigmas.Data(33,:), 'k')
plot(simout.sigmas.Time, -simout.sigmas.Data(33,:), 'k')

linkaxes(ax, 'x');

mtit('Accel Scale Factor and Misalignment Matrix')