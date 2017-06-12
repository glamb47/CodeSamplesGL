x = [2 5 10 20];
y = [3 -1 5 10];
newX = 15;
for count = 1:numel(x)
    xOne = x(count)
    if newX < xOne
        final = count;
        break;
    end
end
newY = y(final - 1) + (newX - x(final-1)) * (y(final) - y(final-1)) / (x(final) - x(final-1))
