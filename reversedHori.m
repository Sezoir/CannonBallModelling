function distance = reversedHori(theta) 
%% Returns the negative horizontal distance of a projectile under gravity and air resistance for some launch angle theta

% Get the time and path vectors for the projectile
[time, path] = projectileODE(theta, @projectileEvent);
% Return the negative horizontal distance 
distance = -path(end,1);



 