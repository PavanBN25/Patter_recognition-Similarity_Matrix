[m,n]=size(drugCell);
if m > n
    n=m;    
end

%[~,an]=size(resultsAes{1,4});

for z=1:n    
    z1=1;
[~,an]=size(resultsAes{z1,4});
[dnx,dn]=size(resultsDrug{z,4});

if((dnx==dn) && (dn==1))
    resultsDrug{z,5}=0;
    resultsDrug{z,6}=0;
    continue;
else
    
a1=resultsAes{z1,4};
d1=resultsDrug{z,4};
    for j=1:an
        for k=1:dn
            ks_mat(j,k)=my_mat(a1{j},d1{k});
        end
    end
%ks_mat=my_mat(resultsAes{1,4},resultsDrug{1,4});        
[nrows4,ncolums4]=size(ks_mat);        
for i1=1:ncolums4
    for j1=1:ncolums4
         [h,p,ks2stat] = kstest2(ks_mat(:,i1),ks_mat(:,j1));
         matClust{i1+1,j1+1}=ks2stat;
         matPClust{i1+1,j1+1}=p;
    end
end
for i1=1:dn
    matClust{1,i1+1}=dlvl5.name(d1{i1});
    matClust{i1+1,1}=dlvl5.name(d1{i1});
    matPClust{1,i1+1}=dlvl5.name(d1{i1});
    matPClust{i1+1,1}=dlvl5.name(d1{i1}); 
end    
resultsDrug{z,5}=matClust;
resultsDrug{z,6}=matPClust;
clear i1;
clear i;
clear z;
clear nrows4;
clear ncolums4;
clear j;
clear j1;
clear k;
clear dn;
clear an;
clear m;
clear n;
clear matClust;
clear matPClust;
clear P;
clear ks2stat;
clear h;
clear ks_mat;
end
end