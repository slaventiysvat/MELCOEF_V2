function new_wector = get_norm_vektor(vector,stepen)

% vector = input data
% stepen = size of one frame;
%Autor Starokozhev S.V. 
%This function returns an array whose vector is a multiple of degree 2
x = length(vector);
priznak=x/stepen;
% Y = fix(priznak);
priznak=abs(priznak-fix(priznak));
[m n]=size(vector);
if m > n
vector=vector';
end
    while priznak ~= 0 
        a=zeros(1,1);

        vector=cat(2,vector, a);
        x = length(vector);
        priznak=x/stepen;
        Y = fix(priznak);
        priznak=abs(priznak-fix(priznak));
    end
    new_wector = vector;
end



