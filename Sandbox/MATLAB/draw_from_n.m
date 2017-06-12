function D = draw_from_n(N,n)
% draw N numbers each from {1,2,3,...n}
D = floor(n*rand(N,1)) + 1;
end
% check: hist(draw_from_n(1e7,8)) should be roughly uniform