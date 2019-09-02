function bissect(func, a, b, errmargin, maxn)
    if (sign(func(a)) ~= sign(func(b))) then // If f(a) and f(b) have opposite signs
        n = 1
        x_n = (a + b) / 2
        if (func(x_n) == 0) then // If the first X is root
            disp("found on the first midpoint", string(x_n), "Absolute root of f:")
            disp(string(func(x_n)), "Value of f(x): ")
        else
            while((abs(func(x_n)) > errmargin) && (n < maxn)) do
                if (sign(func(x_n)) == sign(func(a))) then
                    // If f(x_n) has the same sign as f(a)
                    a = x_n
                else
                    // If f(x_n) has opposite sign as f(a)(aka same sign as f(b))
                    b = x_n
                end
                disp([n, xn])
                x_n = (a + b) / 2 // X update
                n = n + 1 // Iteration count increment
            end
            disp("iterations.", string(n),"found in", string(x_n), "Approximated root of f:")
            disp(string(func(x_n)), "Value of f(x_n):")
        end
    else // If f(a) and f(b) doesnt have opposite signs
        error("Invalid function/interval")
    end
endfunction

function bissect_min_iterations(a, b, tol)
    n = ((log(abs((b - a) / tol))) / log(2)) - 1
    disp(n, "Minimum number of iterations for interval and tolerance:")
endfunction

function regula_falsi(func, a, b, errmargin, maxn)
    if (sign(func(a)) ~= sign(func(b))) then // If f(a) and f(b) have opposite signs
        n = 1
        x_n = (a*abs(func(a)) + b*abs(func(b))) / (abs(func(a)) + abs(func(b)))
        if (func(x_n) == 0) then // If the first X is root
            disp("found on the first midpoint", string(x_n), "Absolute root of f:")
            disp(string(func(x_n)), "Value of f(x): ")
        else
            while((abs(func(x_n)) > errmargin) && (n < maxn)) do
                if (sign(func(x_n)) == sign(func(a))) then
                    // If f(x_n) has the same sign as f(a)
                    a = x_n
                else
                    // If f(x_n) has opposite sign as f(a)(aka same sign as f(b))
                    b = x_n
                end
                disp([n, x_n])
                x_n = (a*abs(func(a)) + b*abs(func(b))) / (abs(func(a)) + abs(func(b))) // X update
                n = n + 1 // Iteration count increment
            end
            disp("iterations.", string(n),"found in", string(x_n), "Approximated root of f:")
            disp(string(func(x_n)), "Value of f(x_n):")
        end
    else // If f(a) and f(b) doesnt have opposite signs
        error("Invalid function/interval")
    end
endfunction

function fixed_point(func, x, maxn, tol)
    x0 = x
    xn = 0
    n = 1
    while (n < maxn)
        xn = func(x0)
        if (abs(xn - x0) <= tol) then
            break
        else
            disp([n, xn])
            x0 = xn
            n = n + 1
        end
    end
    if (n >= maxn) then
        disp("Solution not found; Could not achieve convergence within the defined max number of iterations.")
    else
        disp(xn, "Convergence number:")
        disp(n, "Number of iterations:")
    end
endfunction

  // FOR NEWTON-RAPHSON METHOD:
    // Case 1: f" > 0 e (f(a) < 0 e f(b) > 0) --> x0 = b
    // Case 2: f" > 0 e (f(a) > 0 e f(b) < 0) --> x0 = a
    // Case 3: f" < 0 e (f(a) < 0 e f(b) > 0) --> x0 = a
    // Case 4: f" < 0 e (f(a) > 0 e f(b) < 0) --> x0 = b
    // x0 equals a or b such as f(x0) * f"(x0) > 0

function newton_raphson(func, deriv, x, maxn, tol)
    xn = x
    n = 1
    h = (func(xn)/deriv(xn))
    disp("Iteration; xn; f(xn)/g(xn);")
    while (abs(h) >= tol && n < maxn) do
        h = (func(xn)/deriv(xn))
        xn = xn - h
        disp([n xn h])
        n = n + 1
    end
        disp(xn, "Root:")
        disp(n, "Number of iterations:")
endfunction

function secant(func, x0, x1, maxn, tol)
    n = 1
    xn2 = x0
    xn1 = x1 
    xn = (xn2 * func(xn1) - xn1*func(xn2)) / (func(xn1) - func(xn2))
    disp("Iteration; xn+1; xn; xn-1;")
    
    while (abs(func(xn)) > tol && n < maxn) do
        xn2 = xn1;
        xn1 = xn;
        xn = (xn2 * func(xn1) - xn1*func(xn2)) / (func(xn1) - func(xn2))
        disp([n xn xn1 xn2])
        n= n + 1
    end
    
    if (n >= maxn) then
        disp("Root does not exist")
    else
        disp(xn, "Root: x = ")
    end
endfunction
