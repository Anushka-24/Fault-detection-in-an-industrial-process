function lag_matrix=time_lag_matrix(data,timelag)
[observation,var]=size(data);
lag_matrix=zeros(observation-timelag+1,var*timelag);
var1=zeros(observation-timelag+1,timelag);
indice=1:timelag;
for i=1:var
    for j=1:timelag
        var1(:,j)=data(j:observation-timelag+j,i);
    end
    lag_matrix(:,indice)=var1;
    indice=indice+timelag;
end

end