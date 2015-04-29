function [fx, f1x] = rossenbrock(argument)
    fx = (1-argument(1)).^2 + 100 * (argument(2) - argument(1).^2).^2;
    a = 2 - 2*argument(1) + 400 * argument(1) * argument(2) -400 * argument(1)^3;
    b = 100 + 200 * argument(1)^2;
    f1x = [a; b];
end