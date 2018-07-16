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

if simData
    n = length(simout.eulers_rpy.Data);
    r_nb = simout.r_nb.Data - truthout.r_nb.Data(:,:,1:n);
    v_nb = simout.v_nb.Data - truthout.v_nb.Data(:,:,1:n);
    df = simout.df.Data - truthout.df.Data(:,:,1:n);
    
    % kill the large errors at the beginning before initialization to make
    % plots scale better:
    startidx = find(simout.initialized.Data, 1, 'first');
    r_nb(:,:,1:startidx) = 0;
    v_nb(:,:,1:startidx) = 0;

else
    r_nb = simout.r_nb.Data;
    v_nb = simout.v_nb.Data;
    df = simout.df.Data;
end

figure('Position', [200 100 900 600])

% positions r_nb
ax(7) = subplot(3,3,1);
plot(simout.r_nb.Time, r_nb(1,:))
ylabel('north (m)')
xlabel('time (s)');
hold on;
plot(simout.sigmas.Time, simout.sigmas.Data(7,:), 'k')
plot(simout.sigmas.Time, -simout.sigmas.Data(7,:), 'k')

ax(8) = subplot(3,3,2);
plot(simout.r_nb.Time, r_nb(2,:))
ylabel('east (m)')
xlabel('time (s)');
hold on;
plot(simout.sigmas.Time, simout.sigmas.Data(8,:), 'k')
plot(simout.sigmas.Time, -simout.sigmas.Data(8,:), 'k')

ax(9) = subplot(3,3,3);
plot(simout.r_nb.Time, r_nb(3,:))
ylabel('down (m)')
xlabel('time (s)');
hold on;
plot(simout.sigmas.Time, simout.sigmas.Data(9,:), 'k')
plot(simout.sigmas.Time, -simout.sigmas.Data(9,:), 'k')


% velocities v_nb
ax(10) = subplot(3,3,4);
plot(simout.v_nb.Time, v_nb(1,:))
ylabel('v_x (m)')
xlabel('time (s)');
hold on;
plot(simout.sigmas.Time, simout.sigmas.Data(10,:), 'k')
plot(simout.sigmas.Time, -simout.sigmas.Data(10,:), 'k')

ax(11) = subplot(3,3,5);
plot(simout.v_nb.Time, v_nb(2,:))
ylabel('v_y (m)')
xlabel('time (s)');
hold on;
plot(simout.sigmas.Time, simout.sigmas.Data(11,:), 'k')
plot(simout.sigmas.Time, -simout.sigmas.Data(11,:), 'k')

ax(12) = subplot(3,3,6);
plot(simout.v_nb.Time, v_nb(3,:))
ylabel('v_z (m)')
xlabel('time (s)');
hold on;
plot(simout.sigmas.Time, simout.sigmas.Data(12,:), 'k')
plot(simout.sigmas.Time, -simout.sigmas.Data(12,:), 'k')




% accel biases
ax(13) = subplot(3,3,7);
plot(simout.df.Time, df(1,:)*1000/9.8)
ylabel('x accel bias (mg)')
xlabel('time (s)');
hold on;
plot(simout.sigmas.Time, simout.sigmas.Data(13,:)*1000/9.8, 'k')
plot(simout.sigmas.Time, -simout.sigmas.Data(13,:)*1000/9.8, 'k')

ax(14) = subplot(3,3,8);
plot(simout.df.Time, df(2,:)*1000/9.8)
ylabel('y accel bias (mg)')
xlabel('time (s)');
hold on;
plot(simout.sigmas.Time, simout.sigmas.Data(14,:)*1000/9.8, 'k')
plot(simout.sigmas.Time, -simout.sigmas.Data(14,:)*1000/9.8, 'k')

ax(15) = subplot(3,3,9);
plot(simout.df.Time, df(3,:)*1000/9.8)
ylabel('z accel bias (mg)')
xlabel('time (s)');
hold on;
plot(simout.sigmas.Time, simout.sigmas.Data(15,:)*1000/9.8, 'k')
plot(simout.sigmas.Time, -simout.sigmas.Data(15,:)*1000/9.8, 'k')

linkaxes(ax, 'x');

mtit('Position, Velocity, and Accel Biases')