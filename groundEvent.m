function [value, isterminal, direction] = groundEvent(t, z)
%% An event function, to stop the ODE algorithm after the projectile hits the "ground", which is in this case when y=0.

% Trigger the event when "value" is zero.
value = z(2);

% Stop ODE algorithm when the event is triggered.
isterminal = 1;

% Used to only locate zeros when the event function is decrease
% (that is when the projectile is coming down to hit the ground).
direction = -1;