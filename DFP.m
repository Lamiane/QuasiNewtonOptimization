% Davidon-Fletcher-Powell
function H = DFP(H, deltaX, Y)
    b = (deltaX * deltaX')/(Y' * deltaX);
    c = H * Y * Y' * H';
    d = Y' * H * Y;
    H = H + b - (c/d);
end