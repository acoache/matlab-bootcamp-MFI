function [t, S] =  GBM1(S0, mu, sigma, T, Ndt, Nsims)
% GBM1  Generate geometric brownian motion paths (loop version).
%   [t, S] =  GBM1(S0, mu, sigma, T, Ndt, Nsims)
%
%   Output arguments:
%   t: Time
%   S: Price paths
%   
%   Input arguments:
%   S0: initial price
%   mu: drift, mean return
%   sigma: volatility, standard deviation of returns
%   T: terminal time
%   Ndt: number of time steps
%   Nsims: number of simulations (default = 1)

    % Check the value for number of simulations
    if nargin < 6
        Nsims = 1;
    end
    
    % Throw an error manually
    if Nsims > 1e6
        error('Error. Number of simulations needs to be lower than 1e6.');
    end
    
    % Time grid
    dt = T / Ndt;
    t = linspace(0, T, Ndt);

    % Initialize prices
    S = zeros(Ndt, Nsims);
    S(1,:) = S0;

    % Loop for every time step
    for ii = 1:(Ndt-1)
        % Accumulate asset price
        S(ii+1,:) = S(ii,:) .* exp( (mu + (sigma^2)/2) * dt + ...
            sigma * normrnd(0, sqrt(dt), 1, Nsims));
    end

end
