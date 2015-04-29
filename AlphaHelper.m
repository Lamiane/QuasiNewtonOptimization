function alpha_opt = AlphaHelper(func, x_k, H)
    % oszukana metoda zlotego srodka
    a = 0;
    b = 10000;
    eps = .01;
    
    %init:
    [fx, f1x] = func(x_k);
    d = -H * f1x;
    
    while ((b-a)>eps)
        xL = a + (b-a)/4;
        xR = b - (b-a)/4;
        
        L = x_k + xL * d;
        R = x_k + xR * d;
        
        if (func(L) > func(R))
            a = xL;
        else
            b = xR;
        end
    end
    
    alpha_opt = (a+b)/2;
end