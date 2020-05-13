function [time,distance] = vert(theta, x) 
%% Returns the time and vertical distance of a projectile under gravity and air resistance for some launch angle theta after it has travelled x meters.
% Get the time and path vectors for the projectile.
[time, path] = projectileODE(theta, @(t,z)horiEvent(t,z,x));
% Return the horizontal distance.
distance = path(end,2);
time = time(end);



 