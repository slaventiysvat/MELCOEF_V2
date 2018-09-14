function coef=GetCoefWeivlet(cdN)
%this function will find how much the amplitude will be for one percent (coef)
tyty=abs(max(cdN));
coef=tyty/100;
end