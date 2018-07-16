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
    eulers = simout.eulers_rpy.Data(:,:,1:n) - truthout.eulers_rpy.Data(:,:,1:n);
    dw = simout.dw.Data(:,:,1:n) - truthout.dw.Data(:,:,1:n);
    
    % kill the large errors at the beginning before initialization to make
    % plots scale better:
    startidx = find(simout.initialized.Data, 1, 'first');
    eulers(:,:,1:startidx) = 0;
else
    eulers = simout.eulers_rpy.Data;
    dw = simout.dw.Data;
end

figure('Position', [100 100 900 600])
numRows = 3; % 3 to include stilltimes and gravityVectorStable, else 2

ax(1) = subplot(numRows,3,1);
plot(simout.eulers_rpy.Time, eulers(1,:))
ylabel('roll (rad)')
xlabel('time (s)');
hold on;
plot(simout.sigmas.Time, simout.sigmas.Data(1,:), 'k')
plot(simout.sigmas.Time, -simout.sigmas.Data(1,:), 'k')

ax(2) = subplot(numRows,3,2);
plot(simout.eulers_rpy.Time, eulers(2,:))
ylabel('pitch (rad)')
xlabel('time (s)');
hold on;
plot(simout.sigmas.Time, simout.sigmas.Data(2,:), 'k')
plot(simout.sigmas.Time, -simout.sigmas.Data(2,:), 'k')

ax(3) = subplot(numRows,3,3);
plot(simout.eulers_rpy.Time, eulers(3,:))
ylabel('yaw (rad)')
xlabel('time (s)');
hold on;
plot(simout.sigmas.Time, simout.sigmas.Data(3,:), 'k')
plot(simout.sigmas.Time, -simout.sigmas.Data(3,:), 'k')

ax(4) = subplot(numRows,3,4);
plot(simout.dw.Time, dw(1,:)*1000)
ylabel('x gyro bias (mrad/s)')
xlabel('time (s)');
hold on;
plot(simout.sigmas.Time, simout.sigmas.Data(4,:)*1000, 'k')
plot(simout.sigmas.Time, -simout.sigmas.Data(4,:)*1000, 'k')

ax(5) = subplot(numRows,3,5);
plot(simout.dw.Time, dw(2,:)*1000)
ylabel('y gyro bias (mrad/s)')
xlabel('time (s)');
hold on;
plot(simout.sigmas.Time, simout.sigmas.Data(5,:)*1000, 'k')
plot(simout.sigmas.Time, -simout.sigmas.Data(5,:)*1000, 'k')

ax(6) = subplot(numRows,3,6);
plot(simout.dw.Time, dw(3,:)*1000)
ylabel('z gyro bias (mrad/s)')
xlabel('time (s)');
hold on;
plot(simout.sigmas.Time, simout.sigmas.Data(6,:)*1000, 'k')
plot(simout.sigmas.Time, -simout.sigmas.Data(6,:)*1000, 'k')

if numRows == 3
    ax(35) = subplot(numRows,3,7);
    plot(simout.stilltimes.Time, simout.stilltimes.Data(:,1)); hold on;
    plot(simout.stilltimes.Time, simout.stilltimes.Data(:,2)); hold off;
    ylabel('tight/loose stilltimes (s)')
    xlabel('time (s)');
    hold on;

    ax(36) = subplot(numRows,3,8);
    plot(simout.errorBitfield.Time, simout.errorBitfield.Data)
    ylabel('errorBitfield')
    xlabel('time (s)');
    hold on;

    ax(37) = subplot(numRows,3,9);
    plot(simout.initialized.Time, simout.initialized.Data)
    ylabel('gravityVectorStable')
    xlabel('time (s)');
    hold on;

end


linkaxes(ax,'x');

mtit('Euler Angles and Gyro Biases')