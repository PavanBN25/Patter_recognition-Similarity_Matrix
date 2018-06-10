for i=1: 2    
    num=resultsDrug{i,3};
    dnum=resultsDrug{i,2};
    count=0;
    for j=1:4823        
        if( dft(j,num)== dnum)
            count=count+1;
            dval{count}=j;
        end
        
    end  
    resultsDrug{i,4}=dval;
end


   