function distance = maxHori(theta) 
%% Returns the horizontal distance travelled by a projectile under gravity and air resistance for some launch angle theta.

% Get the time vector and path matrix for the projectile.
[time, path] = projectileODE(theta, @groundEvent);
% Return the horizontal distance.
distance = path(end,1);



 