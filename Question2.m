% Find the exact angle associated with the max horizontal distance.
maxAngle = fminbnd(@(theta)-maxHori(theta), 0, pi/2);
% Function which just takes 15000 from the horizontal distance given by
% maxHori.
dist = @(theta) maxHori(theta) - 15000;
% Find the two angles, between the given boundaries.
angle1 = fzero(dist, [0,maxAngle])
angle2 = fzero(dist, [maxAngle,pi/2])

[time1, height1] = vert(angle1, 12000)
[time2, height2] = vert(angle2, 12000)

% The pattern of interceptors reset every 20 seconds, and every 2000 meters
% so take mod of the times and heights.
mtime1 = mod(time1,20)
mtime2 = mod(time2,20)
mheight1 = mod(height1,2000)
mheight2 = mod(height2,2000)
% Now calculate the positions of the "open interval" after m time.
gap = @(t,offset) 100*t+offset; % Quick function to save time
gapT1 = gap(mtime1, 1000)
gapT2 = gap(mtime2, 1000)
gapB1 = gap(mtime1, 0)
gapB2 = gap(mtime2, 0)
% Both projectials are in the gap, so calculate the delay time before 
% interceptor reaches projectile.
dtime1 = (mheight1-gapB1)/100
dtime2 = (mheight2-gapB2)/100