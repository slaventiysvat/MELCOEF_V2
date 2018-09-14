function overlap=ctrl_getOverlap(sampleSize,prozent)
%return quantity of samples for overlapping 
%in window of fourier transform
%The function will return a multiple of a power of 2 (a = 2;)

        overlap=ceil((prozent*sampleSize)/100);
        a=2;
        while  rem(overlap, a) > 0
            overlap=overlap+1;
        end

end