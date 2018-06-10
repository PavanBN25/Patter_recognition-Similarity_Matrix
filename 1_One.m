%%___
load('clustering.mat');

%import drug details
dft=new_importfileFT('res1txt2.txt');%drug heirarchy table
dlvl1=new_importfile('lvl1.txt');    %level1 drugs: root level
dlvl2=new_importfile('lvl2.txt');    %level2 drugs
dlvl3=new_importfile('lvl3.txt');    %level3 drugs
dlvl4=new_importfile('lvl4.txt');    %level4 drugs
dlvl5=new_importfile('lvl5.txt');    %level5 drugs: leaf level
                                     %ft=importfile1('FlattenedTree.txt');

%import AE details
aeft=new_importfileAEFT('AEontoFullMAt2.txt');  % ae heirarchy table
aelvl1=new_importfile('AEontolvl1.txt');        % level1 AE's: root level
aelvl2=new_importfile('AEontolvl2.txt');        % level2 AE's
aelvl3=new_importfile('AEontolvl3.txt');        % level3 AE's
aelvl4=new_importfile('AEontolvl4.txt');        % level4 AE's: leaf level

drugCell={'Tumor necrosis factor alpha inhibitors','Glucocorticoids'};
%drugCell={'IMMUNOSUPPRESSANTS'};
aeCell={'Parenchymal lung disorders NEC','Pulmonary oedemas'};


% num_lvls=5;
% 
% lvls=cell(num_lvls,1);
% 
% for i=1:num_lvls
% %     lvls{i}=strrep(ft(:,i),'"','');
% end




