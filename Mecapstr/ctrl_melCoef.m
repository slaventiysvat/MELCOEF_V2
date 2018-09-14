function   mel = ctrl_melCoef(res_val,nMelFilt,fbanki,priznakArri)
%This function returns us mel-capstr coeficients
%res_val - signal that we cut into sectors
%nMelFilt - number of filters
%fbanki - An array with filtered signals after multiplying the signal by each filter
%priznakArri - this vector contains the working parameters for each filter
  mel=zeros(1,nMelFilt);
  res_val=res_val(1:length(fbanki(1,:)));
   for i=1:nMelFilt
         if priznakArri(i) > 0
            Mel_coef(i,:)=res_val.*fbanki(i,:);
            Mel_coef(i,:)=Mel_coef(i,:).^2;
            mel(i)= sum(Mel_coef(i,:));
            if mel(i)==0% if log = 0 then we give NaN
                mel(i)=1;
            end
            mel(i)=log(mel(i));
         else
            Mel_coef(i,:)=res_val.*0;
            mel(i)= sum(Mel_coef(i,:));
            mel(i)=log(mel(i));
         end
     end


end