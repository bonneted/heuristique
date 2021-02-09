function g = cost_function(xx,nom)

if strcmp(nom,'ackley')
    d = length(xx);
    
    c = 2*pi;b = 0.2;a = 20;

    sum1 = 0;
    sum2 = 0;
    for ii = 1:d
        xi = xx{ii};
        sum1 = sum1 + xi.^2;
        sum2 = sum2 + cos(c.*xi);
    end

    term1 = -a .* exp(-b*sqrt(sum1./d));
    term2 = -exp(sum2./d);

    g = term1 + term2 + a + exp(1);

end

if strcmp(nom,'crossit')
    x1 = xx{1};
    x2 = xx{2};

    fact1 = sin(x1).*sin(x2);
    fact2 = exp(abs(100 - sqrt(x1.^2+x2.^2)./pi));

    g = -0.0001 * (abs(fact1.*fact2)+1).^0.1;
end

if strcmp(nom,'easom')
    x1 = xx{1};
    x2 = xx{2};

    fact1 = -cos(x1).*cos(x2);
    fact2 = exp(-(x1-pi).^2-(x2-pi).^2);

    g = fact1.*fact2;
end

if strcmp(nom,'drop')
    x1 = xx{1};
    x2 = xx{2};


    frac1 = 1 + cos(12.*sqrt(x1.^2+x2.^2));
    frac2 = 0.5*(x1.^2+x2.^2) + 2;

    g = -frac1./frac2;
end

if strcmp(nom,'carre')
    x1 = xx{1};
    x2 = xx{2};
    g = x1.^2 + x2.^2;
end

end
