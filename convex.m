% F: R2 -> R
% F(x, y) = x^2 + y^2
function [fx, f1x] = convex(argument)
    fx = argument(1).^2 + argument(2).^2;
    f1x = [2.*argument(1); 2.*argument(2)];
end
