function X2 = idft2(Y)
% Performs a 2D inverse discrete fourier transform on matrix X.
    [r,c] = size(Y);

    X1 = zeros(r,c);
    X1 = complex(X1,0);
    X2 = X1;

    % Inverse Fourier Transform on each row of f2gnd.
    for m = 1:r
        k = 0:c-1;
        for n = 1:c
            X1(m,n) = sum(Y(m,:).*exp(2*pi*1i*(n-1).*k/c));
        end
    end
    
    % Inverse Fourier Transform on each column of f2gnd.
    for n = 1:c
        k = r-1:-1:0;
        for m = 1:r
            X2(m,n) = sum(X1(:,n)'.*exp(2*pi*1i*(r-m+1)*k/r));
        end
    end

    X2 = flip(real(X2/(r*c)),1);
end