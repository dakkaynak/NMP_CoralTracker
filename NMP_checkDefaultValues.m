function defaultFlag = NMP_checkDefaultValues(userData)

defaultFlag = 0;

if userData.Status ==1
    if userData.Type == 5
        if userData.Species == 18
            if userData.Genus == 1
                if userData.PercentBleached == 0;
                    if strcmp(userData.Remark,'');
                        if userData.isPartial == 2
                            defaultFlag = 1;
                        end
                    end
                end
                
            end
        end
    end
end
