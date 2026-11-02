function F = detect_Faulty(x, Avg, i, n)

F = one(n);
if (x(2) == x(1) && x(5) == x(1) && x(1) ~= Avg)
    F(i) = 0;
end

end