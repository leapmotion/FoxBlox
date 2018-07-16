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

function [imageTstamps, imageTensor, stereo_cal] = loadImages(imagedir, imgRes)

fprintf('loading images...   ');
images = imageDatastore(imagedir);

imageTstamps = zeros(length(images.Files)/2, 1);
imageTensor = uint8(zeros(imgRes(1), imgRes(2), 2, length(images.Files)/2 ));
for ii=1:length(images.Files)
    [~, fname, ~] = fileparts(images.Files{ii});
    fnameParts = strsplit(fname, '_');
    imgNum = ceil(ii/2);
    if fnameParts{2} == 'R'
        imageTstamps(imgNum) = str2num(fnameParts{1});
    end
    if nargout>1
        imageTensor(:,:, 1+(fnameParts{2}=='R'),imgNum) = readimage(images, ii);
    end
end
fprintf('done.\n')

stereo_cal = getOpticalCalfile();

end
