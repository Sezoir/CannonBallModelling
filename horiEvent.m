function [value , isterminal , direction] = horiEvent(t,z,x)
%% An event function to stop the ODE algorithm after the projectile reaches a horizontal distance x.

% Trigger the event when "value" is zero. In this case when the difference
% between distance x and the current horizontal distance has reached 0.
value = x-z(1);

% Stop ODE algorithm when the event is triggered.
isterminal = 1;

% Used to only locate zeros when the event function is decrease
% (that is when the projectile is coming down to hit the ground).
direction = -1;




