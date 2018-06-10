%import AE details
aeft=new_importfileAEFT('AEontoFullMAt2.txt');  % ae heirarchy table
aelvl1=new_importfile('AEontolvl1.txt');        % level1 AE's: root level
aelvl2=new_importfile('AEontolvl2.txt');        % level2 AE's
aelvl3=new_importfile('AEontolvl3.txt');        % level3 AE's
aelvl4=new_importfile('AEontolvl4.txt');        % level4 AE's: leaf level

%clear previous data if any
clear resultsAes;
clear resAecount;
clear nae;
clear mae;
clear i;
clear ans;

%for AE testing 
aeCell={'Parenchymal lung disorders NEC','Pulmonary oedemas'};
clear m;
clear n;

%% AEs from AE mat into the hashmap
map_AE_aemat=java.util.HashMap;
[m,n]=size(ae_mat);
for i=1:m
    map_AE_aemat.put(ae_mat{i,1},i);
end


%AE:  map leaf level to aeMat --> ae(to get valid ae's in ae_mat)
clear m;
clear n;
[m,n]=size(aelvl4);
for i=1:m
   if(map_AE_aemat.containsKey(aelvl4.name{i})) 
       ae(i)=map_AE_aemat.get(aelvl4.name{i});
   else
       ae(i)=0;
   end
end
ae=ae';
%AE: map ae to aeft ---> aeft_val (mapping valid ae's to aeft to get final col of ae flattened table)
clear m;
clear n;
[m,n]=size(aeft);
for i=1:m
    val=aeft(i,n-1);
    aeft_val(i,1)=ae(val);
end

%combining column which maps to aemat, to aeft to get final flattened table
aeft=[aeft,aeft_val]; % final flattened AE hierarchy table/matrix
clear ae;
clear aeft_val;
clear val;
clear i;

%% 
% lvl 1 details
map_aelvl1=java.util.HashMap;
[m,~]=size(aelvl1);
for i=1:m
    map_aelvl1.put(aelvl1.name{i},aelvl1.id(i));
end
clear m;
clear n;
% lvl 2 details
map_aelvl2=java.util.HashMap;
[m,~]=size(aelvl2);
for i=1:m
    map_aelvl2.put(aelvl2.name{i},aelvl2.id(i));
end
clear m;
clear n;
% lvl 3 details
map_aelvl3=java.util.HashMap;
[m,~]=size(aelvl3);
for i=1:m
    map_aelvl3.put(aelvl3.name{i},aelvl3.id(i));
end
clear m;
clear n;
% lvl 4 details
map_aelvl4=java.util.HashMap;
[m,~]=size(aelvl4);
for i=1:m
    map_aelvl4.put(aelvl4.name{i},aelvl4.id(i));
end
clear m;
clear n;
%% finding cell values
%putting the results in resultsAes
resAescount=0;
[mae,nae]=size(aeCell);
resultsAes=cell(nae,4);
for i=1:nae    
    resultsAes{resAescount+1,1}=lower(aeCell(i));    
    if(map_aelvl1.containsKey(lower(aeCell{i})))
        fprintf('%s KEY= %d',lower(aeCell{i}),map_aelvl1.get(lower(aeCell{i})));     
        disp(1);        
        resAescount=resAescount+1;
        resultsAes(resAescount,2)=num2cell(map_aelvl1.get(lower(aeCell{i})));
        resultsAes(resAescount,3)=num2cell(1);
        continue;
    end 
    if(map_aelvl2.containsKey(lower(aeCell{i})))
        fprintf('%s KEY= %d',lower(aeCell{i}),map_aelvl2.get(lower(aeCell{i})));     
        disp(2);        
        resAescount=resAescount+1;
        resultsAes(resAescount,2)=num2cell(map_aelvl2.get(lower(aeCell{i})));
        resultsAes(resAescount,3)=num2cell(2);        
        continue;
    end 
    if(map_aelvl3.containsKey(lower(aeCell{i})))
        fprintf('%s KEY= %d',lower(aeCell{i}),map_aelvl3.get(lower(aeCell{i})));     
        disp(3);        
        resAescount=resAescount+1;
        resultsAes(resAescount,2)=num2cell(map_aelvl3.get(lower(aeCell{i})));
        resultsAes(resAescount,3)=num2cell(3);        
        continue;
    end 
    if(map_aelvl4.containsKey(lower(aeCell{i})))
        %a=map_aelvl4.get(lower(drugCell{i}));
        fprintf('%s KEY= %d',lower(aeCell{i}),map_aelvl4.get(lower(aeCell{i})));     
        disp(4);        
        resAescount=resAescount+1;
        resultsAes(resAescount,2)=num2cell(map_aelvl4.get(lower(aeCell{i})));
        resultsAes(resAescount,3)=num2cell(4);        
        continue;
    end 
end
[mae,nae]=size(aeCell);
[m, n]=size(aeft);
for i=1: nae    
    num=resultsAes{i,3};
    aenum=resultsAes{i,2};
    count=0;
    for j=1:m        
        if( aeft(j,num)== aenum)
            count=count+1;
            aeval{count}=aeft(j,4);            
        end        
    end  
    disp(count);    
    resultsAes{i,4}=aeval;
    clear aeval;
    clear count;
end
clear nae;
clear mae;
clear m;
clear n;
clear j;
clear num;
clear count;
clear aenum;
clear dnum;
clear i;
clear resAescount;
clear resDrugcount;
clear ans;



