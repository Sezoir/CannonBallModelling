[theta,distance] = fminbnd(@(theta)-maxHori(theta), 0, pi/2);
theta
distance = -distance
[time, path] = projectileODE(theta, @groundEvent);
plot(path(1:end,1), path(1:end,2))