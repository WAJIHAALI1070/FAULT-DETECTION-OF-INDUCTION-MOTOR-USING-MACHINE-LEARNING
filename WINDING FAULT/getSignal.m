function [Id, Iq] = getSignal(Ia, Ib, Ic, time)
% Park's Transformation with time-varying inputs
% Inputs:
%   Ia, Ib, Ic - Time-varying three-phase currents (functions of time)
%   time - Time vector or array
% Outputs:
%   Id, Iq - Time-varying transformed currents in dq reference frame

% Initialize arrays to store results
Id = zeros(size(time));
Iq = zeros(size(time));

for t = 1:numel(time)
    % Current values at specific time t
    Ia_t = Ia(t);
    Ib_t = Ib(t);
    Ic_t = Ic(t);
    
    % Compute theta at time t (assuming theta is time-dependent)
    theta = 100 * pi * time(t); % Adjust as needed for the specific application
    
    % Park's transformation matrix at time t
    P_t=[0.5 0.5 0.5;cos(theta) cos(theta-((2*pi)/3)) cos(theta+((2*pi)/3));
        -sin(theta) -sin(theta-((2*pi)/3)) -sin(theta+((2*pi)/3))
        ];
    
    % Create a matrix of three-phase currents at time t
    Iabc = [Ia_t; Ib_t; Ic_t];
    
    % Perform Park's transformation (matrix multiplication) at time t
    Idq = P_t .* Iabc;
    
    % Extract Id and Iq components at time t
    Id(t) = Idq(1);
    Iq(t) = Idq(2);
end
end

