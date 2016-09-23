function getRsquared = getRsquared(S)

getRsquared = [];

for i = 1 : length(S)
    Rsquared = S(i).model.Rsquared.Ordinary;
    getRsquared = vertcat(getRsquared, Rsquared);
end

end