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
% for drug testing 
drugCell={
    'caries prophylactic agents',
'antiinfectives and antiseptics for local oral treatment',
'corticosteroids for local oral treatment',
'other agents for local oral treatment',
'magnesium compounds',
'aluminium compounds',
'calcium compounds',
'combinations and complexes of aluminium, calcium and magnesium compounds',
'antacids with antiflatulents',
'antacids with antispasmodics',
'antacids with sodium bicarbonate',
'antacids, other combinations',
'h2-receptor antagonists',
'prostaglandins',
'proton pump inhibitors',
'combinations for eradication of helicobacter pylori',
'other drugs for peptic ulcer and gastro-oesophageal reflux disease (gord)',
'synthetic anticholinergics, esters with tertiary amino group',
'synthetic anticholinergics, quaternary ammonium compounds',
'synthetic antispasmodics, amides with tertiary amines',
'papaverine and derivatives',
'serotonin receptor antagonists',
'other drugs for functional gastrointestinal disorders',
'belladonna alkaloids, tertiary amines',
'belladonna alkaloids, semisynthetic, quaternary ammonium compounds',
'synthetic anticholinergic agents in combination with psycholeptics',
'belladonna and derivatives in combination with psycholeptics',
'other antispasmodics in combination with psycholeptics',
'synthetic anticholinergic agents in combination with analgesics',
'belladonna and derivatives in combination with analgesics',
'other antispasmodics in combination with analgesics',
'antispasmodics, psycholeptics and analgesics in combination',
'antispasmodics in combination with other drugs',
'propulsives',
'serotonin (5ht3) antagonists',
'other antiemetics',
'bile acid preparations',
'preparations for biliary tract therapy',
'other drugs for bile therapy',
'liver therapy',
'softeners, emollients',
'contact laxatives',
'bulk-forming laxatives',
'osmotically acting laxatives',
'enemas',
'peripheral opioid receptor antagonist',
'other drugs for constipation',
'antibiotics',
'sulfonamides',
'imidazole derivatives',
'other intestinal antiinfectives',
'charcoal preparations',
'bismuth preparations',
'other intestinal adsorbents',
'oral rehydration salt formulations',
'antipropulsives',
'corticosteroids acting locally',
'antiallergic agents, excl. corticosteroids',
'aminosalicylic acid and similar agents',
'antidiarrheal microorganisms',
'other antidiarrheals',
'centrally acting antiobesity products',
'peripherally acting antiobesity products',
'other antiobesity drugs',
'enzyme preparations',
'acid preparations',
'enzyme and acid preparations, combinations',
'insulins and analogues for injection, fast-acting',
'insulins and analogues for injection, intermediate-acting',
'insulins and analogues for injection, intermediate- or long-acting combined with fast-acting',
'insulins and analogues for injection, long-acting',
'insulins and analogues for inhalation',
'biguanides',
'sulfonylureas',
'sulfonamides (heterocyclic)',
'combinations of oral blood glucose lowering drugs',
'alpha glucosidase inhibitors',
'thiazolidinediones',
'dipeptidyl peptidase 4 (dpp-4) inhibitors',
'glucagon-like peptide-1 receptor (glp-1) analogues',
'sodium-glucose co-transporter 2 (sglt2) inhibitors',
'other blood glucose lowering drugs, excl. insulins',
'aldose reductase inhibitors',
'multivitamins with minerals',
'multivitamins, other combinations',
'multivitamins, plain',
'vitamin a, plain',
'vitamin a and d in combination',
'vitamin d and analogues',
'vitamin b1, plain',
'vitamin b1 in combination with vitamin b6 and/or vitamin b12',
'vitamin b-complex, plain',
'vitamin b-complex with vitamin c',
'vitamin b-complex with minerals',
'vitamin b-complex with anabolic steroids',
'vitamin b-complex, other combinations',
'ascorbic acid (vitamin c), plain',
'ascorbic acid (vitamin c), combinations',
'other plain vitamin preparations',
'combinations of vitamins',
'vitamins with minerals',
'vitamins, other combinations',
'calcium',
'calcium, combinations with vitamin d and/or other drugs',
'potassium',
'sodium',
'zinc',
'magnesium',
'fluoride',
'selenium',
'other mineral products',
'androstan derivatives',
'estren derivatives',
'amino acids and derivatives',
'enzymes',
'various alimentary tract and metabolism products',
'vitamin k antagonists',
'heparin group',
'platelet aggregation inhibitors excl. heparin',
'enzymes',
'direct thrombin inhibitors',
'direct factor xa inhibitors',
'other antithrombotic agents',
'amino acids',
'proteinase inhibitors',
'vitamin k',
'fibrinogen',
'local hemostatics',
'blood coagulation factors',
'other systemic hemostatics',
'iron bivalent, oral preparations',
'iron trivalent, oral preparations',
'iron, parenteral preparations',
'iron in combination with folic acid',
'iron in other combinations',
'vitamin b12 (cyanocobalamin and analogues)',
'folic acid and derivatives',
'other antianemic preparations',
'blood substitutes and plasma protein fractions',
'other blood products',
'solutions for parenteral nutrition',
'solutions affecting the electrolyte balance',
'solutions producing osmotic diuresis',
'antiinfectives',
'salt solutions',
'other irrigating solutions',
'isotonic solutions',
'hypertonic solutions',
'electrolyte solutions',
'amino acids',
'vitamins',
'other i.v. solution additives',
'hemodialytics, concentrates',
'hemofiltrates',
'enzymes',
'other hem products',
'drugs used in hereditary angioedema',
'digitalis glycosides',
'scilla glycosides',
'strophantus glycosides',
'other cardiac glycosides',
'antiarrhythmics, class ia',
'antiarrhythmics, class ib',
'antiarrhythmics, class ic',
'antiarrhythmics, class iii',
'other antiarrhythmics, class i and iii',
'adrenergic and dopaminergic agents',
'phosphodiesterase inhibitors',
'other cardiac stimulants',
'organic nitrates',
'quinolone vasodilators',
'other vasodilators used in cardiac diseases',
'prostaglandins',
'other cardiac preparations',
'other cardiac combination products',
'rauwolfia alkaloids',
'methyldopa',
'imidazoline receptor agonists',
'sulfonium derivatives',
'secondary and tertiary amines',
'bisquaternary ammonium compounds',
'alpha-adrenoreceptor antagonists',
'guanidine derivatives',
'thiazide derivatives',
'hydrazinophthalazine derivatives',
'pyrimidine derivatives',
'nitroferricyanide derivatives',
'guanidine derivatives',
'alkaloids, excl. rauwolfia',
'tyrosine hydroxylase inhibitors',
'mao inhibitors',
'serotonin antagonists',
'antihypertensive for pulmonary arterial hypertension',
'rauwolfia alkaloids and diuretics in combination',
'methyldopa and diuretics in combination',
'imidazoline receptor agonists in combination with diuretics',
'alpha-adrenoreceptor antagonists and diuretics',
'guanidine derivatives and diuretics',
'hydrazinophthalazine derivatives and diuretics',
'alkaloids, excl. rauwolfia, in combination with diuretics',
'mao inhibitors and diuretics',
'serotonin antagonists and diuretics',
'other antihypertensives and diuretics',
'thiazides, plain',
'thiazides and potassium in combination',
'thiazides, combinations with psycholeptics and/or analgesics',
'thiazides, combinations with other drugs',
'sulfonamides, plain',
'sulfonamides and potassium in combination',
'mercurial diuretics',
'xanthine derivatives',
'sulfonamides, combinations with other drugs',
'other low-ceiling diuretics',
'sulfonamides, plain',
'sulfonamides and potassium in combination',
'aryloxyacetic acid derivatives',
'pyrazolone derivatives',
'other high-ceiling diuretics',
'aldosterone antagonists',
'other potassium-sparing agents',
'low-ceiling diuretics and potassium-sparing agents',
'high-ceiling diuretics and potassium-sparing agents',
'vasopressin antagonists',
'2-amino-1-phenylethanol derivatives',
'imidazoline derivatives',
'nicotinic acid and derivatives',
'purine derivatives',
'ergot alkaloids',
'enzymes',
'other peripheral vasodilators',
'corticosteroids',
'antibiotics',
'local anesthetics',
'muscle relaxants',
'other agents for treatment of hemorrhoids and anal fissures for topical use',
'heparins or heparinoids for topical use',
'sclerosing agents for local injection',
'other sclerosing agents',
'bioflavonoids',
'other capillary stabilizing agents',
'beta blocking agents, non-selective',
'beta blocking agents, selective',
'alpha and beta blocking agents',
'beta blocking agents, non-selective, and thiazides',
'beta blocking agents, selective, and thiazides',
'alpha and beta blocking agents and thiazides',
'beta blocking agents, non-selective, and other diuretics',
'beta blocking agents, selective, and other diuretics',
'alpha and beta blocking agents and other diuretics',
'beta blocking agents, non-selective, thiazides and other diuretics',
'beta blocking agents, selective, thiazides and other diuretics',
'beta blocking agents, non-selective, and vasodilators',
'beta blocking agents, selective, and vasodilators',
'beta blocking agents and calcium channel blockers',
'beta blocking agents, other combinations',
'dihydropyridine derivatives',
'other selective calcium channel blockers with mainly vascular effects',
'phenylalkylamine derivatives',
'benzothiazepine derivatives',
'phenylalkylamine derivatives',
'other non-selective calcium channel blockers',
'calcium channel blockers and diuretics',
'ace inhibitors, plain',
'ace inhibitors and diuretics',
'ace inhibitors and calcium channel blockers',
'ace inhibitors, other combinations',
'angiotensin ii antagonists, plain',
'angiotensin ii antagonists and diuretics',
'angiotensin ii antagonists and calcium channel blockers',
'angiotensin ii antagonists, other combinations',
'renin-inhibitors',
'hmg coa reductase inhibitors',
'fibrates',
'bile acid sequestrants',
'nicotinic acid and derivatives',
'other lipid modifying agents',
'hmg coa reductase inhibitors in combination with other lipid modifying agents',
'hmg coa reductase inhibitors, other combinations',
'antibiotics',
'imidazole and triazole derivatives',
'other antifungals for topical use',
'antifungals for systemic use',
'silicone products',
'zinc products',
'soft paraffin and fat products',
'liquid plasters',
'carbamide products',
'salicylic acid preparations',
'other emollients and protectives',
'protectives against uv-radiation for topical use',
'protectives against uv-radiation for systemic use',
'cod-liver oil ointments',
'other cicatrizants',
'proteolytic enzymes',
'antihistamines for topical use',
'anesthetics for topical use',
'other antipruritics',
'tars',
'antracen derivatives',
'psoralens for topical use',
'other antipsoriatics for topical use',
'psoralens for systemic use',
'retinoids for treatment of psoriasis',
'other antipsoriatics for systemic use',
'tetracycline and derivatives',
'other antibiotics for topical use',
'sulfonamides',
'antivirals',
'other chemotherapeutics',
'corticosteroids, weak (group i)',
'corticosteroids, moderately potent (group ii)',
'corticosteroids, potent (group iii)',
'corticosteroids, very potent (group iv)',
'corticosteroids, weak, combinations with antiseptics',
'corticosteroids, moderately potent, combinations with antiseptics',
'corticosteroids, potent, combinations with antiseptics',
'corticosteroids, very potent, combinations with antiseptics',
'corticosteroids, weak, combinations with antibiotics',
'corticosteroids, moderately potent, combinations with antibiotics',
'corticosteroids, potent, combinations with antibiotics',
'corticosteroids, very potent, combinations with antibiotics',
'corticosteroids, weak, other combinations',
'corticosteroids, moderately potent, other combinations',
'corticosteroids, potent, other combinations',
'corticosteroids, very potent, other combinations',
'acridine derivatives',
'aluminium agents',
'biguanides and amidines',
'boric acid products',
'phenol and derivatives',
'nitrofuran derivatives',
'iodine products',
'quinoline derivatives',
'quaternary ammonium compounds',
'mercurial products',
'silver compounds',
'other antiseptics and disinfectants',
'medicated dressings with antiinfectives',
'zinc bandages',
'soft paraffin dressings',
'corticosteroids, combinations for treatment of acne',
'preparations containing sulfur',
'retinoids for topical use in acne',
'peroxides',
'antiinfectives for treatment of acne',
'other anti-acne preparations for topical use',
'retinoids for treatment of acne',
'other anti-acne preparations for systemic use',
'antihidrotics',
'medicated shampoos',
'androgens for topical use',
'wart and anti-corn preparations',
'agents for dermatitis, excluding corticosteroids',
'other dermatologicals',
'antibiotics',
'arsenic compounds',
'quinoline derivatives',
'organic acids',
'sulfonamides',
'imidazole derivatives',
'triazole derivatives',
'other antiinfectives and antiseptics',
'antibiotics and corticosteroids',
'quinoline derivatives and corticosteroids',
'antiseptics and corticosteroids',
'sulfonamides and corticosteroids',
'imidazole derivatives and corticosteroids',
'ergot alkaloids',
'ergot alkaloids and oxytocin incl. analogues, in combination',
'prostaglandins',
'other uterotonics',
'intrauterine contraceptives',
'intravaginal contraceptives',
'sympathomimetics, labour repressants',
'prolactine inhibitors',
'antiinflammatory products for vaginal administration',
'other gynecologicals',
'progestogens and estrogens, fixed combinations',
'progestogens and estrogens, sequential preparations',
'progestogens',
'emergency contraceptives',
'3-oxoandrosten (4) derivatives',
'5-androstanon (3) derivatives',
'natural and semisynthetic estrogens, plain',
'synthetic estrogens, plain',
'estrogens, combinations with other drugs',
'other estrogens',
'pregnen (4) derivatives',
'pregnadien derivatives',
'estren derivatives',
'androgens and estrogens',
'androgen, progestogen and estrogen in combination',
'androgens and female sex hormones in combination with other drugs',
'progestogens and estrogens, fixed combinations',
'progestogens and estrogens, sequential preparations',
'gonadotropins',
'ovulation stimulants, synthetic',
'antiandrogens, plain',
'antiandrogens and estrogens',
'antigonadotropins and similar agents',
'progesterone receptor modulators',
'selective estrogen receptor modulators',
'acidifiers',
'urinary concrement solvents',
'urinary antispasmodics',
'drugs used in erectile dysfunction',
'other urologicals',
'alpha-adrenoreceptor antagonists',
'testosterone-5-alpha reductase inhibitors',
'other drugs used in benign prostatic hypertrophy',
'acth',
'thyrotropin',
'somatropin and somatropin agonists',
'other anterior pituitary lobe hormones and analogues',
'vasopressin and analogues',
'oxytocin and analogues',
'gonadotropin-releasing hormones',
'somatostatin and analogues',
'anti-gonadotropin-releasing hormones',
'mineralocorticoids',
'glucocorticoids',
'corticosteroids for systemic use, combinations',
'anticorticosteroids',
'thyroid hormones',
'thiouracils',
'sulfur-containing imidazole derivatives',
'perchlorates',
'other antithyroid preparations',
'iodine therapy',
'glycogenolytic hormones',
'parathyroid hormones and analogues',
'calcitonin preparations',
'other anti-parathyroid agents',
'tetracyclines',
'amphenicols',
'penicillins with extended spectrum',
'beta-lactamase sensitive penicillins',
'beta-lactamase resistant penicillins',
'beta-lactamase inhibitors',
'combinations of penicillins, incl. beta-lactamase inhibitors',
'first-generation cephalosporins',
'second-generation cephalosporins',
'third-generation cephalosporins',
'fourth-generation cephalosporins',
'monobactams',
'carbapenems',
'other cephalosporins and penems',
'trimethoprim and derivatives',
'short-acting sulfonamides',
'intermediate-acting sulfonamides',
'long-acting sulfonamides',
'combinations of sulfonamides and trimethoprim, incl. derivatives',
'macrolides',
'lincosamides',
'streptogramins',
'streptomycins',
'other aminoglycosides',
'fluoroquinolones',
'other quinolones',
'combinations of antibacterials',
'glycopeptide antibacterials',
'polymyxins',
'steroid antibacterials',
'imidazole derivatives',
'nitrofuran derivatives',
'other antibacterials',
'antibiotics',
'imidazole derivatives',
'triazole derivatives',
'other antimycotics for systemic use',
'aminosalicylic acid and derivatives',
'antibiotics',
'hydrazides',
'thiocarbamide derivatives',
'other drugs for treatment of tuberculosis',
'combinations of drugs for treatment of tuberculosis',
'drugs for treatment of lepra',
'thiosemicarbazones',
'nucleosides and nucleotides excl. reverse transcriptase inhibitors',
'cyclic amines',
'phosphonic acid derivatives',
'protease inhibitors',
'nucleoside and nucleotide reverse transcriptase inhibitors',
'non-nucleoside reverse transcriptase inhibitors',
'neuraminidase inhibitors',
'antivirals for treatment of hiv infections, combinations',
'other antivirals',
'immune sera',
'immunoglobulins, normal human',
'specific immunoglobulins',
'other immunoglobulins',
'anthrax vaccines',
'brucellosis vaccines',
'cholera vaccines',
'diphtheria vaccines',
'hemophilus influenzae b vaccines',
'meningococcal vaccines',
'pertussis vaccines',
'plague vaccines',
'pneumococcal vaccines',
'tetanus vaccines',
'tuberculosis vaccines',
'typhoid vaccines',
'typhus (exanthematicus) vaccines',
'other bacterial vaccines',
'encephalitis vaccines',
'influenza vaccines',
'hepatitis vaccines',
'measles vaccines',
'mumps vaccines',
'poliomyelitis vaccines',
'rabies vaccines',
'rota virus diarrhea vaccines',
'rubella vaccines',
'varicella zoster vaccines',
'yellow fever vaccines',
'papillomavirus vaccines',
'other viral vaccines',
'bacterial and viral vaccines, combined',
'nitrogen mustard analogues',
'alkyl sulfonates',
'ethylene imines',
'nitrosoureas',
'epoxides',
'other alkylating agents',
'folic acid analogues',
'purine analogues',
'pyrimidine analogues',
'vinca alkaloids and analogues',
'podophyllotoxin derivatives',
'colchicine derivatives',
'taxanes',
'other plant alkaloids and natural products',
'actinomycines',
'anthracyclines and related substances',
'other cytotoxic antibiotics',
'platinum compounds',
'methylhydrazines',
'monoclonal antibodies',
'sensitizers used in photodynamic/radiation therapy',
'protein kinase inhibitors',
'other antineoplastic agents',
'combinations of antineoplastic agents',
'estrogens',
'progestogens',
'gonadotropin releasing hormone analogues',
'other hormones',
'anti-estrogens',
'anti-androgens',
'aromatase inhibitors',
'other hormone antagonists and related agents',
'colony stimulating factors',
'interferons',
'interleukins',
'other immunostimulants',
'selective immunosuppressants',
'tumor necrosis factor alpha inhibitors',
'interleukin inhibitors',
'calcineurin inhibitors',
'other immunosuppressants',
'butylpyrazolidines',
'acetic acid derivatives and related substances',
'oxicams',
'propionic acid derivatives',
'fenamates',
'coxibs',
'other antiinflammatory and antirheumatic agents, non-steroids',
'antiinflammatory/antirheumatic agents in combination with corticosteroids',
'other antiinflammatory/antirheumatic agents in combination with other drugs',
'quinolines',
'gold preparations',
'penicillamine and similar agents',
'other specific antirheumatic agents',
'antiinflammatory preparations, non-steroids for topical use',
'capsaicin and similar agents',
'preparations with salicylic acid derivatives',
'other topical products for joint and muscular pain',
'curare alkaloids',
'choline derivatives',
'other quaternary ammonium compounds',
'other muscle relaxants, peripherally acting agents',
'carbamic acid esters',
'oxazol, thiazine, and triazine derivatives',
'ethers, chemically close to antihistamines',
'other centrally acting agents',
'dantrolene and derivatives',
'preparations inhibiting uric acid production',
'preparations increasing uric acid excretion',
'preparations with no effect on uric acid metabolism',
'other antigout preparations',
'bisphosphonates',
'bisphosphonates, combinations',
'bone morphogenetic proteins',
'other drugs affecting bone structure and mineralization',
'quinine and derivatives',
'enzymes',
'other drugs for disorders of the musculo-skeletal system',
'ethers',
'halogenated hydrocarbons',
'barbiturates, plain',
'barbiturates in combination with other drugs',
'opioid anesthetics',
'other general anesthetics',
'esters of aminobenzoic acid',
'amides',
'esters of benzoic acid',
'other local anesthetics',
'natural opium alkaloids',
'phenylpiperidine derivatives',
'diphenylpropylamine derivatives',
'benzomorphan derivatives',
'oripavine derivatives',
'morphinan derivatives',
'opioids in combination with antispasmodics',
'opioids in combination with non-opioid analgesics',
'other opioids',
'salicylic acid and derivatives',
'pyrazolones',
'anilides',
'other analgesics and antipyretics',
'ergot alkaloids',
'corticosteroid derivatives',
'selective serotonin (5ht1) agonists',
'other antimigraine preparations',
'barbiturates and derivatives',
'hydantoin derivatives',
'oxazolidine derivatives',
'succinimide derivatives',
'benzodiazepine derivatives',
'carboxamide derivatives',
'fatty acid derivatives',
'other antiepileptics',
'tertiary amines',
'ethers chemically close to antihistamines',
'ethers of tropine or tropine derivatives',
'dopa and dopa derivatives',
'adamantane derivatives',
'dopamine agonists',
'monoamine oxidase b inhibitors',
'other dopaminergic agents',
'phenothiazines with aliphatic side-chain',
'phenothiazines with piperazine structure',
'phenothiazines with piperidine structure',
'butyrophenone derivatives',
'indole derivatives',
'thioxanthene derivatives',
'diphenylbutylpiperidine derivatives',
'diazepines, oxazepines and thiazepines',
'benzamides',
'lithium',
'other antipsychotics',
'benzodiazepine derivatives',
'diphenylmethane derivatives',
'carbamates',
'dibenzo-bicyclo-octadiene derivatives',
'azaspirodecanedione derivatives',
'other anxiolytics',
'barbiturates, plain',
'barbiturates, combinations',
'aldehydes and derivatives',
'benzodiazepine derivatives',
'piperidinedione derivatives',
'benzodiazepine related drugs',
'melatonin receptor agonists',
'other hypnotics and sedatives',
'hypnotics and sedatives in combination, excl. barbiturates',
'non-selective monoamine reuptake inhibitors',
'selective serotonin reuptake inhibitors',
'monoamine oxidase inhibitors, non-selective',
'monoamine oxidase a inhibitors',
'other antidepressants',
'centrally acting sympathomimetics',
'xanthine derivatives',
'other psychostimulants and nootropics',
'antidepressants in combination with psycholeptics',
'psychostimulants in combination with psycholeptics',
'anticholinesterases',
'other anti-dementia drugs',
'anticholinesterases',
'choline esters',
'other parasympathomimetics',
'drugs used in nicotine dependence',
'drugs used in alcohol dependence',
'drugs used in opioid dependence',
'antivertigo preparations',
'gangliosides and ganglioside derivatives',
'other nervous system drugs',
'hydroxyquinoline derivatives',
'nitroimidazole derivatives',
'dichloroacetamide derivatives',
'arsenic compounds',
'other agents against amoebiasis and other protozoal diseases',
'aminoquinolines',
'biguanides',
'methanolquinolines',
'diaminopyrimidines',
'artemisinin and derivatives, plain',
'artemisinin and derivatives, combinations',
'other antimalarials',
'nitroimidazole derivatives',
'antimony compounds',
'nitrofuran derivatives',
'arsenic compounds',
'other agents against leishmaniasis and trypanosomiasis',
'quinoline derivatives and related substances',
'organophosphorous compounds',
'other antitrematodal agents',
'benzimidazole derivatives',
'piperazine and derivatives',
'tetrahydropyrimidine derivatives',
'imidazothiazole derivatives',
'avermectines',
'other antinematodals',
'salicylic acid derivatives',
'other anticestodals',
'sulfur containing products',
'chlorine containing products',
'pyrethrines, incl. synthetic compounds',
'other ectoparasiticides, incl. scabicides',
'pyrethrines',
'other insecticides and repellents',
'sympathomimetics, plain',
'sympathomimetics, combinations excl. corticosteroids',
'antiallergic agents, excl. corticosteroids',
'corticosteroids',
'other nasal preparations',
'sympathomimetics',
'antiseptics',
'antibiotics',
'anesthetics, local',
'other throat preparetions',
'alpha- and beta-adrenoreceptor agonists',
'non-selective beta-adrenoreceptor agonists',
'selective beta-2-adrenoreceptor agonists',
'combinations of adrenergics',
'adrenergics in combination with corticosteroids or other drugs, excl. anticholinergics',
'adrenergics in combination with anticholinergics',
'glucocorticoids',
'anticholinergics',
'antiallergic agents, excl. corticosteroids',
'other drugs for obstructive airway diseases, inhalants',
'alpha- and beta-adrenoreceptor agonists',
'non-selective beta-adrenoreceptor agonists',
'selective beta-2-adrenoreceptor agonists',
'adrenergics and other drugs for obstructive airway diseases',
'xanthines',
'xanthines and adrenergics',
'leukotriene receptor antagonists',
'other systemic drugs for obstructive airway diseases',
'expectorants',
'mucolytics',
'opium alkaloids and derivatives',
'other cough suppressants',
'opium derivatives and expectorants',
'other cough suppressants and expectorants',
'aminoalkyl ethers',
'substituted alkylamines',
'substituted ethylene diamines',
'phenothiazine derivatives',
'piperazine derivatives',
'combinations of antihistamines',
'other antihistamines for systemic use',
'lung surfactants',
'respiratory stimulants',
'other respiratory system products',
'antibiotics',
'sulfonamides',
'antivirals',
'fluoroquinolones',
'other antiinfectives',
'corticosteroids, plain',
'corticosteroids and mydriatics in combination',
'antiinflammatory agents, non-steroids',
'corticosteroids and antiinfectives in combination',
'corticosteroids/antiinfectives/mydriatics in combination',
'antiinflammatory agents, non-steroids and antiinfectives in combination',
'sympathomimetics in glaucoma therapy',
'parasympathomimetics',
'carbonic anhydrase inhibitors',
'beta blocking agents',
'prostaglandin analogues',
'other antiglaucoma preparations',
'anticholinergics',
'sympathomimetics excl. antiglaucoma preparations',
'sympathomimetics used as decongestants',
'other antiallergics',
'local anesthetics',
'colouring agents',
'other ophthalmological diagnostic agents',
'viscoelastic substances',
'other surgical aids',
'antineovascularisation agents',
'other ophthalmologicals',
'antiinfectives',
'corticosteroids',
'corticosteroids and antiinfectives in combination',
'analgesics and anesthetics',
'indifferent preparations',
'antiinfectives',
'corticosteroids',
'corticosteroids and antiinfectives in combination',
'allergen extracts',
'antidotes',
'iron chelating agents',
'drugs for treatment of hyperkalemia and hyperphosphatemia',
'detoxifying agents for antineoplastic treatment',
'drugs for treatment of hypercalcemia',
'drugs for treatment of hypoglycemia',
'tissue adhesives',
'drugs for embolisation',
'medical gases',
'other therapeutic products',
'nerve depressants',
'tests for diabetes',
'tests for fat absorption',
'tests for bile duct patency',
'tests for pituitary function',
'tests for liver functional capacity',
'tuberculosis diagnostics',
'tests for gastric secretion',
'tests for renal function',
'tests for thyreoidea function',
'tests for pancreatic function',
'tests for allergic diseases',
'tests for fertility disturbances',
'other diagnostic agents',
'low-energy diets',
'nutrients without phenylalanine',
'carbohydrates/proteins/minerals/vitamins, combinations',
'fat/carbohydrates/proteins/minerals/vitamins, combinations',
'carbohydrates',
'amino acids, incl. combinations with polypeptides',
'amino acids/carbohydrates/minerals/vitamins, combinations',
'milk substitutes',
'other combinations of nutrients',
'plasters',
'solvents and diluting agents, incl. irrigating solutions',
'blood transfusion, auxiliary products',
'blood tests, auxiliary products',
'incontinence equipment',
'sensitivity tests, discs and tablets',
'stomi equipment',
'cosmetics',
'technical disinfectants',
'washing agents etc.',
'other non-therapeutic auxiliary products',
'chemicals and reagents for analysis',
'watersoluble, nephrotropic, high osmolar x-ray contrast media',
'watersoluble, nephrotropic, low osmolar x-ray contrast media',
'watersoluble, hepatotropic x-ray contrast media',
'non-watersoluble x-ray contrast media',
'barium sulfate containing x-ray contrast media',
'paramagnetic contrast media',
'superparamagnetic contrast media',
'other magnetic resonance imaging contrast media',
'ultrasound contrast media',
'technetium (99mtc) compounds',
'iodine (123i) compounds',
'other central nervous system diagnostic radiopharmaceuticals',
'technetium (99mtc) compounds',
'technetium (99mtc) compounds',
'other renal system diagnostic radiopharmaceuticals',
'technetium (99mtc) compounds',
'technetium (99mtc), particles and colloids',
'other hepatic and reticulo endothelial system diagnostic radiopharmaceuticals',
'technetium (99mtc), inhalants',
'technetium (99mtc), particles for injection',
'other respiratory system diagnostic radiopharmaceuticals',
'various thyroid diagnostic radiopharmaceuticals',
'technetium (99mtc) compounds',
'iodine (125i) compounds',
'other cardiovascular system diagnostic radiopharmaceuticals',
'technetium (99mtc) compounds',
'indium (111in) compounds',
'other diagnostic radiopharmaceuticals for inflammation and infection detection',
'technetium (99mtc) compounds',
'indium (111in) compounds',
'other diagnostic radiopharmaceuticals for tumour detection',
'iodine (131i) compounds',
'various diagnostic radiopharmaceuticals',
'yttrium (90y) compounds',
'other antiinflammatory therapeutic radiopharmaceuticals',
'various pain palliation radiopharmaceuticals',
'iodine (131i) compounds',
'various therapeutic radiopharmaceuticals'
    };
%drugCell={'IMMUNOSUPPRESSANTS'};
aeCell={'Parenchymal lung disorders NEC','Pulmonary oedemas'};

%find which level the cell values are 

%% insering values into hashmaps 
% lvl 1 details
map_dclvl1=java.util.HashMap;
[m,n]=size(dlvl1);
for i=1:m
    map_dclvl1.put(dlvl1.name{i},dlvl1.id(i));
end
clear m;
clear n;
% lvel 2 details;
map_dclvl2=java.util.HashMap;
[m, n]=size(dlvl2);
for i=1:m
    map_dclvl2.put(dlvl2.name{i},dlvl2.id(i));
end
clear m;
clear n;
%level 3 details;
map_dclvl3=java.util.HashMap;
[m, n]=size(dlvl3);
for i=1:m
    map_dclvl3.put(dlvl3.name{i},dlvl3.id(i));
end
clear m;
clear n;

%level 4 details;
map_dclvl4=java.util.HashMap;
[m,n]=size(dlvl4);
for i=1:m
    map_dclvl4.put(dlvl4.name{i},dlvl4.id(i));
end
clear m;
clear n;

%level 5 details;
map_dclvl5=java.util.HashMap;
[m n]=size(dlvl5);
for i=1:m
    map_dclvl5.put(dlvl5.name{i},dlvl5.id(i));
end
clear m;
clear n;

%% finding the cell values;
[mdc,ndc]=size(drugCell);
%putting the results in resultsDrug
resDrugcount=0;
resultsDrug=cell(ndc,4);

if(mdc>ndc)
    ndc=mdc;
end

for i=1:ndc
    
    resultsDrug{resDrugcount+1,1}=lower(drugCell(i));
    
    if(map_dclvl1.containsKey(lower(drugCell{i})))
        fprintf('KEY= %d',map_dclvl1.get(lower(drugCell{i})));      
        disp(1);
        resDrugcount=resDrugcount+1;
        resultsDrug{resDrugcount,2}=num2cell(map_dclvl4.get(lower(drugCell{i})));
        resultsDrug{resDrugcount,3}=num2cell(1);
        continue;
    end 
    if(map_dclvl2.containsKey(lower(drugCell{i})))
        fprintf('KEY= %d',map_dclvl2.get(lower(drugCell{i})));
       
        disp(2);
        resDrugcount=resDrugcount+1;
        resultsDrug(resDrugcount,2)=num2cell(map_dclvl4.get(lower(drugCell{i})));
        resultsDrug(resDrugcount,3)=num2cell(2);
        continue;
    end 
    if(map_dclvl3.containsKey(lower(drugCell{i})))
        fprintf('KEY= %d',map_dclvl3.get(lower(drugCell{i})));
        
        disp(3);
        resDrugcount=resDrugcount+1;
        resultsDrug(resDrugcount,2)=num2cell(map_dclvl4.get(lower(drugCell{i})));
        resultsDrug(resDrugcount,3)=num2cell(3);
        continue;
    end 
    if(map_dclvl4.containsKey(lower(drugCell{i})))
        a=map_dclvl4.get(lower(drugCell{i}));
        fprintf('KEY= %d',map_dclvl4.get(lower(drugCell{i})));
        %disp(map_dclvl1.get(lower(drugCell{i})));
        disp(4);
        resDrugcount=resDrugcount+1;
        %resultsDrug{resDrugcount,1}=lower(drugCell(i));
        resultsDrug(resDrugcount,2)=num2cell(map_dclvl4.get(lower(drugCell{i})));
        resultsDrug(resDrugcount,3)=num2cell(4);        
        continue;
    end 
    if(map_dclvl5.containsKey(lower(drugCell{i})))
        fprintf('KEY= %d',map_dclvl5.get(lower(drugCell{i})));        
        disp(5);
        resDrugcount=resDrugcount+1;        
        resultsDrug(resDrugcount,2)=num2cell(map_dclvl5.get(lower(drugCell{i})));
        resultsDrug(resDrugcount,3)=num2cell(5);
        continue;
    end 
end

%%
%resultsDrug contains information about the level of the drug/drug class
%and its unique id in that level.
%traversing through the table in that level for the unique id we have got,
%we can get all the leaf level ids(drug ids)

[mdc,ndc]=size(drugCell);
[m, n]=size(dft);

if(mdc>ndc)
    ndc=mdc;
end

for i=1: ndc    
    num=resultsDrug{i,3}; % level
    dnum=resultsDrug{i,2}; % drug class id(unique)
    count=0;
    for j=1:m        
        if( dft(j,num)== dnum)
            count=count+1;
            dval{count}=dft(j,5);
        end        
    end  
    if(count>0)        
        resultsDrug{i,4}=dval;
    else
        resultsDrug{i,4}=0;
    end
    clear dval;
    clear count;
end
clear m;
clear n;
clear mdc;
clear ndc;
clear a;
clear i;
clear ans;
clear resDrugcount;

