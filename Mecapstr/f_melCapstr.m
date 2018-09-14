function MelStruct = f_melCapstr(MelStruct,AnalizStruct)
%function for calculation for mel-cepstral coefficients
% MelStruct.fmelL - lower frequency
% MelStruct.fmelH - upper frequencies
% MelStruct.ctrlPointFilt - number of mel filters
% MelStruct.n - reference points
% MelStruct.FMel - frequency step
% MelStruct.filterFlag - this field for choose numbers of filter which want
% user (Now it isn't use)
% MelStruct.energyS - energie coefficients
% MelStruct.enrgyDiapaz - translation into the energy range
MelStruct.fbank = ctrl_triangularFilterBank(MelStruct.Fl,MelStruct.Fh,MelStruct.nMelFilt,MelStruct.Fs,AnalizStruct.sampleSize);

MelStruct.filterFlag=1:1:MelStruct.nMelFilt;
 
MelStruct.priznakArr= ctrl_choseNumbFilt(MelStruct.filterFlag,MelStruct.nMelFilt);
g=1;
d=1;
    mel=zeros(1,MelStruct.nMelFilt);
    while g<=length(AnalizStruct.fft_res(:,1))
    MelStruct.mels(g,:) = ctrl_melCoef(AnalizStruct.fft_res(g,:),MelStruct.nMelFilt,MelStruct.fbank,MelStruct.priznakArr);
     g=g+1; 
    end
    
    L=length(MelStruct.mels(:,1));

        for N=1:1:L
            MelStruct.C1(N,:)=dct(MelStruct.mels(N,:));
        end  
      
end