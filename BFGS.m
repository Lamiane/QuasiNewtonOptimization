% Broyden–Fletcher–Goldfarb–Shanno
function H = BFGS(H, deltaX, Y)
    N = length(deltaX);
    a = deltaX * Y';
    b = Y' * deltaX;
    c = Y * deltaX';
    d = deltaX * deltaX';
    H = (eye(N) - a/b)' * H * (eye(N) - c/b) + d/b;
end