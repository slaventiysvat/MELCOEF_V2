function  ArrayConvercion = ctrl_component_weiv(OutputArray,L,NumbComponent,prozent,Correction)
%this function is reconstruct a output after chose each levels of decomposition in input signal
% OutputArray - Input signal after decomposition
% L - array whis show us how we can reconstruct signal
% NumbComponent - quantity of components for decomposition
% prozent - is the percentage of the amplitude that the user choose
% Correction - which level whe chose for filtering
output_weiv_comp_mass=zeros(1,NumbComponent);
input_size_weiv_mass=zeros(1,NumbComponent);
for i=1:1:NumbComponent
input_size_weiv_mass(i)=input_size_weiv_mass(i)+i;
end

output_weiv_comp_mass = detcoef(OutputArray,L,input_size_weiv_mass); 

 Correction = Correction(length(Correction):-1:1);
 prozent = prozent(length(prozent):-1:1);
%Filtering for inpur signal
        for N=1:1:NumbComponent
                cd_N = output_weiv_comp_mass{1,N};
                
                     if prozent(N) == 100 &&  Correction(N) == 1
                       
              
                        output_weiv_comp_mass{1,N} = cd_N;
                        
                     end
                     
                    if Correction(N) > 0 && prozent(N) < 100
                        coef=GetCoefWeivlet(cd_N );
                        cd_N =cd_N .*(coef*prozent(N));
                        output_weiv_comp_mass{1,N} = cd_N;
                    end
                    if  Correction(N) == 0
                        
                        cd_N = cd_N *0;
                        output_weiv_comp_mass{1,N} = cd_N;
                        
                    end
                    
  
        end
        
         x=OutputArray(1:length(output_weiv_comp_mass{1,NumbComponent}));

         ArrayConvercion= x;
         
        %Recounsrction
        for N=NumbComponent:(-1):1
        
             comp_arr=output_weiv_comp_mass{1,N};

             ArrayConvercion=[ArrayConvercion comp_arr];

        end
        

end