function x = vmm(func, func_dimensions, update_rule, number_of_steps = 100)
    % Skelton function for variable metric methods
    % func returns value of a function and its gradient in a given point
    % [f(x), f'(x)]
    % func dimensions: for F:RxR -> R are: [2,1]
    
    % 1. Initialization step
    x = 1 * ones(func_dimensions(1), 1) .* rand(func_dimensions(1), 1);
    % init starting Hessians beware the dimensions!
    H = eye(func_dimensions(1));
    alpha = .01;
    [fx, gradFx_n] = func(x);
    gradFx_prev = gradFx_n;
    
    % here comes magick
    deltaX = -alpha .* H * gradFx_n;
    x = x + deltaX;
        
%       visualization
    plotting_X = 0:number_of_steps-1;
    plotting_Y = [];
    plotting_Z = [];
    
    range = -1:0.01:1;
    meshX = range;
    meshY = range;
    [XX, YY] = meshgrid(meshX, meshY);
    XY =[XX, YY];
    ZZ = [];
    for i = 1:size(XX)(1)
        for j = 1:size(XX)(2)
            ZZ(i,j) = func([XX(i,j); YY(i,j)]);
        end
    end

    figure(1);
    mesh(XX, YY, ZZ)  
    hold on
    
    
    figure(3)
    contour(XX, YY, ZZ)
    hold on
    XP3 = [];
    YP3 = [];
    ZP3 = [];
    
    % 2. repeat until convergence/for 100 loop
    for i = 1:1:number_of_steps
        % 3. update step
        % I
        % calculate grad(F(x_n)), store the grad of the old x
        gradFx_prev = gradFx_n;
        [fx, gradFx_n] = func(x);
        
        % II
        % find y_k
        y_k = gradFx_n - gradFx_prev;
        
        % III
        % we update old alpha
        alpha = AlphaHelper(func, x, H);
        % find new Hessian
        H = update_rule(H, deltaX, y_k);
        
        % IV
        % find new deltaX
        deltaX = -alpha .* H * gradFx_n;
        
        % V
        % find new point
        x = x + deltaX;
        
        plotting_Y(i) = x(1);
        plotting_Z(i) = x(2);
        
        % 4. Visualization step
        % update plot after every iteration
        XP3(i) = x(1);
        YP3(i) = x(2);
        ZP3(i) = func(x)(1);
        
    end
    
    
    plot3(XP3, YP3, ZP3)
    xlabel("x_1")
    ylabel("x_2")
    zlabel("func(X)")
    
    figure(2);
    hold on
    plot(plotting_X, plotting_Y, 'r');
    plot(plotting_X, plotting_Z, 'r');
    plot(plotting_X, ZP3, 'g');
    
    % 5. Cleaning step
    hold off
end