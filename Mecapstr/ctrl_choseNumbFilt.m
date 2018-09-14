function priznakArr= ctrl_choseNumbFilt(filterFlag,nMelFilt)
%This function make parameters for each filter which we need
%filterFlag- The array that we use when we need to specify filter parameters
%nMelFilt - numbers of mel filters
%for example
%filterFlag=[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20];
%nMelFilt=20;Usually
[m n]=size(filterFlag);

if n==nMelFilt
priznakArr=filterFlag;
end

if n==1
    B=zeros(1,nMelFilt);
    B(n)=n;
    ind=B(n);
end
if n > 1
    B = sort(filterFlag);
    A = zeros(1,nMelFilt-n,'double');
    B = cat(2,B,A);
    priznakArr=zeros(1,length(B),'double');
    for i=1:1:nMelFilt
        N=B(i);
        if N > 0
            priznakArr(N)=N;
        
        end
    end

end
end