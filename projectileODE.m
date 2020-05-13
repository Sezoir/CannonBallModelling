function [time, path] = projectileODE(theta, event) 
%% Returns the time vector and path matrix for an ODE under gravity and air resistance.

% Check for angle to be zero, in which case ignore as otherwise we get
% errors with ode45.
if(theta==0)
    time = [0];
    path = [0 0 0 0];
   return
end
% Set constants to be used, given by the question.
k= 0.00002;
m = 6;
g = 9.8;
v0 = 450;
% Set the options of the ODE. We bound the "event" function as an
% event to look for during the numerical integration (this allows us to use
% this function with different events depending on circumstance).
options = odeset('Events',@(t,z)event(t,z), 'refine',5,'AbsTol',1e-4,'MaxStep',1e-3);
% We set up out ode variable to be integrated according to our first order
% system. Note that z = (x y a b).
myode = @(t,z) [z(3); z(4); ...
       -(k/m)*sqrt(z(3)^2+z(4)^2)*z(3); ...
    -g-((k/m)*sqrt(z(3)^2+z(4)^2)*z(4))];
% Now solve the ODE. Note we set the time span between 0 and infinite,
% since we want the "event" to stop the ODE when it is triggered.
% Also we use symbolic and double transformations when theta=pi/2,
% we do not get the correct initial conditions, leading to a incorrect
% answer (Note that this method sacrifices performance for precision).
[time, path] = ode45(@(t,z)myode(t,z), [0 inf], [0 0 v0*double(cos(sym(theta))) v0*double(sin(sym(theta)))], options);
