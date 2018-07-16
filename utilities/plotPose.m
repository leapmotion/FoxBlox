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



eulers = simout.eulers_rpy.Data;
eulers_VO = simout.eulers_VO.Data;
position = simout.r_nb.Data;
position_VO = simout.r_VO.Data;
velocity = simout.v_nb.Data;

init = find(simout.initialized.Data, 1, 'first');
reloc = find(simout.relocalized.Data, 1, 'first');
if ~isempty(reloc), init = max(init, reloc); end
dist = simout.distTravelled.Data(end) - simout.distTravelled.Data(init);
posErr_VIO = norm(simout.r_nb.Data(:,end) - simout.r_nb.Data(:,init));  
posErr_VO = norm(simout.r_VO.Data(:,end) - simout.r_VO.Data(:,init));


masterTitle = sprintf('%s  [VIO/VO error = %4.1f/%4.1f %%distTravelled (%4.1f m)]', filename, 100*posErr_VIO/dist, 100*posErr_VO/dist, dist);


figure('Position', [100 100 900 600])
numRows = 2; % 3 to include velocity, else 2

startax = 38;  % start numbering axes from 38 to avoid collision with other plots
ax(startax+1) = subplot(numRows,3,1);
plot(simout.eulers_rpy.Time, eulers(1,:)); hold on;
plot(simout.eulers_VO.Time, eulers_VO(1,:), '-.'); hold off;
ylabel('roll (rad)')
xlabel('time (s)');
legend({'VIO', 'VO'});
title(sprintf('final VIO/VO: %4.2f,%4.2f', eulers(1,end), eulers_VO(1,end)));
hold on;

ax(startax+2) = subplot(numRows,3,2);
plot(simout.eulers_rpy.Time, eulers(2,:)); hold on;
plot(simout.eulers_VO.Time, eulers_VO(2,:), '-.'); hold off;
ylabel('pitch (rad)')
xlabel('time (s)');
title({masterTitle, ' ', sprintf('final VIO/VO: %4.2f,%4.2f', eulers(2,end), eulers_VO(2,end))},'Interpreter','none');
hold on;

ax(startax+3) = subplot(numRows,3,3);
plot(simout.eulers_rpy.Time, eulers(3,:)); hold on;
plot(simout.eulers_VO.Time, eulers_VO(3,:), '-.'); hold off;
ylabel('yaw (rad)')
xlabel('time (s)');
title(sprintf('final VIO/VO: %4.2f,%4.2f', eulers(3,end), eulers_VO(3,end)));
hold on;

ax(startax+4) = subplot(numRows,3,4);
plot(simout.r_nb.Time, position(1,:)); hold on;
plot(simout.r_VO.Time, position_VO(1,:), '-.'); hold off;
ylabel('x position (m)')
xlabel('time (s)');
title(sprintf('final VIO/VO: %4.2f,%4.2f', position(1,end), position_VO(1,end)));
hold on;

ax(startax+5) = subplot(numRows,3,5);
plot(simout.r_nb.Time, position(2,:)); hold on;
plot(simout.r_VO.Time, position_VO(2,:), '-.'); hold off;
ylabel('y position (m)')
xlabel('time (s)');
title(sprintf('final VIO/VO: %4.2f,%4.2f', position(2,end), position_VO(2,end)));
hold on;

ax(startax+6) = subplot(numRows,3,6);
plot(simout.r_nb.Time, position(3,:)); hold on;
plot(simout.r_VO.Time, position_VO(3,:), '-.'); hold off;
ylabel('z position (m)')
xlabel('time (s)');
title(sprintf('final VIO/VO: %4.2f,%4.2f', position(3,end), position_VO(3,end)));
hold on;

if numRows == 3
    ax(startax+7) = subplot(numRows,3,7);
    plot(simout.v_nb.Time, velocity(1,:))
    ylabel('x velocity (m/s)')
    xlabel('time (s)');
    hold on;

    ax(startax+8) = subplot(numRows,3,8);
    plot(simout.v_nb.Time, velocity(2,:))
    ylabel('y velocity (m/s)')
    xlabel('time (s)');
    hold on;

    ax(startax+9) = subplot(numRows,3,9);
    plot(simout.v_nb.Time, velocity(3,:))
    ylabel('z velocity (m/s)')
    xlabel('time (s)');
    hold on;

end


linkaxes(ax,'x');

