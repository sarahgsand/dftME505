function Y2 = dft2(X)
% Performs a 2D discrete fourier transform on matrix X. 
    [r,c] = size(X);
    Y1 = zeros(r,c);
    Y1 = complex(Y1,0);
    Y2 = Y1;

    % Fourier Transform on each row of f2gnd.
    for m = 1:r
        k = 0:c-1;
        for n = 1:c
            Y1(m,n) = sum(X(m,:).*exp(-2*pi*1i*(n-1).*(k)/c));
        end
    end

    % Fourier Transform on each column of f2gnd.
    for n = 1:c
        k = r-1:-1:0;
        for m = 1:r
            Y2(m,n) = sum(Y1(:,n)'.*exp(-2*pi*1i*(r-m+1)*(k)/r));
        end
    end
    Y2 = rot90(Y2,-1)';
end