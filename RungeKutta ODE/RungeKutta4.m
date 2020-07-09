function [tHist,yHist] = RungeKutta4(f,t0,h,n,y0) 
 % [tHist,yHist] = RungeKutta4(f,t0,h,n,y0) Performs n steps of the Runge
 % Kutta scheme with timestep h, initial time t0, and initial condition y0. The system of
  % m ODEs are of the form y' = f(t,y), and are specified by a function handle for f
  % The function outputs an (n+1)-by-1 vector tHist ("hist" for "history"),
  % containing the discrete times at which the solution is approximated, and the
  % (n+1)-by-m matrix yHist, containing the approxmation of the solution at the given
  % time steps
  
  
  % Make sure y0 is a vertical vector
  [numRows,numCols] = size(y0);
  if numRows < numCols
    y0 = y0';
  end
  
   % Preallocating output. The number of ODEs in the problem can be detected
  % from the initial condition provided by the user. There are n+1 rows in the
  % matrix, as the first row is for the initial condition
  m = length(y0);
  yHist = zeros(n+1,m);
  tHist = zeros(n+1,1);

  % Initial condition
  t = t0; y = y0;
  
   % Save in history
  tHist(1) = t; yHist(1,:) = y'; 

  % Iterate time step
  for i = 1:n

    k1=f(t,y);
    k2=f(t+h/2,y+h*k1/2);
    k3=f(t+h/2,y+h*k2/2);
    k4=f(t+h,y+h*k3);
    y=y+(1/6)*h*(k1+2*k2+2*k3+k4);
    t = t + h;
    
    % Save history
    tHist(i+1) = t; yHist(i+1,:) = y';
    
  end
end

  