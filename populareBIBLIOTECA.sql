DROP TABLE angajati CASCADE CONSTRAINTS
/
DROP TABLE autori CASCADE CONSTRAINTS
/
DROP TABLE carti CASCADE CONSTRAINTS
/
DROP TABLE imprumuturi CASCADE CONSTRAINTS
/
DROP TABLE membership CASCADE CONSTRAINTS
/
DROP TABLE tranzactii CASCADE CONSTRAINTS
/
DROP TABLE useri CASCADE CONSTRAINTS
/


CREATE TABLE autori (
  id_autor INT NOT NULL PRIMARY KEY,
  nume_autor VARCHAR2(15) NOT NULL,
  prenume_autor VARCHAR2(30) NOT NULL,
  nationalitate VARCHAR2(20),
  created_at DATE,
  updated_at DATE
)
/
CREATE TABLE useri (
  id_user INT NOT NULL PRIMARY KEY,
  user_name VARCHAR2(55) NOT NULL,
  pass VARCHAR2(55) NOT NULL,
  nume VARCHAR2(15) NOT NULL,
  prenume VARCHAR2(30) NOT NULL,
  gender VARCHAR2(20),
  created_at DATE,
  updated_at DATE
)
/
CREATE TABLE carti (
  id_carte INT NOT NULL PRIMARY KEY,
  id_autor_c INT NOT NULL,
  titlu_carte VARCHAR2(50) NOT NULL,
  an_publicatie DATE,
  gen_carte VARCHAR2(50) NOT NULL,
  nr_disponibile NUMBER(2),
  nr_totale NUMBER(2),
  pret NUMBER(2),
  created_at DATE,
  updated_at DATE,
 CONSTRAINT fk_carti_id_autor_c FOREIGN KEY (id_autor_c) REFERENCES autori(id_autor)
)DROP TABLE angajati CASCADE CONSTRAINTS
/
DROP TABLE autori CASCADE CONSTRAINTS
/
DROP TABLE carti CASCADE CONSTRAINTS
/
DROP TABLE imprumuturi CASCADE CONSTRAINTS
/
DROP TABLE membership CASCADE CONSTRAINTS
/
DROP TABLE tranzactii CASCADE CONSTRAINTS
/
DROP TABLE useri CASCADE CONSTRAINTS
/


CREATE TABLE autori (
  id_autor INT NOT NULL PRIMARY KEY,
  nume_autor VARCHAR2(15) NOT NULL,
  prenume_autor VARCHAR2(30) NOT NULL,
  nationalitate VARCHAR2(20),
  created_at DATE,
  updated_at DATE
)
/
CREATE TABLE useri (
  id_user INT NOT NULL PRIMARY KEY,
  user_name VARCHAR2(55) NOT NULL,
  pass VARCHAR2(55) NOT NULL,
  nume VARCHAR2(15) NOT NULL,
  prenume VARCHAR2(30) NOT NULL,
  gender VARCHAR2(20),
  phone VARCHAR2(15),
  address  VARCHAR2(150) NOT NULL,
  email_address  VARCHAR2(50) NOT NULL,
  created_at DATE,
  updated_at DATE
)
/
CREATE TABLE carti (
  id_carte INT NOT NULL PRIMARY KEY,
  id_autor_c INT NOT NULL,
  titlu_carte VARCHAR2(50) NOT NULL,
  an_publicatie DATE,
  gen_carte VARCHAR2(50) NOT NULL,
  nr_disponibile NUMBER(2),
  nr_totale NUMBER(2),
  pret NUMBER(4),
  created_at DATE,
  updated_at DATE,
 CONSTRAINT fk_carti_id_autor_c FOREIGN KEY (id_autor_c) REFERENCES autori(id_autor)
)
/
CREATE TABLE membership (
  id_membership INT NOT NULL,
  valoare_platita INT NOT NULL,
  tip INT NOT NULL,
  created_at DATE,
  updated_at DATE,
  CONSTRAINT fk_membership_id_membership FOREIGN KEY (id_membership) REFERENCES useri(id_user)
  
)
/
CREATE TABLE tranzactii (
  id_tranzactie INT NOT NULL PRIMARY KEY,
  id_carte INT NOT NULL,
  id_cumparator INT NOT NULL,
  tip INT NOT NULL,
  created_at DATE,
  updated_at DATE,
  CONSTRAINT fk_tranzactii_id_carte FOREIGN KEY (id_carte) REFERENCES carti(id_carte),
  CONSTRAINT fk_tranzactii_id_cumparator FOREIGN KEY (id_cumparator) REFERENCES useri(id_user) 
)
/
CREATE TABLE imprumuturi (
  id_imprumut INT NOT NULL PRIMARY KEY,
  id_carte_i INT NOT NULL,
  id_datornic INT NOT NULL,
  data_tranzactie DATE NOT NULL,
  data_limita DATE NOT NULL,
  created_at DATE,
  updated_at DATE,  
 CONSTRAINT fk_imprumuturi_id_carte_i FOREIGN KEY (id_carte_i) REFERENCES carti(id_carte),
 CONSTRAINT fk_imprumuturi_id_datornic FOREIGN KEY (id_datornic) REFERENCES useri(id_user)
)
/
CREATE TABLE angajati (
  id_angajat INT NOT NULL PRIMARY KEY,
  nume VARCHAR2(15) NOT NULL,
  prenume VARCHAR2(30) NOT NULL,
  data_nastere DATE NOT NULL,
  salariu INT NOT NULL,
  created_at DATE,
  updated_at DATE
 
)
/



SET SERVEROUTPUT ON;

DECLARE
  TYPE varr IS VARRAY(210000) OF varchar2(1255);
   lista_address varr := varr('gmail','yahoo','live','hotmail','me','outlook','aol','zoho');
   lista_address_oras varr := varr('Iasi','Galati','Bucuresti','Cluj','Roman','Buzau','Tulcea','Tecuci','Bacau','Vaslui','Barlad','Suceava','Botosani'
   ,'Vrancea','Sibiu','Timis','Timisoara');
   lista_address_strada varr := varr('Teiului','Stefan cel mare','Ion Creanga','Florilor','Revolutiei','Bucium','Copou','Berzei','Pietei','Universitatii','Medicinei',
   'Victoriei','Invierii','Garii','Dadlei');
   lista_adjective varr := varr('buc?laie','bucle','caudine','dulce','eficace','fiece','fierbinte','fitece','abandonat','abaxial','ab?tut','abdominal','aberant','aberativ','abil','abiotic','abisal','abject',
'ablativ','abnorm','aboli?ionist','abominabil','abordabil','abortiv','abracadabrant','abra?','abraziv','abreviat',
'abreviativ','abrogat','abrupt','abrutizant','abrutizat','abscons','absent','absenteist','absidial','absolut',
'absolutist','absolutoriu','absorbant','absorbit','absten?ionist','abstract','abstrac?ionist','abstrus','absurd','ab?iguit',
'abulic','abundent','aburit','aburos','abuziv','academic','acaju','acaloric','acatalectic','ac?t?rii',
'accelerat','accelerated','accentuat','acceptabil','accesibil','accesoriu','accidental','accidentat','acefal','acel',
'acela','acela?i','acerb','acest','acesta','acetic','acetilsalicilic','acherontic','achitat','achiu',
'aciclic','acid','acidificat','acidofil','acidulat','acinos','aclinic','acomodabil','acoperit','acordabil',
'acordat','acordic','acotiledonat','acreditat','acrescent','acrilic','acrit','acriu','acrobatic','acrocefal',
'acromat','acromatic','acronic','acru','acru?','actinic','actinometric','actinomorf','activ','activant',
'actoricesc','actual','aculeat','aculeiform','acumbet','acuminat','acurat','acustic','acut','acuzat',
'acvafortist','acvatic','ad-interim','adaptabil','adaptiv','ad?ugit','ad?ugit?','adânc','adâncat','adâncit',
'adâncos','adecvat','ademenit','adenoid','adept','aderent','adev?rat','adeziv','adiabatic','adiacent',
'adipic','adipos','aditiv','adi?ional','adi?ionat','adjectival','adjectivat','adjectivizat','adjunct','adjuvant',
'administrativ','admirabil','admirativ','admisibil','admonitiv','adnat','adnotat','adogmatic','adonic','adoptiv',
'adorabil','adorat','adormit','adpres','adrenergic','adult','adus','adventist','adventiv','adverbial',
'adverbializat','advers','adversativ','aerat','aeriform','amabil','amalgamat','amarnic','am?git','am?nunt',
'am?nun?it','am?rât','am?riu','am?rui','amânat','ambetant','ambiant','ambidextru','ambiental','ambiguizat',
'ambiguu','ambi?ios','ambivalent','ambliop','ambroziac','ambulant','ambulatoriu','ambuscat','ambuteiat','ameliorabil',
'ameliorant','ameliorativ','amenajabil','amenajat','amendabil','americ?nesc','amestecat','ametabol?','ametrop','ame?it',
'amfibiu','amfibologic','amfibrahic','amfiguric','amiabil','amical','amielinic','amigdaloid','amilaceu','amnezic',
'amniot','amnistiabil','amoniacal','amoral','amoralist','amorezat','amorf','amoros','amortibil','amortizabil',
'amor?it','amovibil','ampelografic','amplectiv','amplexicaul','amplu','amuzant','anabaptist','anabatic','anabolic',
'anaciclic','anacreontic','anacronic','anacronistic','anacruzic','anaerob','anaerobiotic','anafilactic','anaforic','anafrodiziac',
'anagliptic','anagogic','anagramatic','anahoretic','anal','analeptic','analfabet','analgeziant','analgezic','analitic',
'analizabil','analog','analogic','anamorfozat','anapestic','anaplastic','anarhic','anarhist','anastaltic','anastatic',
'anastigmat','anastigmatic','anastomotic','anastomozat','anatomic','anatomopatologic','ancestral','anchilozat','anclan?at','andaluz',
'andezitic','andosat','aneantizat','anecdotic','anecoid','anemiat','anemic','anemofil','anemometric','aneroid',
'anesteziant','anestezic','aneuploid','anevoios','anevrismal','anevrismatic','anex','anexat','anexionist','angajant',
'angajat','angelic','angelolatru','angiografic','angiologic','angiosperm','anglofil','anglofob','angoasant','angoasat',
'angolez','angrenat','angrosist','anhidru','aniconic','animal','animalic','animat','animist','anistoric',
'anizotrop','anodic','anomal','anonim','anorectic','anorganic','anormal','anost','anseriform','antagonic',
'antagonist','antalgic','antarctic','antebelic','antecalculat','antecedent','antenatal','antenup?ial','antepenultim','anteprogramat',
'bilateral','bildungsromanesc','bilingv','bilios','bilobat','bimensual','bimetalic','bimetalist','binecuvântat','bioacustic',
'bioastronautic','biobibliografic','biocenotic','biochimic','biocibernetic','biocinetic','bioclimatic','biocompatibil','biodegradabil','biodinamic',
'bioelectric','bioenergetic','biofizic','biogenetic','biogeochimic','biogeografic','biografic','biologic','biologizant','bioluminescent',
'biomatematic','biomedical','biometeorologic','bionic','biopsic','biosociologic','biospeologic','biostatistic','biostimulent','biotehnic',
'biotelemetric','biotic','bipartid','bipartit','biped','birefringent','birj?resc','birocratic','birocratizat','biruit',
'bis','bis?pt?mânal','bisect','bisericesc','bisericos','bisextil','bisexual','bisexuat','bisilabic','bisimetric',
'bistri?','bisulc','bituminos','biunivoc','biv','bivalent','bivalv','blagoslovit','blamabil','blamat',
'blazat','bl?nos','blând','blea?c?','bleg','blegit','blenoragic','bleojdit','bleot','blestemat',
'bleu','blindat','blond','bluzat','bobletic','boble?','bobo?it','bocciu','boem','bogasieresc',
'bogat','boghet','bogomilic','boieresc','boieros','boit','bolând','bolbo?at','boldit','bolnav',
'boln?vicios','bolometric','bolov?nit','bolov?nos','bol?evic','boltit','bombastic','bombat','bonapartist','bondoc',
'bondocel','bont','borât','borc?nat','bordo','boreal','boric','boricat','bornat','bor?it',
'bortelit','bortit','bor?os','bosniac','bosumflat','bo?orog','botanic','botezat','botos','botulinic',
'bo?it','bourel','bouresc','bracteal','bradicardic','brahial','brahicefal','brahmanic','bramburit','branhial',
'brav','br?cuit','br?zdat','brânzit','brânzos','breaz','brevetat','brevilocvent','briant','bric',
'britanic','brizant','brodat','bromhidric','bromic','bronhial','bronhic','bron?itic','bronzat','brosc?resc',
'bro?at','bro?tesc','brudiu','brudnic','bruiat','brumat','brumatic','brum?riu','brumos','brunat',
'brunet','brusc','brut','brutal','bubonic','bubos','buburos','bucal','buc?lai','buc?lat',
'buc?liu','buciardat','buclat','bucluca?','bucolic','bucuros','budist','buf','bufant','buged',
'buh?it','buhos','buiac','buiestra?','buiestru','buimac','buimatic','buim?cit','bulbiform','bulbos',
'bulbucat','buldozerist','bulg?resc','bulg?ros','bulimic','bulonat','bulversat','bunicel','bunu?','burduh?nos',
'burduhos','burdu?it','buretos','burghez','burgund','burlesc','burni?os','burticos','burtos','buruienos',
'burzuluit','busnat','busuioc','butac','butaforic','but??it','butilic','butiric','butuc?nos','butucos',
'buvabil','buzat','buz??el','buz?u','cabalistic','cablat','cabotinesc','cacofonic','cadastral','cadaveric',
'caden?at','cadrilat','caduc','cafard','cafeniu','cainic','cainozoic','calabrez','calamitat','calandrat',
'calcaros','calcic','calcicol','calcificat','calcifil','calcifug','calcinat','calcografiat','calcografic','calculabil',
'calculat','calculos','cald','caledonian?','caleidoscopic','calendaristic','calicesc','caliciform','calificabil','calificat',
'calificativ','caligrafic','calitativ','calm','calmant','calmat','calmuc','calmucesc','calofil','calofilic',
'calomnios','caloric','calorific','calorifug','calorimetric','calos','calp','calvinesc','calvinist','camaraderesc',
'cambial','cambrat','cameleonic','cameral','camerunez','camforat','camuflat','canalizabil','canalizat','canarisit',
'canceriform','cancerizat','cancerologic','canceros','candid','candriu','canelat','cangrenat','cangrenos','canibalic',
'caniculat','canonial','canonic','cantabil','cantitativ','cantonal','caolinos','capabil','capacitativ','capacitiv',
'capelat','cape?','capital','capitalist','capitalizabil','capitalizat','capitat','capitonat','capitos','capitulard',
'capiu','capot','capricios','capsat','capsulat','captabil','captat','captiv','captivant','captivat',
'caracterial','caracteristic','caracterizabil','caracterizant','caracterizat','caracterologic','caraghios','caragialesc','carbonic','carbonilic',
'carcinologic','cardanic','cardat','cardiac','cardinal','cardiografic','cardiotonic','cardiotoxic','carenal','carenat',
'carent','caren?ial','carfologic','cariat','caricatural','caricaturistic','carierist','caritabil','carminativ','carnal',
'carnat','carnavalesc','carosabil','carpatic','carpofag','carstic','cartaginez','cartelat','cartilaginos','cartist',
'cartografic','cartonat','casabil','casant','cascadoricesc','casnic','cast','castaniu','castrat','ca?ectic',
'ca?erat','cataclastic','cataleptic','catalitic','catamenial','cataral','catastrofal','catastrofic','categorematic','categorial',
'categoric','categorisit','cathartic','catifelat','catifeliu','catihetic','cationic','catodic','catolic','catolicizat',
'catonic','cauciucat','caudal','caulescent','caustic','causticizat','caustificat','cauzal','cauzalist','cauzativ',
'cav','cavaleresc','cavernicol','cavernos','cazual','cazuistic','c?l?resc','c?l?re?','c?l?torit','c?lâu',
'c?ldicel','c?lduros','c?ldu?','c?libil','c?lit','c?lug?resc','c?m??uit','c?m?t?resc','c?ngiuit','c?p?tuit',
'c?p??ânos','c?piat','c?pos','c?presc','c?priu','c?prui','c?puit','c?r?miziu','c?r?rat','c?rbunos',
'c?rnos','c?rp?nos','c?rtur?resc','c?runt','c?run?it','c?s?toresc','c?s?torit','c?scat','c?snicesc','c?t?nesc',
'c?tr?nit','c?utat','c?uz??esc','c?z?cesc','c?znit','c?zut','câinesc','câinos','câl?os','câmpenesc',
'câmpesc','cânepiu','cânt?rit','cârâit','cârc?lit','cârciog?resc','cârcota?','cârlion?at','cârmâziu','cârnu?',
'câ?','câ?tigat','ceadiriu','ceapist','ceapr?zuit','cebocefal','cecal','cefalalgic','cefalic','cefalometric',
'cefaloscopic','ceh','cehesc','cehoslovac','cel','cela','celebru','celest','celiac','celofanat',
'celomic','celt','celtic','celuit','celulozic','cementat','cementos','cenestezic','cenobitic','cenogenetic',
'centezimal','centigrad','central','centralist','centralizat','centrat','centrifug','centrifugal','centripet','centripetal',
'centrist','centum','centumviral','centuplu','centuriat','cenu?iu','cenzurabil','cenzurat','cepeleag','ceramic',
'cerat','cercat','cerc?nat','cercelat','cercetat','cercet??esc','cerchez','cerchezesc','cerebelos','cerebral',
'cerebroid','cerebrospinal','ceremonios','ceresc','cernit','cernut','ceros','cer?etoresc','cert','certat',
'cert?re?','ceruminos','cervical','cest','cet??enesc','cetonic','ce?os','ceva','cezaro-cr?iesc','chefliu',
'chefos','chel','chel?l?it','chelbos','chelicerat','chemat','chen?ruit','chenzinal','cheratinizat','cheratolitic',
'cherchelit','chiaburesc','chiasmatic','chibzuit','chihlimbariu','chimic','chimiosterilizat','chimioterapic','chinestezic','chinez',
'chinezesc','chinovial','chinuit','chiolh?nos','chiomp','chiorâ?','chipe?','chipos','chircit','chirilic',
'chirografic','chiromantic','chirurgical','chisnovat','chistic','chitc?it','chitinizat','chitinos','chitit','chituit',
'chiurluit','chivernisit','cianotic','cianozat','cibernetic','cibernetizat','cicatricial','cicatrizant','cicatrizat','ciclic',
'ciclist','cicloidal','ciclonal','ciclonic','ciclopic','ciclotimic','cicloturistic','cifotic','cifrat','cifric',
'ciliat','cilibiu','cilindric','cilindroid','cinchit','cincinal','cinegetic','cinematic','cinematografic','cinetic',
'cinic','cinstit','ciob?nesc','ciobit','ciocnit','ciocoiesc','ciocolatiu','ciolac','ciol?nos','cioturos',
'cipriot','circulant','comatos','combatant','combativ','combinabil','combinat','combinativ','comburant','combustibil',
'comemorabil','comemorativ','comensurabil','comerciabil','comercial','comestibil','comic','cominatoriu','cominutiv','comiserativ',
'comisoriu','comisural','comi?ial','comod','compact','compactibil','comparabil','comparat','comparativ','compartimental',
'compartimentat','compatibil','compensabil','compensat','compensativ','compensatoriu','competent','competitiv','competi?ional','complet',
'completat','complex','complexat','complexificat','complexual','complezent','compliant','complicat','component','componistic',
'comportamental','comportamentist','compostat','compozit','compozi?ional','comprehensibil','comprehensiv','compresibil','compresiv','comprimabil',
'comprimat','compromis','compromisoriu','compus','computerizat','comunal','comunicabil','comunicant','comunicativ','comunist',
'comutabil','comutativ','conabiu','cona?ional','concav','concentrat','concentric','conceptibil','conceptual','conceptualist',
'conceptualizat','concep?ional','concertant','concertistic','concesional','concesiv','concherant','conciclic','conciliant','concis',
'concludent','conclusiv','concoidal','concomitent','concordant','concordist','concrescent','concrescut','concret','concretizat',
'concupiscent','concurent','condamnabil','condensabil','condensat','condescendent','condimentat','condi?ional','condi?ionat','conductibil',
'conductiv','conduplicat','conectat','conectiv','conex','confec?ionat','confederat','confederativ','confesional','confesiv',
'confiat','confiden?ial','confient','configurat','configurativ','configura?ional','configura?ionist','confinat','confirmativ','confiscabil',
'conflagrant','conflictual','confluent','conform','conformat','confortabil','confortant','confr??esc','confucianist','confundabil',
'confuz','confuzionant','confuzionist','congelabil','congelant','congelat','congenital','congestionat','congestiv','congolez',
'congrega?ional','congruent','conic','conivent','conjectural','conjugabil','conjugal','conjugat','conjunctiv','conjunctival',
'conjunctural','conjuncturist','conjunc?ional','conoid','conoidal','conotativ','consacrant','consacrat','conscriptibil','consecutiv',
'consecvent','consemnabil','conservant','conservativ','considerabil','considerat','consimil','consistent','dodecafonist','dodecagonal',
'dodecasilab','dodecasilabic','doftoricesc','dogit','dogmatic','dogorit','doldora','dolihocefal','dolomitic','dolosiv',
'domenial','domestic','domesticit','dominant','domnesc','domol','donchihotesc','donjuanesc','doric','dornic',
'dorob?n?esc','dorsal','dorsoventral','dosit','dosnic','dospit','dotal','dotat','dozabil','draconic',
'drag','drajefiat','dramatic','drapat','drastic','dr?cesc','dr?cos','dr?g?la?','dr?g?stos','dr?gule?',
'dr?gulic','dr?guli??','dr?gu?','dreg?toresc','drept','dreptunghic','dres','dresat','druidic','dualist',
'dubios','dubit','dubitativ','dublat','dublu','ducal','duc?re?','ductil','dugli?','duhliu',
'duhovnicesc','duios','dulceag','dulcicol','dumesnic','duminical','dumnezeiesc','dungat','duodecimal','duodenal',
'dupuros','durabil','durativ','durd','durduliu','dureros','dus','du?m?nesc','du?m?nos','E',
'ebraic','ecarisat','ecarlat','echicurent','echidistant','echilateral','echilibrat','echilibrist','echinoc?ial','echipat',
'echipolent','echipoten?ial','echitabil','echivalent','echivoc','eclamptic','eclatant','eclectic','ecleziastic','ecliptic',
'ecografic','ecologic','ecometric','econom','econometric','economic','economicesc','economicos','ecosez','ecru',
'ectodermic','ectoparazit','ectopic','ecuatorial','ecumenic','ecvestru','eczematos','edafic','edenic','edentat',
'edictal','editorial','educabil','educat','educativ','educa?ional','edulcorant','edulcorat','efectiv','efectuat',
'efeminat','eferent','efervescent','eficient','efigial','eflorescent','efluent','efuziv','egal','egalabil',
'egalat','egalitarist','egocentric','egoist','egolatru','egotist','eidetic','elansat','elastic','eleat',
'eleatic','electiv','electoral','electric','electrificat','electrizabil','electrizant','electrizat','electroacustic','electrobiologic',
'electrocaloric','eruptiv','escamotabil','escatologic','eschimos','eseistic','esen?ial','esopic','esperantist','estetic',
'estetizant','estic','estimabil','estimativ','estimatoriu','estiv','estival','estompat','estradistic','estral',
'estropiat','e?antionat','etajat','etalonat','etan?','etapizat','etatizat','eterat','eteric','eternizat',
'eterodox','etic','etichetat','etilic','etimologic','etiologic','etirat','etnic','etnobotanic','etnocultural',
'etnofolcloric','etnografic','etnologic','etnopedagogic','etrusc','eudemonist','eufemistic','eufonic','euforic','euforizant',
'eufuistic','eugenezic','eugenic','euharistic','eupeptic','euribiont','euristic','euriterm','euritmic','europenesc',
'eutectic','evacuabil','evacuat','evadat','evaluabil','evaluat','evanescent','evanghelic','evaporabil','evazat',
'evaziv','evenimen?ial','eventual','evghenicos','evident','eviden?iat','evitabil','evlavios','evocabil','evocativ',
'evoluat','evolutiv','evolu?ionist','evreiesc','exacerbat','exact','exagerat','exaltat','exasperant','exasperat',
'excelent','excentric','excep?ional','excesiv','excipient','excitabil','excitant','excitat','exclamativ','exclus',
'exclusiv','exclusivist','execrabil','executabil','executant','executat','executiv','executoriu','exegetic','exhaustiv',
'exhibitoriu','exigent','exigibil','exilat','existent','existen?ial','existen?ialist','exoftalmic','exogam','exorbitant',
'exorcist','exortativ','exosferic','exoteric','exoterm','exotermic','exotic','expandat','expansibil','expansionist',
'expansiv','expatriat','expectorant','expeditiv','experimental','experimentat','expert','expertizat','expiabil','expletiv',
'explicabil','explicat','explicativ','explicit','exploatabil','exploatat','explorabil','explorat','explozibil','exploziv',
'exponen?ial','exportabil','expozant','expozitiv','expozi?ional','expres','expresionist','expresiv','exprimabil','exprimat',
'expropriat','expugnabil','exsanguu','exsudant','extatic','extaziat','extemporaneu','extensibil','extensiv','extenuant',
'extenuat','exteritorial','exterminant','festiv','festivist','festonat','fe?telit','fetal','fetesc','fetid',
'feti?ist','feti?izant','feudal','feudalizat','fezabil','fezandat','fiabil','fibrocartilaginos','fibrolemnos','fibromatos',
'fibros','fictiv','fideist','fidel','fiert','fiesc','figurat','figurativ','filamentos','filantropic',
'filarmonic','filat','filatelic','filde?iu','filetat','filial','filiform','filigranat','filipinez','filmic',
'filmologic','filogenetic','filologic','filotim','filozofic','filtrabil','filtrant','filtrat','final','finalist',
'finalizat','finic','finisat','finit','finlandez','finlandez?','fino-ugric','fioros','firav','firesc',
'firos','firoscos','fiscal','fisionabil','fistichiu','fistulos','fisurat','fitilist','fitobiologic','fitocenotic',
'fitocid','fitofag','fitofarmaceutic','fitogeografic','fitopatologic','fitotehnic','fitoterapic','fitotoxic','fix','fixabil',
'fixat','fixativ','fixist','fizic','fizicalist','fiziocratic','fiziognomonic','fiziologic','fizionomic','fiziopatologic',
'fizioterapic','flacid','flagrant','flamand','flamboaiant','flasc','flavescent','fl?mând','fl?mânzit','flecuit',
'flegmatic','flendurit','flenduros','fleo?','fle?c?it','fle?','flexibil','flexibilizat','flocos','floco?it',
'flogistic','floral','floribund','floricol','florid','floristic','floriu','flotabil','flotant','flu',
'fluctuant','fluent','fluid','fluidal','fluidic','fluidizat','fluorescent','fluorurat','flu?turatic','fluturatic',
'fluvial','fluviatil','fluviometric','focal','focometric','focos','foiletonistic','foios','folcloric','folcloristic',
'foliaceu','foliat','folk','folosit','fondant','fonematic','fonemic','fonetic','fonf','fonf?it',
'fonic','fonoabsorbant','fonografic','fonogramic','fonoizolant','fonologic','fonometric','forabil','forjabil','forjat',
'formal','formalist','format','gr?din?resc','gr?niceresc','gr?suliu','gr?su?','gr?un?os','great','greb?nos',
'grec','grecesc','greco-catolic','greco-oriental','grej','greoi','gresat','gre?it','gre?os','greu',
'greunatic','grevist','gri','grifat','grijnic','grijuliu','grimat','gripal','gripat','griv',
'grivei','grizat','grizonant','grizutos','groaznic','grob','grofesc','groggy','gropit','gros',
'grosu?','grotesc','grozav','grunduit','grunjos','grunzuros','grupat','guatemalez','gubav','gudronat',
'gulerat','gumat','gunoios','gunoit','guraliv','gure?','gurguiat','gurmand','gustativ','gustos',
'gu?at','gutos','gutural','guvernamental','guvernant','habitual','habotnic','habsburgic','hagiografic','hagiologic',
'haido?','haiducesc','haihui','hainit','haios','haiti?','halieutic','halofil','halofit?','haloid',
'halomorf','halucinant','halucinatoriu','hami?','hamitic','handbalistic','handicapat','hanseatic','haotic','harbuzesc',
'hardughit','harnic','ha?urat','havaiu','hazardat','hazliu','h?b?uc','h?mesit','h?mi?liu','h?r?zit',
'h?rnicel','h?rnicu?','h?rt?nit','h?r?uit','h?tm?nesc','hâd','hâit','hârâit','hârbare?','hârbuit',
'hârsit','hâtru','hebefrenic','heboid','hectic?','hectolitric','hectometric','hedonist','hedonistic','hegemonic',
'heliac','heliocentric','heliofil','heliofizioterapic','heliofob','heliografic','heliometric','heliotehnic','helioterapic','helioterm',
'heliotermic','heliotropic','helmintic','helofit','hematofag','hematologic','hematopoietic','hematuric','hemeralop','hemerologic',
'hemicriptofit','hemimetabol?','hemiplegic','hemofag','hemogenic','hemolitic','hemopatic','hemoptizic','hemoragic','hemoroidal',
'hemostatic','hemotrop','hepatic','hepatologic','heptaedric','heptagonal','heraldic','hercinic','hermafrodit','hermeneutic',
'herminat','herpetic','herul','heterociclic','heteroclit','heterodont','heterogam','heterometabol?','heteromorf','heteromorf',
'?aalenian','abductor','aborigen','abrudean','absorbitor','acadian','acaparator','accelerator','acheuleean','acicular',
'acoperitor','acotiledon','acreditar','acri?or','activator','acuzator','acvatubular','acvifer','acvilin','acvitanian',
'adamantin','ademenitor','adeveritor','adolescentin','adormitor','aduc?tor','aductor','adulator','adulmec?tor','adulter',
'adulterin','adun?tor','aerian','aerifer','alveolar','amar','amator','am?gitor','ambigen','ambulacrar',
'ameliorator','amenin??tor','american','amerindian','ame?itor','amfoter','amigdalian','amintitor','amplexiflor','amplificator',
'ancilar','andin','androgen','androgin','anemocor','anglican','anglo-saxon','anglofon','angloman','angular',
'anihilator','animalier','animator','aniversar','anodin','anofelogen','anovulator','antediluvian','antemeridian','biliar',
'bilunar','biman','bimilenar','bimolecular','bimotor','binar','binef?c?tor','binevoitor','binocular','biogen',
'biostimulator','bipolar','bireactor','birman','biruitor','bisecular','bistri?ean','bizantin','bizar','blagian',
'blajin','blasfemator','bleumarin','blondin','boac?n','bocitor','bolivian','boln?vior','bo?iman','boto??nean',
'bourean','bovin','bozafer','brahman','bra?ovean','brazilian','br?ilean','brâncu?ian','breton','briliantin',
'brun','bubuitor','bucium?tor','bucovinean','bucure?tean','bufon','bugetar','bugetivor','bulbar','bulbifer',
'bulevardier','bulgar','bun','buni?or','bursier','buzoian','byronian','cabalin','caciur','cadmifer',
'calcifer','caldeean','calibror','calin','calomniator','calorifer','calorigen','calvin','cambodgian','cambrian',
'canadian','canalicular','canalizator','canar','cancanier','cancerigen','canicular','canin','capilar','capitolin',
'caprin','capsular','capsulifer','capucin','caracterizator','caragialian','carbonier','carbonifer','carcinogen','cardiovascular',
'carnasier','carnian','carnivor','carolingian','carosier','carotidian','carpatin','carpian','cartezian','catalan',
'catifelin','caucazian','caudifer','cauzator','cavalin','cavicorn','cavitar','cazon','c?l?r??ean','c?l?tor',
'c?l?uzitor','c?ldi?or','c?linescian','c???r?tor','c?z?tor','câmpean','câmpinean','cânt?tor','cârâitor','cârn',
'cârp?citor','cârtitor','câ?tig?tor','ceacâr','cefalorahidian','cehovian','celuitor','celular','cenomanian','centralizator',
'cenzitar','cercet?tor','cerealier','cerebelar','cerifer','cervin','cetogen','cezarian','cheltuitor','chem?tor',
'chiabur','chiar','chilian','chilifer','chinuitor','chior','chirografar','christadelfian','cic?litor','ciclamen',
'ciliar','cincar','circular','circulator','combinator','comp?timitor','compensator','complementar','complinitor','compresor',
'compromi??tor','comun','comunitar','concentra?ionar','conciliator','concordatar','concretizator','concre?ionar','condimentar','conduc?tor',
'conductor','conector','congener','conidian','conlocuitor','consangvin','consângean','conservator','dogoritor','doinitor',
'dojenitor','doljean','dolofan','domiciliar','dominator','dominican','domnitor','dorian','doritor','dostoievskian',
'doveditor','dravidian','dreptunghiular','dulci?or','dumbr?vean','dun?rean','duplicitar','dur','du?man','ebenin',
'echigranular','echiscalar','echiunghiular','echiunitar','ecuadorian','edificator','edilitar','educator','efemer','egalitar',
'egalizator','egeean','egiptean','ejaculator','esofagian','eston','estonian','etern','eterogen','etiopian',
'euclidian','euribar','eurihalin','european','evocator','examinator','excedentar','excitator','excretor','executor',
'exemplar','exocrin','exogen','expeditor','expedi?ionar','expiator','expirator','explicator','exploatator','exportator',
'extensor','exterior','festivalier','fe?telitor','fetomatern','fibrilar','fiduciar','fierbincior','fin','financiar',
'fitogen','fitopatogen','fitosanitar','flagelator','flexionar','flor','florean','florentin','florifer','fluier?tor',
'flutur?tor','foc??nean','folicular','folositor','fonator','fondator','forestier','forfetar','forfotitor','gr?itor',
'gr?san','gr?sun','greco-r?s?ritean','greco-roman','gregar','gregorian','grijitor','grobian','groh?itor','groscior',
'grosier','grosolan','hain','halogen','halucinogen','hapsân','harghitean','ha?egan','havan','hârâitor',
'hârbar','hebdomadar','hegelian','heliomarin','hematogen','hemicristalin','hepatogen','heptemimer','herculean','herniar',
'hertzian','heterofon','heteromer');
  
 lista_substantive_e varr := varr('Abagerie','Abandonare','Abate','Abatere','Aba?ie','Abazie','Abdicare','Abduc?ie','Abera?ie','Abietacee',
'Abietinee','Abilitare','Abilitate','Abiologie','Abiotrofie','Abita?ie','Abjec?ie','Abjudecare','Abjurare','Ablactare',
'Ablacta?ie','Abla?iune','Ablefarie','Ablepsie','Ablu?iune','Abnegare','Abnega?ie','Abnormitate','Abolire','Aboli?iune',
'Abonare','Abordare','Abrahiocefalie','Abrazare','Abraziune','Abrevia?ie','Abreviere','Abrogare','Abroga?ie','Abrutizare',
'Abscizie','Absciziune','Absolutizare','Absolu?iune','Absolvire','Absorbire','Absorb?ie','Absten?iune','Abstractizare','Abstrac?ie',
'Abstragere','Absurditate','Ab?iguire','Ab?inere','Abulie','Aburire','Academie','Acalmie','Acantacee','Acaparare',
'Acaparatoare','Acarologie','Acatafazie','Acatagrafie','Acatalepsie','Accedere','Accelerare','Accelera?ie','Accentuare','Acceptare',
'Accep?ie','Accesibilitate','Accesiune','Accidentare','Acciden?e','Acefalie','Aceracee','Acetificare','Acetilare','Acetonemie',
'Acetonurie','Achiesare','Achilie','Achinezie','Achitare','Achizitoare','Achizi?ie','Achizi?ionare','Acianopsie','Acidificare',
'Acidimetrie','Aciditate','Acidulare','Acioaie','Aciuare','Aclamare','Aclama?ie','Aclimatare','Aclimatizare','Acnee',
'Acolie','Acomodare','Acompaniatoare','Acondroplazie','Acontare','Acoperire','Acoperitoare','Acordare','Acorie','Acostare',
'Acotiledonate','Acreditare','Acribie','Acribologie','Acrime','Acrimonie','Acrinie','Acrire','Acroba?ie','Acrocefalie',
'Acrofobie','Acromanie','Acromatopsie','Acromegalie','Acromicrie','Acromie','Acroparestezie','Acro?are','Actinide','Actinie',
'Actinobiologie','Actinografie','Actinometrie','Actinomicete','Actinoterapie','Activare','Activitate','Activizare','Actorie','Actualitate',
'Actualizare','Ac?ionare','Ac?iune','Acuitate','Acultura?ie','Acumetrie','Acumulare','Acuplare','Acurate?e','Acuzare',
'Acuzatoare','Acuza?ie','Acvaforte','Acvaplanare','Acvariofilie','Aerografie','Aerologie','Aerometrie','Aerosoloterapie','Aerosta?ie',
'Aerotaxa?ie','Aeroterapie','Aerotopografie','Afabilitate','Afabula?ie','Afacere','Afagie','Afazie','Afânare','Afectare',
'Afectivitate','Afec?iune','Aferenta?ie','Afilia?ie','Afiliere','Afinare','Afinitate','Afirmare','Afirma?ie','Afi?are',
'Afi?oare','Aflare','Aflic?iune','Afluire','Afonie','Afonizare','Afretare','Africanitate','Africanologie','Afrontare',
'Aftershave','Afumare','Afum?toare','Afum?torie','Afunzime','Afurcare','Afurisenie','Agalactie','Agaricacee','Agasare',
'Ag??are','Ag???toare','Agenezie','Agen?ie','Agerime','Aghesmuire','Agie','Agitare','Agitatoare','Agita?ie',
'Aglomerare','Aglomera?ie','Aglosie','Aglutinare','Agna?iune','Agnozie','Agonale','Agonie','Agonisire','Agorafobie',
'Agrafie','Antecalculare','Antecalcula?ie','Antecesoare','Antem?sur?toare','Anteridie','Anterioritate','Antevorbitoare','Antibioterapie','Anticalofilie',
'Antic?rie','Antichitate','Anticipare','Anticipatoare','Anticipa?ie','Antifonie','Antilogie','Antilope','Antimaterie','Antim?lurire',
'Antinomie','Antipatie','Antipoezie','Antipoluare','Antisepsie','Badijonare','Badinerie','Bagatelizare','Bagdadie','Baie',
'Balansare','Balastare','Balcanologie','Bale','Balie','Balizare','Balneologie','Balneoterapie','Balonare','Balotare',
'Banalitate','Banalizare','Bandajare','Bantustanizare','Barabuli?te','Barbarie','Barbotare','B?lo?ire','B?nie','B?nuire',
'B?r??ie','B?rb?rie','B?rb??ie','B?rbie','B?rbierie','B?rduire','B?snire','B??c?lie','B??icare','B?taie',
'B?t?lie','B?t?toare','B?teli?te','B?trâne?e','B?trânime','B?utoare','Bâjbâire','Bântuire','Bârcoace','Bârfire',
'Bârfitoare','Bâzâitoare','Bâzdâganie','Beatificare','Beatitudine','Bebe','Becerie','Bechie','Becisnicie','Begonie',
'Behehe','Beldie','Bele-arte','Belvedere','Blan?are','Blan?iruire','Blasfematoare','Blasfemie','Blazare','Bl?n?rie',
'Blânde?e','Blenoragie','Bleojdire','Blestem??ie','Blindare','Blinie','Blocare','Boare','Bobinare','Bobinatoare',
'Bobotaie','Bocire','Bocitoare','Bodog?nire','Bogasierie','Bog??ie','Boiangerie','Boicotare','Boierie','Boierime',
'Boi?te','Bolborosire','Boli?te','Bombardare','Bombare','Bomb?nire','Cebare','Cebocefalie','Cece','Cecidie',
'Cecitate','Cecografie','Cedare','Cefalalgie','Cefalee','Cefalografie','Cefalometrie','Cefaloscopie','Cefalotomie','Cefalotorace',
'Celebrare','Celebratoare','Celebra?ie','Celebritate','Celeritate','Celioscopie','Celiotomie','Celofanare','Celuitoare','Cementare',
'Cementa?ie','Cenestezie','Centralizare','Centraliza?ie','Centrare','Centrifugare','Centruire','Centurie','Cenzurare','Cepuire',
'Cerb?rie','Cerbice','Cerbicie','Cercare','Cerc?toare','Cercetare','Cercet??ie','Cercet?toare','Cercuire','Chiulangie',
'Chiuretare','Chivernisire','Cianhidrizare','Cianizare','Cianoficee','Cianopsie','Cianotipie','Cianurare','Cibernetizare','Cicadee',
'Cicatrice','Cicatrizare','Cic?lire','Cicerone','Ciclare','Ciclicitate','Ciclocefalie','Ciclopie','Ciclotimie','Cicoare',
'Cifrare','Cilindrare','Cilindree','Cilindricitate','Cilindrurie','Cimentare','Cimotie','Cincime','Cine-verite','Cineamatoare',
'Cineanima?ie','Cinefilie','Cinematografie','Cinematografiere','Cineradiografie','Cing?toare','Cinste','Cinstire','Ciob?nie','Comedie',
'Comemorare','Comemora?ie','Comenduire','Comensurabilitate','Comentare','Comentatoare','Comercializare','Comic?rie','Comicitate','Cominu?ie',
'Comisie','Comisoaie','Comite','Comitere','Comizera?ie','Comoditate','Como?tenitoare','Como?ie','Compacitate','Compactare',
'Compactibilitate','Compactitate','Compactizare','Companie','Comparare','Compara?ie','Compartimentare','Compasiune','Compatibilitate','Comp?timire',
'Compendiatoare','Compensare','Compensa?ie','Competitivitate','Competitoare','Competi?ie','Compilare','Compilatoare','Compila?ie','Compl?cere',
'Complementaritate','Completare','Completitudine','Completivitate','Complexificare','Complexitate','Complexiune','Complicare','Complica?ie','Complice',
'Complicitate','Complimentare','Complinire','Componente','Comportare','Compostare','Compoundare','Compozee','Compozite','Compozitoare',
'Compozi?ie','Comprehensibilitate','Comprehensiune','Compresibilitate','Compresiune','Comprimare','Compromitere','Compulsare','Compunere','Computerizare',
'Comunicabilitate','Comunicare','Comunicativitate','Comunica?ie','Comunitate','Comuniune','Comutare','Comutativitate','Comutatoare','Comuta?ie',
'Convolu?ie','Convorbire','Convulsie','Convulsioterapie','Cooperare','Cooperativizare','Cooperatoare','Coopera?ie','Cooptare','Coordonare',
'Coordonatoare','Copaie','Coparticipare','Coparticipa?ie','Copastie','Copertare','Copie','Copiere','Copil?rie','Cople?ire',
'Copolimerizare','Coporâie','Coposesiune','Copre?edinte','Coproduc?ie','Coprofagie','Coprofilie','Coprolalie','Coprologie','Coproprietate',
'Coproscopie','Coprostazie','Copula?ie','Corabie','Coraziune','Cor?biele','Cor?bierie','Corcire','Cordialitate','Corealitate',
'Corectare','Corectazie','Corectitudine','Corectoare','Corectopie','Corec?ie','Coree','Coregizoare','Coregrafie','Corelativitate',
'Corela?ie','Corepetitoare','Corepeti?ie','Corifee','Corijare','Damaschinare','Damblagie','Damblagire','Damnare','Damna?iune',
'Danie','Dansatoare','Dantelare','Dantel?rie','Dantologie','Danturare','Dare','Darie','Datare','Datorie',
'D?inuire','D?ltuire','D?ltuitoare','D?n?naie','D?nd?naie','D?ng?nire','D?n?uire','D?n?uitoare','D?r?cire','D?r?citoare',
'D?r?p?nare','D?râmare','D?râm?toare','D?rnicie','D?ruire','D?ruitoare','D?sc?lie','D?sc?lime','D?sc?lire','D?ulare',
'Dârzenie','Dârzie','Deambula?ie','Debarasare','Debarasoare','Debarcare','Debavurare','Debilitare','Debilitate','Debitare',
'Debitoare','Debleiere','Deblocare','Debordare','Debreiere','Deburare','Deburbare','Debusolare','Debu?are','Debye',
'Decafeinizare','Decalare','Decalcare','Decalcifiere','Decalcomanie','Decalibrare','Decalva?ie','Decantare','Decanta?ie','Decapare',
'Decapitare','Decapita?ie','Decapotare','Decapsulare','Decapsula?ie','Decarburare','Decarbura?ie','Decatare','Decavare','Dec?dere',
'Dec?lire','Decelare','Decelera?ie','Decembrie','Decep?ie','Decerebrare','Decernare','Decimare','Decima?ie','Decizie',
'Declamare','Declama?ie','Declan?are','Declarare','Declara?ie','Declasare','Declimatare','Declinare','Declina?ie','Declivitate',
'Declorizare','Decoc?ie','Decodare','Decodificare','Decofrare','Decolare','Decoletare','Decolmatare','Decolonizare','Decolorare',
'Decomandare','Decompensare','Decompensa?ie','Decompozi?ie','Decompresiune','Decomprimare','Deconectare','Decongelare','Decongela?ie','Deconsiliere',
'Deconsolidare','Deconspirare','Decontaminare','Decontare','Decontractare','Decopertare','Decorare','Decorativitate','Decoratoare','Decora?ie',
'Decoromanie','Decorticare','Decortica?ie','Decrepitare','Decrepitudine','Decretare','Decriptare','Decrispare','Decromare','Decro?are',
'Decupare','Decuplare','Decurie','Decusa?ie','Decuscutare','Dedenti?ie','Dedicare','Dedica?ie','Dedublare','Deducere',
'Deduc?ie','Defalcare','Defavorizare','Defazare','Def?imare','Defecare','Defeca?ie','Defectare','Defectologie','Defectoscopie',
'Defectuozitate','Defec?iune','Defeminizare','Deferire','Deferizare','Defertilizare','Defeti?izare','Defibrare','Dezinfestare','Dezinflamare',
'Dezinformare','Dezinhibare','Dezinhibi?ie','Dezinsectizare','Dezinsec?ie','Dezintegrare','Dezinteresare','Dezintoxicare','Dezintoxica?ie','Deziotacizare',
'Dezl?n?uire','Dezlânare','Dezlegare','Dezleg?toare','Dezlipire','Dezm??are','Dezmembrare','Dezmeticire','Dezmierdare','Dezmin?ire',
'Dezmiri?tire','Dezmor?ire','Dezmo?tenire','Dezna?ionalizare','Dezn?d?jduire','Dezn?dejde','Deznisipare','Deznodare','Dezobi?nuire','Dezodorizare',
'Dezolare','Dezongulare','Dezonoare','Dezordine','Dezorganizare','Dezorganizatoare','Dezorientare','Dezosare','Dezoxidare','Dezr?d?cinare',
'Dezr?sucire','Dezrobire','Dezumanizare','Dezumflare','Dezunire','Dezv?luire','Dezvelire','Dezvergare','Dezvinov??ire','Dezvinuire',
'Dezvirginare','Dezvoltare','Diaconie','Diacronie','Diafonie','Diafotie','Diafragmare','Diagnosticare','Dialectologie','Dialogare',
'Diamanticale','Diaree','Diatermie','Diatomee','Dib?cie','Dibuire','Dicasterie','Dichisire','Dictare','Dic?iune',
'Didahie','Diferen?iere','Dificultate','Diformitate','Difrac?ie','Difterie','Diftongare','Difuzare','Difuzibilitate','Difuziune',
'Droaie','Drogare','Drogherie','Drojdie','Dromofobie','Dromomanie','Dropie','Drume?ie','Drupacee','Dualitate',
'Dubire','Dublare','Duble','Duce','Ducere','Ductilitate','Duduie','Dughie','Duhoare','Duio?ie',
'Dulce','Dulceg?rie','Dulcinee','Dulgherie','Dulie','Dumerire','Dumnezeie','Dumnezeire','Dun?re','Duplicitate',
'Durabilitate','Durare','Durere','Durificare','Duritate','Duruire','Du?m?nie','Ebenisterie','Ebo?are','Ebrietate',
'Ebulioscopie','Ebuli?ie','Ecarisare','Ecarte','Eche','Echilibrare','Echipare','Echiparti?ie','Echitate','Echita?ie',
'Echivalare','Echivocitate','Eclampsie','Eclipsare','Ecloziune','Ecluzare','Ecoencefalografie','Ecografie','Ecolalie','Ecoloca?ie',
'Ecologie','Ecometrie','Ecomimie','Econometrie','Economicitate','Economie','Economisire','Ecopraxie','Ecoscopie','Ecospecie',
'Ecostabilitate','Ecranare','Ecranizare','Ectazie','Ectenie','Ectopie','Ecua?ie','Ecvisetacee','Edificare','Edilitate',
'Editare','Editoare','Edi?ie','Educabilitate','Educare','Educatoare','Educa?ie','Efebie','Efectuare','Efemerizare',
'Efemina?ie','Eficacitate','Efigie','Eforie','Efractoare','Efrac?ie','Efuziune','Egalare','Egalitate','Egalizare',
'Egiptologie','Egolatrie','Egrenare','Egumenie','Egutare','Ejaculare','Ejacula?ie','Ejec?ie','Elaborare','Elagare',
'Elansare','Elasticitate','Eleagnacee','Electivitate','Electoare','Electricitate','Electrificare','Electrizare','Electroanestezie','Electroaprindere',
'Electrobiologie','Electrocapilaritate','Electrocardiografie','Electrocardioscopie','Electrocauterizare','Electrochimie','Electrochirurgie','Electrocoagulare','Electrocomunica?ie','Electroconcentrare',
'Electroconductibilitate','Electrocorticografie','Electrocutare','Electroencefalografie','Electrofiziologie','Electrofizioterapie','Electrofotografie','Electroglotospectrografie','Electrografie','Electrogravimetrie',
'Electromecanoterapie','Electrometalurgie','Electrometrie','Electromiografie','Electronaviga?ie','Electronegativitate','Electronizare','Electronografie','Electronomicroscopie','Electropatologie',
'Electropozitivitate','Electroprelucrare','Electroscopie','Electrosecuritate','Electrostimulare','Electrostric?iune','Electroterapie','Electrotermie','Electrotipie','Electrotomie',
'Elec?iune','Elegie','Elementaritate','Eleuterie','Eleva?ie','Eliberare','Elice','Extraneitate','Extrapolare','Extrapola?ie',
'Extrateritorialitate','Extravazare','Extr?dare','Extremitate','Extrofie','Extrospec?ie','Extrudare','Extruziune','Exulcera?ie','Exultare',
'Exulta?ie','Ezitare','Factorizare','Facturare','Fac?iune','Facultate','Fagacee','Fagure','Faian?are','Faian?atoare',
'Falce','Falie','Faliere','Falsificare','Falsificatoare','Falsitate','Familiaritate','Familiarizare','Familie','Fandare',
'Fandosire','Fantazare','Fante','Fantezie','Faradizare','Fardare','Farfur?rie','Farfurie','Faringe','Faringoscopie',
'Farmacie','Farmacodinamie','Farmacologie','Farmacopee','Farmacoterapie','Farmazonie','Farniente','Farsoare','Fascie','Fascinare',
'Fascina?ie','Fascizare','Fasole','Fasolire','Fasonare','Fasonatoare','Fatalitate','Fatigabilitate','Fatuitate','Fa?etare',
'Faultare','Favoare','Favorizare','Fazanerie','F?c?luire','F?c?toare','F?clie','F?inare','F?litoare','F?lnicie',
'F?lo?ie','F?l?uire','F?l?uitoare','F?ptuire','F?ptuitoare','F?r?delege','F?râmare','F?râmele','F?râmi?are','F?tare',
'F?t?toare','F???rie','F???rnicie','F??uire','F??uitoare','F?ur?rie','F?urire','F?uri?te','F?uritoare','Fâlfâire',
'Fân?rie','Fârnâire','Fâsâire','Fâstâcire','Fâ?âire','Fâ?ie','Feble?e','Febricitate','Febrilitate','Februarie',
'Feciorenie','Feciorie','Fecundare','Fecunda?ie','Fecunditate','Federalizare','Federa?ie','Fiere','Figurare','Figura?ie',
'Fiin?are','Filantropie','Filare','Filatelie','Filatoare','File','Filetare','Filia?ie','Filigranare','Filigranologie',
'Filioque','Filmare','Filmografie','Filmologie','Filogenie','Filologie','Filonichie','Filotimie','Filozofare','Filozofie',
'Filtrare','Filtra?ie','Finalitate','Finalizare','Finan?are','Finan?atoare','Finan?e','Fine','Fine?e','Finisare',
'Finisoare','Fire','Fiscalitate','Fisibilitate','Fisionare','Fisiune','Fisurare','Fitobiologie','Fitochimie','Fitofarmacie',
'Fitofiziologie','Fitogeografie','Fitopatologie','Fitotehnie','Fitoterapie','Fi?e','Fixare','Fixitate','Fiziocra?ie','Fiziognomonie',
'Fiziologie','Fizionomie','Fiziopatologie','Fizioterapie','Flagelare','Flagela?ie','Flambare','Flancare','Flatare','Flaterie',
'Fl?c?ime','Fl?c?raie','Fl?c?rie','Fl?c?ruie','Fl?mânzare','Fl?mânzire','Flebologie','Flebotomie','Flec?rie','Flegmazie',
'Fle?c?raie','Flexibilitate','Flexibilizare','Flexiune','Floare','Floco?ire','Flor?rie','Floricultoare','Florinte','Flotabilitate',
'Flotare','Flota?ie','Fluctuare','Fluctua?ie','Fluidificare','Fluiditate','Fluidizare','Fluier?toare','Fluorizare','Fluorografie',
'Fluturare','Fluture','Galanterie','Galantonie','Galaxie','Galerie','Galinacee','Galofobie','Galomanie','Galopare',
'Galo?are','Galvanizare','Galvanocauterizare','Galvanoplastie','Galvanostegie','Galvanostereotipie','Galvanoterapie','Galvanotipie','Garantare','Garan?ie',
'Garare','Gardenie','Garnisire','Gastralgie','Gastrectomie','Gastroenterologie','Gastronomie','Gastroscopie','Gastrotomie','Gastrula?ie',
'Gazare','Gazet?rie','Gazificare','Gazonare','G?bjire','G?buire','G?in?rie','G?it?n?rie','G?l?gie','G?lbinare',
'G?m?lie','G?oace','G?sire','G?sitoare','G?tire','G?urice','G?urire','G?z?rie','G?zdoaie','G?zduire',
'Gâde','Gâdilare','Gâfâire','Gâgâire','Gâgâlice','Gâlcevire','Gâlcevitoare','Gâlgâire','Gândire','Gânditoare',
'Gânganie','Gâng?vie','Gâng?vire','Gângurire','Gâtuire','Geamba?ie','Geamie','Geamparale','Gelatinizare','Gela?ie',
'Gelificare','Geliva?ie','Gelivitate','Gelozie','Geluire','Gem?nare','Gemina?ie','Genealogie','Generalitate','Generalizare',
'Generare','Generatoare','Genera?ie','Genere','Generozitate','Genialitate','Gentile?e','Gen?ianacee','Genuflexiune','Genune',
'Globalitate','Globire','Glod?raie','Glod?rie','Glodire','Glorie','Glorificare','Glosare','Glosatoare','Glosolalie',
'Glucometrie','Gnoseologie','Gnozie','Godie','Godiere','Gofrare','Gogire','Gogleze','Gogom?nie','Gol?nie',
'Gol?nime','Gol?tate','Goliciune','Golire','Gondolare','Gonflare','Goniometrie','Gonire','Gonitoare','Gonoree',
'Goruni?te','Gospod?rie','Gospod?rire','Gradare','Grada?ie','Grafie','Grafitizare','Grafologie','Grafomanie','Gramaticalizare',
'Graminee','Grandiozitate','Grandoare','Grandomanie','Granitizare','Granulare','Granula?ie','Granulie','Granulometrie','Granulozitate',
'Graseiere','Gratie','Gratificare','Gratifica?ie','Gratinare','Gratitudine','Gratuitate','Gratulare','Gratula?ie','Gra?ie',
'Gra?iere','Gra?iozitate','Gravare','Grave','Gravidie','Graviditate','Gravimetrie','Gravitate','Gravita?ie','Gr?bire',
'Gr?din?rie','Gr?di?te','Gr?m?dire','Gr?m?juie','Gr?m?ticie','Gr?pare','Gr?sime','Gr?unte','Greare','Greblare',
'Grecizare','Grecomanie','Grefare','Greime','Gresare','Gresie','Greutate','Grevare','Grifare','Grijanie',
'Grimare','Gripare','Grizare','Grizumetrie','Grofoaie','Groh?ire','Grosime','Grosol?nie','Groz?venie','Groz?vie',
'Groz?vire','Gruie','Grunduire','Grupare','Gubernie','Gudronare','Guinee','Gui?are','Gulie','Gumare',
'Gunoire','Gunoi?te','Gurluire','Gustare','Gust?toare','Guta?ie','Gutuie','Guvernare','Half-time','Halocromie',
'Halogenare','Halterofilie','Halucina?ie','Hamsie','Handicapare','Haploidie','Haplologie','Harabagie','Harabaie','Harbuz?rie',
'Hardughie','Hardware','Harna?are','Harpie','Ha?e','Ha?urare','Hatie','Havare','Hazardare','H?cuire',
'H?in?rie','H?ire','H?l?laie','H?mur?rie','H?r?zire','H?rh?laie','H?rm?laie','Hâdo?enie','Hârâitoare','Hâr?âire',
'Hâr?ie','Hârtie','Hâzenie','Hebefrenie','Hebelogie','Hebetudine','Hectizie','Hegemonie','Helcologie','Helge',
'Heliocromie','Heliofobie','Heliografie','Heliolitografie','Helioplastie','Helioterapie','Heliotermie','Heliotipie','Heliozincografie','Helmintologie',
'Hematie','Hematimetrie','Hematodermie','Hematofagie','Hematofobie','Hematologie','Hematometrie','Hematoscopie','Hematospectroscopie','Hematospermie',
'Hematoterapie','Hematurie','Hemeralopie','Hemerologie','Hemialgie','Hemianestezie','Hemianopsie','Hemiatrofie','Hemicranie','Hemifonie',
'Hemimelie','Hemiopie','Hemiparestezie','Hemiplegie','Hemofilie','Hemogenie','Hemoglobinemie','Hemoglobinometrie','Hemoglobinopatie','Hemoglobinurie',
'Hidrochimie','Hidrocorie','Hidrocu?ie','Hidroenergie','Hidrofilie','Hidrofilizare','Hidrofinare','Hidrofobie','Hidroftalmie','Hidrofugare',
'Hidrogenare','Hidrogeologie','Hidrografie','Hidroizolare','Hidrologie','Hidromanie','Hidromecanizare','Hidrometalurgie','Hidrometeorologie','Hidrometrie',
'Hidronimie','Hidropatie','Hidropizie','Hidroplanare','Hidroree','Hidrosonicitate','Hidroterapie','Hidrotermoterapie','Hidrotimetrie','Hidrotipie',
'Higrologie','Higrometrie','Higroscopicitate','Higroscopie','Hiperaciditate','Hiperacuzie','Hiperalgezie','Hiperalgie','Hiperbolizare','Hiperboree',
'Hipercalcemie','Hipercaracterizare','Hiperchinezie','Hiperclorhidrie','Hipercorectitudine','Hiperemie','Hiperemotivitate','Hiperestezie','Hiperexcitabilitate','Hiperfoliculinie',
'Hiperfunc?ie','Hiperglicemie','Hipermenoree','Hipermetropie','Hipermnezie','Hiperosmie','Hiperplazie','Hiperprosexie','Hiperproteinemie','Hipersecre?ie',
'Hipersensibilitate','Hipersensibilizare','Hipersomnie','Hipersustenta?ie','Hipertensiune','Hipertermie','Hipertimie','Hipertiroidie','Hipertonie','Iert?ciune',
'Iesle','Ie?ire','Igienizare','Ignifugare','Igni?ie','Ignominie','Ignorare','Igrasie','Ihtiofagie','Ihtiografie',
'Ihtiologie','Ihtiopatologie','Ilaritate','Ilegalitate','Ilegalizare','Ilegitimitate','Ileostomie','Ilicitate','Ilizibilitate','Ilogicitate',
'Iluminare','Ilumina?ie','Ilustrare','Ilustratoare','Ilustra?ie','Iluviere','Iluzie','Iluzionare','Imaginare','Imagina?ie',
'Imagine','Imagologie','Imaterialitate','Imaterializare','Imaturitate','Imbecilitate','Imbecilizare','Imbibi?ie','Imbloca?ie','Imbrica?ie',
'Imediate?e','Imensitate','Imergere','Imersare','Imersiune','Imigrare','Imigra?ie','Imiscibilitate','Imisiune','Imitare',
'Imitatoare','Imita?ie','Imixtiune','Imobilitate','Imobilizare','Imoralitate','Imortalizare','Impacientare','Impactare','Impalpabilitate',
'Impaludare','Imparicopitate','Imparitate','Impar?ialitate','Impasibilitate','Impecabilitate','Impenetrabilitate','Imperceptibilitate','Imperfec?iune','Imperfora?ie',
'Infiltra?ie','Infinitate','Infirmare','Infirmerie','Infirmitate','Inflamabilitate','Inflamare','Inflama?ie','Infla?ie','Inflexibilitate',
'Inflexiune','Inflic?iune','Influen?are','Informare','Informatoare','Informa?ie','Infractoare','Infrac?ionalitate','Infrac?iune','Inframicrobiologie',
'Infuzare','Infuzie','Ingeniozitate','Ingenuitate','Ingerare','Ingestie','Inginerie','Ingratitudine','Ingresiune','Ingurgitare',
'Ingurgita?ie','Inhalare','Inhala?ie','Inhibare','Inhibi?ie','Inhuma?ie','Inicvitate','Inie','Inimici?ie','Inimo?ie',
'Ini?te','Ini?iatoare','Ini?iere','Injectare','Injec?ie','Injonc?iune','Injurie','Injuste?e','Injusti?ie','Inocuitate',
'Inoculare','Inocula?ie','Inofensivitate','Inoportunitate','Inopozabilitate','Inovare','Inovatoare','Inova?ie','Insalubritate','Insanitate',
'Insatisfac?ie','Insa?iabilitate','Insa?ietate','Inscrip?ie','Insculpare','Insecuritate','Insensibilitate','Inserare','Inser?ie','Insesizabilitate',
'Insinuare','Insinua?ie','Insipiditate','Insociabilitate','Insola?ie','Insolubilitate','Insolubilizare','Insolvabilitate','Insomnie','Insondabilitate',
'Insonoritate','Insonorizare','Inspectare','Inspectoare','Inspec?ie','Inspirare','Inspiratoare','Inspira?ie','Instabilitate','Instalare',
'Instalatoare','Instala?ie','Instantaneitate','Instaurare','Instauratoare','Instaura?ie','Instigare','Instigatoare','Instiga?ie','Instilare',
'Instila?ie','Instinctivitate','Instituire','Institutoare','Institu?ie','Institu?ionalizare','Instructoare','Instruc?ie','Instruc?iune','îngrijare',
'îngrijire','îngrijitoare','îngrijorare','îngropare','îngrop?ciune','îngro?are','îngrozire','îngurluire','îngustare','îngustime',
'înh?mare','înh??are','înhumare','înierbare','înjghebare','înjosire','înjugare','înjum?t??ire','înjunghiere','înjurare',
'înl?n?uire','înl?turare','înlemnire','înlesnire','înlocuire','înlocuitoare','înmagazinare','înmatriculare','înm?nunchere','înm?rmurire',
'înmânare','înmiire','înmiresmare','înml?diere','înmormântare','înmugurire','înmuiere','înmul?ire','înnavetare','înn?dire',
'înn?molire','înnebunire','înnegrire','înnegurare','înnemurire','înnisipare','înnobilare','înnodare','înnoire','înnoptare',
'înnorare','înnoroire','înotare','înot?toare','înr?d?cinare','înr?ire','înr?ut??ire','înrâurire','înregimentare','înregistrare',
'înrobire','înrobitoare','înrolare','înro?ire','înrudire','îns?ilare','îns?mân?are','îns?n?to?ire','îns?rcinare','însc?unare',
'înscenare','înscriere','însemnare','însemn?tate','înseninare','înserare','înseriere','însetare','înseto?are','însilozare',
'însingurare','însorire','înso?ire','înso?itoare','însp?imântare','înspicare','înspi?are','înspumare','înstr?inare','înstrunare',
'însufle?ire','însumare','însurare','însur?ciune','însur?toare','însu?ire','în?elare','în?el?ciune','în?el?torie','în?euare',
'în?f?care','în?irare','în?iruire','în?tiin?are','în?urubare','înt?râtare','înt?rire','întâietate','întâlnire','întâmpinare',
'întâmplare','întârziere','întemeiere','întemeietoare','întemni?are','înte?ire','întinare','întindere','întinerire','întinsoare',
'întip?rire','întoarcere','întocmire','întomnare','întortochere','întov?r??ire','întrajutorare','întrebare','întrebuin?are','întrecere',
'întredeschidere','întregime','întregire','întremare','întrep?trundere','întreprindere','întrepunte','întrerupere','întret?iere','între?inere',
'întrevedere','întrevorbire','întrez?rire','întristare','întroienire','întrolocare','întronare','Jenare','Jep?luire','Jerpelire',
'Jertfire','Jeruire','Jicnire','Jiganie','Jig?raie','Jig?rire','Jignire','Jigodie','Jil?vete','Jil?vire',
'Jimbare','Jimbire','Jimbl?rie','Jin?c?lire','Jinduire','Jintuire','Jir?vire','Jirebie','Jiri?te','Jit?rie',
'Jit?rire','Jitie','Jivrare','Jn?p?ire','Jonc?ionare','Jonc?iune','Jonglare','Jonglerie','Jordie','Josnicie',
'Joule','Jovialitate','Jubilare','Jubila?ie','Jucare','Juc?rie','Juc?toare','Jude','Judecare','Judec?toare',
'Judec?torie','Judecire','Judiciozitate','Jug?nire','Juglandacee','Jugulare','Juice','Juisare','Juisoare','Julire',
'Jum?tate','Jum?t??are','Jum?t??ire','Jumelare','Jumulire','June','June?e','Junghiere','Junie','Junime',
'Lactozurie','Laicizare','Laie','Lalopatie','Lamare','Lamaserie','Lamblie','Lambrisare','Lame','Lamelare',
'Lamentare','Lamenta?ie','Laminare','Laminatoare','Lamina?ie','Lamoste','Lampisterie','Lance','Lansare','Lantanide',
'Laparoscopie','Laparotomie','Lapidare','Lapidaritate','Lapte','Largare','Larghe?e','Larice','Laringe','Laringectomie',
'Laringologie','Laringopatie','Laringoscopie','Laringostroboscopie','Laringotomie','Lascivitate','La?itate','Lateritizare','Latinitate','Latinizare',
'Latinizatoare','Latitudine','La?e','Lauracee','Luxare','Luxa?ie','Luxurie','Macabe','Macerare','Macera?ie',
'Machetare','Machetatoare','Machiere','Macrame','Macrobie','Macrocefalie','Macroeconomie','Macrofilmare','Macrofotografie','Macromicete',
'Macropsie','Macroscopie','Macrosporange','Mafie','Magazie','Maghiarizare','Magie','Laude','Magnetizare','Magnetizatoare',
'Magnetiza?ie','Magnetometrie','Magnetostric?iune','Magnetoterapie','Magnezie','Magnitudine','Magnoliacee','Magnolie','M?mul?rie','M?n?stire',
'M?r?cine','M?re?ie','M?rg?rele','M?rginire','M?rie','M?rime','M?rinimie','M?rire','M?ritare','M?rmurire',
'M?r??luire','M?rturie','M?rturisanie','M?rturisire','M?runtaie','M?run?ime','M?run?ire','M?sc?riciune','M?sc?rie','M?sluire',
'M?sluitoare','M?sori?te','M?surare','M?sur?toare','M?tanie','M?tase','M?t?huie','M?t?s?rie','M?tuire','M?turare',
'M?tur?toare','M?z?riche','Mâglisire','Mâhniciune','Mâhnire','Mâlire','Mânare','Mâncare','Mânc?rime','Mânc?toare',
'Mânc?torie','Mândre?e','Mândrie','Mândrire','Mânecare','Mângâiere','Mânie','Mânjire','Mântuire','Mânuire',
'Mânuitoare','Na?iune','Naufragiere','Naupatie','Nautiloide','Navigabilitate','Navigabilizare','Navigare','Navigatoare','Naviga?ie',
'Navlosire','Nazalitate','Nazalizare','Nazificare','N?b?d?ire','N?boire','N?bu?ire','N?c?jire','N?cârc?lire','N?cl?ire',
'N?d?ire','N?d?jduire','N?dejde','N?dejduire','N?dulire','N?durire','N?du?ire','N?imire','N?jire','N?l?ire',
'N?lbire','N?l?are','N?lucire','N?mete','N?metenie','N?me?ire','N?mire','N?molire','N?moloterapie','N?p?dire',
'N?p?stuire','N?p?stuitoare','N?pârlire','N?pi?tire','N?pl?ire','N?prasnicire','N?pr?snicie','N?pr?snicire','N?pruie','N?pustire',
'N?r?vie','N?r?vire','N?r?zire','N?ruire','N?s?dire','N?s?duire','N?s?lie','N?sâlnicire','N?scare','N?sc?toare',
'N?scocire','N?scom?nire','N?silnicie','N?sipire','N?slire','N?sluire','N?st?vire','N?stimire','N?stru?nicie','N?sturare',
'N?stur?rie','N?suire','N??ie','N??ire','N??p?lire','N?t?r?ie','N?tângie','N?tângire','N???luire','N?ucie',
'N?ucire','N?v?dire','N?v?lire','N?v?litoare','N?v?lnicie','N?vârnire','N?vodire','N?vr?pire','N?z?rire','N?zbâtie',
'N?zdr?v?nie','N?zuire','Nepotrivire','Neprecizare','Nepricepere','Neprih?nire','Neproliferare','Ner?bdare','Nerecunosc?toare','Neregularitate',
'Nerozie','Neru?inare','Nerva?ie','Nervozitate','Nervura?ie','Nes?buire','Nescafe','Neseriozitate','Nesfâr?ire','Nesim?ire',
'Nesocotire','Nestabilitate','Nestatornicie','Nesuferire','Nesupunere','Ne?tire','Netemeinicie','Netezare','Netezime','Netezire',
'Netezitoare','Netrebnicie','Netrebnicire','Neunire','Neurastenie','Neurastenizare','Neurochirurgie','Neurologie','Neuropatologie','Neuropsihiatrie',
'Neuropsihologie','Neutralitate','Neutralizare','Neutrodinare','Nev?z?toare','Nevinov??ie','Nevoie','Nevolnicie','Nevralgie','Nevrectomie',
'Nevrednicie','Nevroglie','Nevropatie','Nevrotomie','Nichelare','Nicorete','Nicotinice','Nictaginacee','Nictalfobie','Nictalgie',
'Nictalopie','Nife','Nifoblepsie','Nimfomanie','Nimicie','Nimicire','Nimicnicie','Nimicnicire','Ninsoare','Nisip?rie',
'Nisipi?te','Oaie','Oaspete','Oaste','Ob?dare','Obâr?ie','Obâr?ire','Obezitate','Obicinuire','Obidare',
'Obidire','Obiectare','Obiectivare','Obiectivitate','Obiectivizare','Obiec?ie','Obiec?ionare','Obijduire','Obijduitoare','Obi?nuire',
'Obl?duire','Oblicare','Oblicire','Oblicitate','Obligare','Obligarisire','Obligativitate','Obliga?ie','Oblire','Obliterare',
'Oblitera?ie','Oblojire','Oblonire','Obnubilare','Obnubila?ie','Obosire','Obr??ire','Obr?zire','Obr?znicie','Obr?znicire',
'Obr?zuire','Obrântire','Obrezuire','Obricire','Obrintire','Obrocire','Obscenitate','Obscurare','Obscuritate','Obscurizare',
'Obsecra?ie','Obsecviozitate','Obsedare','Observare','Observatoare','Observa?ie','Obsesie','Obstaculare','Obstinare','Obstina?ie',
'Obstruare','Obstruc?ie','Obstruc?ionare','Paji?te','Paladizare','Palatalizare','Palavragire','Palee','Paleoantropologie','Paleoarheologie',
'Paleobiologie','Paleoclimatologie','Paleoecologie','Paleoetnologie','Paleofitologie','Paleogeografie','Paleografie','Paleontologie','Paleopatologie','Paleopedologie',
'Paleozoologie','Paletizare','Paliditate','Palie','Paliere','Palilalie','Palingenezie','Palinodie','Palinologie','Palisare',
'Palmacee','Paloare','Palotie','Palpabilitate','Palpare','Palpa?ie','Palpitare','Palpita?ie','Paludologie','Paludoterapie',
'Pamare','Panaghie','Panare','Panatenee','Pandajmetrie','Pandalie','Pandemie','Pandosire','Pandurime','Panevghenie',
'Panfobie','Panghire','Pavare','Pavatoare','Pavelare','Paveluire','Pavoazare','Pazie','P?bâire','P?c?lire',
'P?c?nire','P?c?to?enie','P?c?to?ie','P?c?to?ire','P?c?tuire','P?celuire','P?ciuire','P?cur?rie','P?cur?rire','P?curire',
'P?duche','P?ducheare','P?duchere','P?duchire','P?dur?rie','P?dure','P?durice','P?durire','P?duri?te','P?fugare',
'P?gân?tate','P?gânie','P?gânime','P?gânire','P?gubire','P?h?rnicie','P?h?rnicire','P?ienjenire','P?injenire','P?injinire',
'P?ire','P?jurire','P?l?duire','P?l?ire','P?l?laie','P?l?l?ire','P?l?rie','P?l?tuire','P?l?v?c?ire','P?l?vr?gire',
'P?lire','P?lm?luire','P?lm?zuire','P?lmire','P?lmuire','P?lonire','P?luire','P?mântenire','P?mântire','P?n?tare',
'P?nc?nire','P?ntruire','P?pare','P?p?die','P?p?lire','P?p?r?zire','P?purezare','P?purire','P?puri?te','P?pu?are',
'P?pu??rie','P?pu?ire','P?pu?oi?te','P?r?duire','P?r?genire','P?r?ginire','P?r?sire','P?rândare','Ramoli?ie','Randalinare',
'Randare','Randomizare','Ranfluare','Ranforsare','Rantie','Rantoalare','Ranunculacee','Ranversare','Rapacitate','Rapiditate',
'Raportare','Raportoare','Rapsodie','Rapsodiere','Rarefac?ie','Rarefiere','Rarificare','Rari?te','Raritate','Raseologie',
'Rasolire','Ra?chetare','Ra?chetatoare','Ratare','Rata?are','Ratatinare','Ratificare','Ratifica?ie','Ratinare','Ratite',
'Ratrapare','Ra?ie','Ra?iocinare','Ra?ionalitate','Ra?ionalizare','Ra?ionare','Ra?iune','Ravenare','Ravinare','Razachie',
'Razie','R?bdare','R?bl?gire','R?bl?rire','R?bojire','R?bufnire','R?buire','R?c?duire','R?c?lire','R?c?luire',
'R?c?nire','R?cire','R?cluire','R?cnire','R?coare','R?corire','R?coritoare','R?dicare','R?ducere','R?fuire',
'R?gace','R?g?duire','R?g?lie','R?gilare','R?gire','R?gu?ire','R?ire','R?m??ire','R?mânere','R?murire',
'R?nire','R?nt?lire','R?p?ire','R?p?luire','R?pciune','R?pire','R?pitoare','R?posare','R?p?tire','R?puitoare',
'R?punere','R?rire','Riscare','Risipire','Ritmare','Ritmicitate','Ritmoterapie','Ritologie','Ritualizare','Ri?uire',
'Rivalitate','Rivalizare','Rizare','Roadere','Robie','Robinsonare','Robire','Robotire','Robotizare','Robotologie',
'Robuste?e','Roc?rie','Rochie','Roco?ire','Rodare','Rodie','Rodire','Rodnicie','Rodnicire','Rogodele',
'Roire','Roi?te','Rolare','Romanitate','Romanizare','Romanticizare','Romantizare','Roman?are','Roman?iozitate','Românie',
'Românime','Românire','Românizare','Rondare','Ronjare','Röntgenterapie','Ron??ire','Ropotire','Rostire','Rostogolire',
'Rostuire','Ro?ie','Ro?ire','Sabie','Sablare','Sablatoare','Sabordare','Sabotare','Sabotoare','Sacadare',
'Sacovi?te','Sacralitate','Sacralizare','Sacrare','Sacrificare','Sacristie','Safe','Sagacitate','Saiggire','Saigire',
'Sake','Salahorie','Salahorire','Salariere','Salarizare','Salce','Salcie','Salicacee','Salificare','Salifica?ie',
'Salinitate','Salinizare','Salivare','Saliva?ie','Salpingectomie','Salpingografie','Salpingoscopie','Salubritate','Salubrizare','Salutare',
'Salut?rire','Salvare','Salve','Salvgardare','Salvie','Samavolnicie','Suspendare','Suspensie','Suspiciune','Suspinare',
'Sustenta?ie','Sustrac?iune','Sustragere','Sus?in?toare','Sus?inere','Susurare','Sutime','Suveranitate','Suzeranitate','Svilcolire',
'Svingare','Swingare','?ablonare','?ablonizare','?agrinare','?aidare','?aisprezecime','?ait?lire','?ale','?ambrare',
'?amizare','?amotare','?ampanie','?ampanizare','?anfrenare','?antajare','?apirografiere','?arjare','?arlatanie','?armare',
'?arpe','?arpie','?atrange','??guire','??lvirie','??nc?luire','??ng?rire','??n?uire','??ruire','?â?âire',
'?cârc?ire','?ceric?ire','?chiopare','?chiop?tare','?chiopenie','?colaritate','?colarizare','?col?rime','?col?rire','?colire',
'?cord?luire','?edere','?edin?omanie','?efie','?eft?lire','Talasemie','Talasocra?ie','Talasofobie','Talasografie','Talasoterapie',
'Talie','Talkie-walkie','Talonare','Taluzare','Tamburare','Tamburinare','Tamizare','Tamponare','Tanatofobie','Tanatologie',
'Tancare','Tandre?e','Tangare','Tangentare','Tangibilitate','Tanizare','Tapare','Tapetare','Tapiride','Tapisare',
'Tapiserie','Tapi?are','Tapi?erie','Tapotare','Tarapangele','Tarare','Tardivitate','Tarifare','Tarlalizare','Tarodare',
'Tarsalgie','Tarsectomie','Tarsioidee','Tescuire','Tesl?rie','Teslimarisire','Teslimatisire','Testare','Testatoare','Test?luire',
'Te?ire','Te?menire','Tetanie','Tetanizare','Tetrafonie','Tetralogie','Tetrapodie','Tetrarhie','Teurgie','Textile',
'Textologie','Texturare','Tezaurizare','Tic?ire','Tic?lo?enie','Tic?lo?ie','Tic?lo?ire','Tic?zuire','Tichie','Ticluire',
'Ticnire','Ticsire','Ticuire','Tiflografie','Tiflologie','Tiflomegalie','Tigaie','Tighelire','Tigoare','Tih?raie',
'Tih?rie','Tihnire','Tihuire','Tim?rire','Timbrare','Timbrologie','Timburire','Timiditate','Timie','Timonerie',
'Timorare','Timpanoplastie','Timpanotomie','Tinchire','Tincturare','Tindalizare','Tindeche','Tindechire','Tindere','Tinere?e',
'Tinerime','Uluire','Umanitate','Umanizare','Umblare','Umbl?toare','Umbrire','Umectare','Umezire','Umflare',
'Umidificare','Umiditate','Umilire','Umoare','Umplere','Unanimitate','Uncie','Undare','Undire','Undoire',
'Unduire','Undulare','Uneltire','Uneltitoare','Ung?toare','Ungere','Unghie','Unghiula?ie','Ungurime','Unicitate',
'Unidimensionalitate','Unidimensionare','Unificare','Uniformitate','Uniformizare','Unilateralitate','Unime','Unire','Unisexualitate','Unitate',
'Uniune','Universalitate','Universalizare','Universitate','Univocitate','Unsoare','Upercutare','Uperizare','Upov?ire','Urale',
'Uranografie','Uranometrie','Urare','Ur?toare','Urâciune','Urâ?enie','Urâ?ire','Urbanitate','Urbanizare','Urbe',
'Urcare','Urdinare','Urdoare','Urducare','Ureche','Urechere','Uree','Uremie','Ureterografie','Uretroscopie',
'Urgentare','Urgie','Urgisire','Uricemie','Urinare','Urlare','Url?toare','Urluire','Urluitoare','Urmare',
'Urm?rire','Urm?ritoare','Urnire','Urobacterie','Urografie','Urologie','Uroscopie','Urs?rime','Ursire','Ursitoare',
'Ursoaie','Ursuzenie','Urticacee','Urticare','Urticarie','Uruire','Urzicare','Urzire','Urzitoare','Uscare',
'Usc?ciune','Usc?toare','Usc?torie','Usc??ele','Ustilaginale','Usturare','Usturime','U?chire','U?uire','U?urare',
'U?ur?tate','U?urime','Utilare','Utilitate','Utilizare','Utopie','Utrenie','Uvografie','Uvologie','Uzare',
'Uzinare','Uzitare','Uzucapiune','Uzurpare','Uzurpatoare','Uzurpa?iune','Vaccinare','Vaccina?ie','Vaccinoterapie','Vacuitate',
'Velnicire','Velocitate','Velografie','Venalitate','Venectazie','Venepunc?ie','Venerare','Venera?ie','Venereologie','Venesec?ie',
'Veninare','Venire','Venozitate','Ventilare','Ventila?ie','Ventriculografie','Veracitate','Verbalizare','Verbozitate','Verde',
'Veresie','Vergelare','Veridicitate','Verificare','Verificatoare','Veritate','Vermina?ie','Vermutizare','Vernalizare','Vernisare',
'Verosimilitate','Verosimilitudine','Versatilitate','Versificare','Versificatoare','Versifica?ie','Versiune','Versuire','Verticalitate','Verticalizare',
'Verucozitate','Veselie','Veselire','Veste','Vesteg?luire','Vestejire','Vestimenta?ie','Vestire','Vestitoare','Ve?nicie',
'Ve?nicire','Ve?tejire','Ve?tezire','Vetrice','Vetustate','Vetuste?e','Vexare','Vexa?iune','Vezica?ie','Viabilitate',
'Vibrare','Xantinurie','Xantocromie','Xantodermie','Xantogenare','Xantomizare','Xantopsie','Xenie','Xenocra?ie','Xenofilie',
'Xenofobie','Xenomanie','Xenomorfie','Xenopatie','Xerocopie','Xerodermie','Xerofagie','Xeroftalmie','Xerografie','Xeroxare',
'Xilografie','Xilolatrie','Xilolitografie','Xilologie','Xilotipie','Zadie','Zaharicale','Zaharificare','Zaharimetrie','Zaharisire',
'Zapcierie','Zapciire','Zare','Zari?te','Zavergisire','Zavistie','Zavistiire','Zavistnicie','Zavistuire','Z?b?vire',
'Z?bovire','Zdrobire','Zdrobitoare','Zdronc?nire','Zdro?ire','Zdrumicare','Zdruncinare','Zdru?ire','Zdup?ire','Zdupuire',
'Zeberire','Zecime','Zeciuire','Zeflemisire','Zeghe','Zeie','Zeificare','Zeitate','Zelatoare','Zemo?ire',
'Zemuire','Zencuire','Zerire','Zestre','Ze??rie','Ze?uire','Zevzecie','Zg?urare','Zgâire','Zgâl?âire',
'Zgâl?ânare','Zgâm?ire','Zgâmboire','Zgâncilire','Zgând?rire','Zgârcenie','Zgârcire','Zgâriere','Zgâtie','Zgornire',
'Zgrep??nare','Zgribulire','Zgrun?urozitate','Zguduire','Zgurificare','Zic?toare','Zicere','Zid?rie','Zidire','Ziditoare',
'Ziduire','Zigzagare','Zimologie','Zim?are','Zim?uire','Zincare','Zincografie','Zincuire','Zing?nire','Zinghenire',
'Zizanie','Zm?cinare','Zmâng?lire','Zmeoaie');
  lista_substantive varr := varr('Aba','Abac','Abaca','Abac?','Abagiu','Abanos','Abataj','Abates?','Abatiz?','Abc',
'Abces','Aberoscop','Abiogeneza','Abiogenez?','Abioz?','Abis','Abiu','Ablativ','Ablaut','Ablegat',
'Aboli?ionism','Aboli?ionist','Aboli?ionist?','Abolla','Abonament','Abonat','Abonat?','Abordaj','Abortiv','Abracadabra',
'Abraziv','Abrudeanca','Abrupt','Abscis?','Absenteism','Absenteist','Absenteist?','Absen??','Absid?','Absidiol?',
'Absint','Absolut','Absolutism','Absolutist','Absolutoriu','Absolvent','Absolvent?','Absolven??','Absorbant','Absten?ionism',
'Absten?ionist','Absten?ionist?','Abstinent','Abstinent?','Abstinen??','Abstract','Abstrac?ionism','Abstrac?ionist','Abstrac?ionist?','Absurd',
'Ab?ibild','Abulic','Abulic?','Abunden??','Abureal?','Abuz','Ac','Acacia','Acadea','Academician?',
'Academism','Acaju','Acant?','Acantocefal','Acantoz?','Acaret','Acaricid','Acarinat?','Acarioz?','Acarni??',
'Acatalectic','Acatist','Aca?','Acaustobiolit','Ac?ri??','Accelerograf','Accelerometru','Accent','Accept','Acces',
'Accesoriu','Accident','Acciz','Acerateriu','Acer?','Acerola','Acetaldehid?','Acetamid?','Acetat','Acetazolamid?',
'Acetil','Acetilen?','Acetilur?','Acetobutirat','Acetofenon?','Aceton?','Achen?','Achingiu','Achiu','Acicul',
'Acid','Acidamin?','Acidimetru','Acidorezisten??','Acidoz?','Acil','Acioal?','Acipensericultur?','Acipenserid','Aciua?',
'Acolad?','Acolit','Acolit?','Acompaniament','Aconit','Aconitin?','Acont','Acoper?mânt','Acoperi?','Acord',
'Acordaj','Acordant','Acordant?','Acordeonist','Acordeonist?','Acordic?','Acostament','Acraniat','Acreal?','Acreditiv',
'Acresc?mânt','Acridin?','Acrilat','Acri?','Acritur?','Acrobat','Acrobat?','Acrobatic?','Acrocianoz?','Acrofobia',
'Acrolein?','Acrolit','Acromat','Acromatism','Acronim','Acropol?','Acrostih','Acrostol','Acro?aj','Acroter?',
'Acru','Act','Acta','Actant','ACTH','Actiniu','Actinograf','Actinometru','Actinomicoz?','Actinot',
'Activ','Activant','Activist','Activist?','Actora?','Actori??','Actri??','Actualism','Actuariat','Ac?ionar?',
'Acuarel?','Acuarelist','Acuarelist?','Aculeat?','Aculeol','Aculeu','Acumetru','Acuplaj','Acupresur?','Acupunctur?',
'Acupuncturist','Acustic?','Acustician?','Acustomat','Acuzat','Acuzat?','Acuzativ','Acuz?','Acvacultur?','Acvadag',
'Acvafortist','Acvariofil','Aerograf','Aerogram?','Aerolit','Aeromecanic?','Aerometru','Aeromobil','Aeromodel','Aeromodelism',
'Aeromodelist','Aeromodelist?','Aeronaut','Aeronaut?','Aeronautic?','Aeronav?','Aeroport','Aeroscop','Aerosol','Aerostat',
'Aerostatic?','Aerotehnic?','Aerotopograf','Aerotransport','Aerovehicul','Afacerism','Afacerist','Afacerist?','Afazic','Afazic?',
'Afect','Afeliu','Afemeiat','Aferez?','Afet','Afgan?','Afid?','Afinaj','Afinant','Afinat?',
'Afin?','Afinet','Afini?','Afipt','Afi?','Afi?aj','Afix','Afloriment','Afluent','Afluen??',
'Aflux','Afon?','Aforism','African?','Africanist','Africanist?','Africanistic?','Africanolog','Africanolog?','Africantrop',
'Africat','Afrikaans','Afrodiziac','Afront','Aft?','Afum','Afum?tur?','Afund','Afund?tur?','Afundi?',
'Afurc?','Afurisit','Afurisit?','Afuzali','Agap?','Agat','Agatâr?i','Agav?','Ag?','Ag?n?u',
'Ag?rlâc','Agend?','Agent','Agent?','Agentur?','Agest','Agestru','Agheasm?','Aghios','Aghiotant',
'Aghiu??','Agio','Agiotaj','Aglic?','Aglomerant','Aglomerat','Aglutinant','Aglutinin?','Agnat','Agnat?',
'Agne?','Agnostic','Agnostic?','Agnosticism','Agogic?','Agon?','Agoniseal?','Agonisit?','Agora','Agorafobia',
'Agraf?','Agramat','Agramat?','Anrocament','Ansamblu','Ans?','Anseriform','Anseriform?','Ansilaj','An?oa',
'Anta','Antablament','Antagonism','Antal','Antalgic','Antanaclaz?','Antanagog?','Antant?','Ant?','Antebra?',
'Antecalcul','Antecedent','Anteceden??','Antecliz?','Antedat?','Antedeviz','Antefix','Antegard?','Antenat','Anten?',
'Anteport','Anteproiect','Anter?','Anteriu','Anterozoid','Antesoclu','Antestep?','Antet','Antetitlu','Antetrupi??',
'Antiaerian?','Antialcoolism','Antialergic','Antianticorp','Antiart?','Antiartritic','Antiatom','Antibiogram?','Antibiotic','Antibioz?',
'Antibron?itic','Antic','Anticalofil','Anticalofil?','Anticamer?','Anticariat','Anticataliz?','Anticataral','Anticatod','Anticentru',
'Anticlericalism','Anticlinal','Anticoagulant','Anticolesterol','Anticolonialism','Anticomunism','Anticoncep?ional','Anticonformism','Anticonformist','Anticonformist?',
'Anticongelant','Anticonvulsiv','Anticorosiv','Anticriptogamic','Anticristianism','Anticritic?','Anticv?','Antidepresiv','Antidetonant','Antidetonan??',
'Antidiabetic','Antidiuretic','Antidogmatism','Antidot','Antidumping','Antienzim?','Antifascism','Antifascist','Antifascist?','Antifebrin?',
'Antiferment','Antifilistinism','Antiformant','Antifraz?','Antifurt','Antigel','Antihalo','Antihelmintic','Antihemoragic','Antihemoroidal',
'Antihistaminic','Antiholeric','Antihrez?','Antihrist','Antiimperialism','Antiintelectualism','Antiintelectualist','Antiintelectualist?','Antiistorism','Antijunimism',
'Antijunimist','Antijunimist?','Antiliteratur?','Antilocapr?','Antilogaritm','Antilop?','Antiluetic','Antimalaric','Antim?luric','Antimefitic',
'Antimemorii','Antimetabol?','Antimilitarism','Antimitotic','Antimoniat','Antimoniu','Antinefretic','Antineutrino','Antinevralgic','Antinicotinic',
'Antioxidant','Antipap?','Antipapism','Antiparticul?','Antiperistaltism','Antipies?','Antipiretic','Antipirin?','Antipod','Antipoem',
'Antipoluant','Antipruriginos','Antipsoriazis','Antiputrid','Antirabic','Antirealism','Antireclam?','Antiregalist','Antiregalist?','Antireumatismal',
'Antirezonan??','Antischeting','Antisclavagist','Antisclavagist?','Antiscorbutic','Antisemit','Antisemit?','Antisemitism','Antiseptic','Badijonaj',
'Baft?','Bagaj','Bagatel?','Bagea','Bageac?','Baghet?','Bahn?','Bahorni??','Bai','Baiader?',
'Baibarac','Baidera?','Baier?','Baionet?','Bairac','Bairam','Bait','Bai?','Bal','Balabust?',
'Balad?','Balalaic?','Balama','Balamuc','Balang?','Balans','Balansin?','Balan??','Balast','Balastier?',
'Bal?','Balcaniad?','Balcanism','Balcanist','Balcanist?','Balcanistic?','Balcanolog','Balcanolog?','Balcona?','Baleiaj',
'Balena','Balen?','Balenier?','Balerc?','Balercu??','Balerin?','Balet','Baletist','Baletist?','Balic',
'Balic?','Balig?','Balimez','Balist?','Balistic?','Balistician?','Balivern?','Balizaj','Baliz?','Balmo?',
'Balneolog','Balneolog?','Balona?','Balonet','Balonzaid','Balot','Balotaj','Balotat','Balsa','Balsam',
'Balsamin?','Baltag','Balt?','Balustrad?','Balustru','Balzacianism','Bam?','Bambino','Bambus','Banana',
'Split','Banan?','Banat','Banatit','Ban?','Banc','Banc?','Banchet','Banchet?','Banchiz?',
'Bancnot?','Banco','Bancrut?','Bandaj','Band?','Banderil?','Banderol?','Bandier?','Bandit','Banditism',
'Bandotec?','Bandul?','Bandulier?','Bandur?','Bandurist','Bandurist?','Bang','Sonic','Bang?t','Banier?',
'Bani??','Banjo','Bant?','Banteng','Bantu','Baobab','Baptism','Baptist','Baptist?','Baptisteriu',
'Baraboi','Barabul?','Barabu?c?','Baracament','Barac?','Baragladin?','Baraj','Barajist','Bar?','Barbacan?',
'Barbarism','Barb?','Barbet','Barbet?','Barbi??','Barbituric','Barbiturism','Barbotaj','Barbut','Barbut?',
'Barcagiu','Barcan?','Barcarol?','Barcaz','Barc?','Bard','Bard?','B?liu??','B?lm?jeal?','B?los',
'B?lo?el','B?ltac','B?lt?gel','B?lt?re?ul','B?lt?u','B?lti?','B?lti??','B?ltoac?','B?ltoi','B?l??tur?',
'B?lu?c?','B?nat','B?n?rit','B?n??ean?','B?n??eanc?','B?ncu??','B?nduric?','B?neasca','B?net','B?nic?',
'B?nicioar?','B?nuial?','B?nuit','B?nu?','B?nu?el','B?rat','B?rbat','B?rb?tu?','B?rb??el','B?rb??oi',
'B?rbân??','B?rbiereal?','B?rbierit','B?rbieri??','B?rbioar?','B?rbi?oar?','B?rbi??','B?rbiu??','B?rboas?','B?rboi',
'B?rbunc','B?rbu?oar?','B?rbu??','B?rcu??','B?rdac','B?rdac?','B?rda?','B?rd?cu??','B?rdi??','B?rzoi',
'B?sm?lu??','B??ic?','B??icoas?','B??icu??','B??tina?','B??tina??','B?t?ia?','B?t?i??','B?t?torit','B?t?torni??',
'B?t?tur?','B?t?u?','B?t?u??','B?teal?','B?trân?','B?trânet','B?trâni?','B?tut?','B??','B?ut',
'B?utur?','B?uturic?','Bâiguial?','Bâjbâial?','Bâjbâit','Bâjbâitur?','Bâlbâial?','Bâlci','Bântuial?','Bârf?',
'Bârfeal?','Bârfit','Bârfit?','Bârl?deanc?','Bârlog','Bârn?','Bârs?','Bât','Bât?','Bâtl?na?',
'Bâ?âial?','Bâ?âit','Bâz?','Bâzâial?','Bâzâit','Bâzâitur?','Bâzdâc','Bâzoi','Beat','Beatnic',
'Bebelu?','Bec','Beca??','Beca?in?','Bechera?','Bechiu','Beci','Becisnic','Becisnic?','Bedreag',
'Behaviorism','Beh?it','Beh?itur?','Bei','Beilerbei','Beilic','Beizadea','Bej','Beladon?','Belcanto',
'Belciug','Beldi??','Belea','Belemnit','Beletristic?','Belgi','Belgian?','Beligeran??','Belinograf','Belinogram?',
'Belit?','Belot?','Bel?i??','Bel?ug','Beluga','Belzebut','Bemberg','Bemol','Blan?','Blanc',
'Blanchet?','Blastogenez?','Blastul?','Blat','Blau','Blaz?','Bl?n?reas?','Bl?ni??','Blând?','Bleand?',
'Bleau','Blefarit?','Blend?','Bleotoc?real?','Blestem','Bleu','Blid','Blimp','Blindaj','Blindat',
'Bli?','Blizzard','Bloc','Bloc-start','Blocad?','Blocaj','Blochaus','Blocnotes','Blond','Blond?',
'Blues','Bluf','Blugi','Blum','Bluming','Bluz?','Bluzi??','Bluzuli??','Boa','Boab?',
'Boac?','Boait?','Boal?','Boamb?','Boarf?','Boar??','Boa??','Bob','Bobârnac','Bobinaj',
'Bobin?','Bobi??','Boboc','Bobocel','Bobornic','Bobot','Boboteaz?','Bobslei','Bobule?','Bocanc',
'Bocaport','Boc?neal?','Boc?nit','Boc?nitur?','Boccea','Bocceagiu','Boccealâc','Boccelu??','Boceal?','Bocet',
'Bocit','Bocn?','Boc??','Bodârl?u','Bodeg?','Bodicec','Bodog?neal?','Bodog?nit','Bodoni','Bodyguard',
'Boem','Boem?','Bogasiu','Bogat?','Bog?tan?','Bog?ta?','Bog?ta??','Boghiu','Boglari','Bogomil',
'Bogomilism','Bohriu','Boia','Boial?','Boiangiu','Boicot','Boiereas?','Boieresc','Boieri??','Boierna?',
'Boieroaic?','Boit','Bojdeuc?','Bojoc','Bol','Bolard','Bolboroseal?','Bolborosit','Bold','Boldei',
'Boldeic?','Boleazn?','Bolero','Bole?ni??','Bolf?','Bolid','Bolivian?','Bolnav','Bolnav?','Bolni??',
'Bolometru','Bolov?nel','Bolov?ni?','Bol?evic','Bol?evic?','Bol?evism','Bolta?','Bolt?','Bolti?oar?','Boltitur?',
'Bolti??','Bol?','Bombaj','Bombament','Bombardament','Bombard?','Bomb?','Bomb?neal?','Bomb?nit','Bombeu',
'Bombi??','Cebocefal','Cebocefal?','Cec','Cecmegea','Cecograf','Cedent','Cedru','Cefalin?','Cefalit?',
'Cefalocordat','Cefalograf','Cefalometru','Cefalopod','Cefeid?','Ceferist','Ceferist?','Ceg?','Ceh','Ceh?',
'Cehoslovac','Cehoslovac?','Celafibr?','Celaperm','Cel?rel','Celebrant','Celenterat','Celerimetru','Celest?','Celestin?',
'Celibat','Celibatar?','Cella','Cello','Celochit','Celofibr?','Celoidin?','Celolân?','Celom','Celomat',
'Celostat','Celt','Celta','Celt?','Cel?iu','Celuial?','Celul?','Celulit?','Celuloid','Celuloz?',
'Cembalo','Cement','Cementit?','Cenaclist','Cenaclist?','Cenaclu','Cenobism','Cenobit','Cenobiu','Cenogenez?',
'Cenotaf','Cenotip','Cenozoic','Cens','Cent','Centigrad','Centigram','Centil?','Centilitru','Centim?',
'Centimetru','Centraj','Central?','Centralism','Centralist','Centralist?','Centrifug?','Centriol','Centrism','Centrist',
'Centrist?','Centroplasm?','Centrosfer?','Centrosperm?','Centrozom','Centru','Centumvirat','Centur?','Cenuroz?','Cenu??',
'Cenu??reas?','Cenu??rit','Cenu?erni??','Cenu?iu','Cenzur?','Cep','Cep?it','Cepuit','Cepu?oar?','Cerambicid',
'Ceramic?','Ceramist','Ceramist?','Cerargirit','Ceratit','Cer?rit','Cerb','Cerboaic?','Cerc','Cerc?nel',
'Cerc?tur?','Cercel','Cerceloi','Cercelu?','Cerceta?','Cerceta??','Cercevea','Cerchez','Cerchez?','Cerci',
'Cercopitec','Cercopitecid','Cercosporioz?','Cercuial?','Cercuit','Cercule?','Cercurel','Cerdac','Cerd?cel','Chiulangiu',
'Chiup','Chiuretaj','Chiuret?','Chiuvet?','Chiv?r?','Chiverniseal?','Chivot','Chivu??','Chix','Chorus',
'Chulo','Ciabatta','Ciacon?','Cianamid?','Cianat','Cianhidrin?','Cianin?','Cianoz?','Cianur?','Cia?iu',
'Cibernetic?','Cibernetician?','Cicad?','Cicatrizant','Cic?leal?','Cicero','Cichirgiu','Cicisbeu','Ciclam?','Ciclism',
'Ciclist','Ciclist?','Cicloalchen?','Ciclocefal','Ciclocefal?','Ciclocros','Ciclodrom','Ciclomorfoz?','Ciclop','Cicloparafin?',
'Cicloram?','Ciclostom','Ciclotimic','Cicloturism','Cicloturist','Cicloturist?','Cicloz?','Ciclu','Cico','Ciconiid?',
'Ciconiiform?','Cidru','Ciflic','Cifoscolioz?','Cifotic','Cifotic?','Cifoz?','Cifraj','Cifr?','Cifru',
'Cig?','Cil','Ciliat','Cilindroid','Cilindrom','Cilindru','Cimaz?','Cim?','Cimbal','Cimbalist',
'Cimbalist?','Cimbistr?','Cimbri','Cimbru','Ciment','Cimentist','Cimentist?','Cimentometru','Cimerieni','Cimilitur?',
'Cimpanzeu','Cimpoi','Cimpoia?','Cinabru','Cin?','Cinc?rel','Cinci','Cincinal','Cineamatorism','Cineast',
'Cineast?','Cinecenaclu','Cineclub','Cineclubist','Cineclubist?','Cinefil','Cinefil?','Cinegetic?','Cinel','Cinema',
'Cinemascop','Cinematec?','Cinematic?','Cinematograf','Cineram?','Cineraria','Cinerit','Cinescop','Cinetic?','Cinism',
'Cinocefal','Cinovnic','Cinquecentist','Cinquecento','Cinste?','Cintez','Cintez?','Cintezoi','Cintru','Cinzeac?',
'Cioac?','Cioacl?','Cioanc?','Cioand?','Cioar?','Cioareci','Cioars?','Ciob','Ciobac?','Ciob?na?',
'Ciob?nel','Ciob?nit','Ciob?ni??','Comedioar?','Comediograf','Comensualism','Comentariu','Comeraj','Comercialism','Comerciant',
'Comerciant?','Comer?','Comesean?','Comet?','Comic','Comics','Comin?','Comis','Comisariat','Comisur?',
'Comi?el','Comitagiu','Comitat','Comitent','Comitent?','Comitet','Comi?ial','Comi?ial?','Comi?ii','Comoar?',
'Comodat','Comod?','Comornic','Compactometru','Companioan?','Comparatism','Comparatist','Comparatist?','Comparativism','Compars',
'Compartiment','Compartimentaj','Compas','Compatrioat?','Compatriot','Compendiu','Comperaj','Competen??','Complement','Complementarism',
'Complet','Completa?','Complex','Complezen??','Complian??','Compliment','Complot','Complota?','Complota??','Complotism',
'Complotist','Complotist?','Component','Component?','Componen??','Componist','Componist?','Comportament','Comportamentism','Comportamentist',
'Comportamentist?','Compost','Compot','Compotier?','Compound','Compozit?','Compres','Compres?','Comprimat','Compromis',
'Compus','Comput','Comunard','Comunard?','Comun?','Comuneros','Comuniant','Comuniant?','Comunicant','Comunicant?',
'Comunicat','Comunionism','Comunism','Comunist','Comunist?','Conabiu','Conac','Coocupant','Coocupant?','Cool',
'Cooperatism','Cooperativ?','Cooperativism','Cooperativist','Cooperativist?','Cooperit','Coordonat?','Cop','Copac','Copai',
'Copal','Cop?cel','Cop?i??','Cop?rta?','Cop?rta??','Copâr?eu','Copc?','Copeic?','Copepod','Coperi?',
'Coperniciu','Copert?','Copertin?','Copiat','Copil','Copilandr?','Copilandru','Copila?','Copil?','Copile?',
'Copilit','Copili??','Copilot','Copist','Copist?','Copitat','Copit?','Copoi','Copoia?','Copr?',
'Coprin?','Coprocultur?','Coprolit','Coproscleroz?','Coprostaz?','Coprosterol','Cops','Copt','Copt?','Copt?tur?',
'Coptur?','Copul?','Copyright','Coral','Coral?','Coraport','Corasl?','Cor?biasca','Cor?bioar?','Corb',
'Corbule?','Corci','Corcitur?','Corcodel','Corcodu?','Corcodu??','Cord','Cordaj','Cordat','Cordea',
'Cordelu??','Cordenci','Cordit?','Cordona?','Coreclamant','Coreclamant?','Corecliz?','Corectiv','Corectur?','Coreean?',
'Coreferat','Coreferent','Coreferent?','Coregent','Coregraf','Coregraf?','Coreligionar?','Coreometru','Corespondent','Corespondent?',
'Coresponden??','Core?','Coreu','Coreut','Corf?','Corfi??','Corhan?','Corhart','Corh?nit','Cori',
'Coriamb','Coriandru','Coribant','Corid?','Coridora?','Corifeu','Corigent','Corigent?','Corigen??','Corimb',
'Corinteu','Corintian?','Dam?','Dambla','Damblagiu','Damf','Damigean?','Dan?','Danci','Dancing',
'Dandana','Dandi','Dandism','Danez','Danez?','Danga','Dang?t','Dans','Dantel?','Dantelur?',
'Dantelu??','Dantolog','Dantolog?','Dantur?','Dara','Daraban?','Darac','Daraver?','Dard?','Darmstadtiu',
'Darwinism','Darwinist','Darwinist?','Dasc?l','Dat','Dat?','Datin?','Dativ','Datorin??','Datornic',
'Datornic?','Daun?','D?dac?','D?d?ceal?','D?lc?uc','D?lc?u?','D?lti??','D?ltuitur?','D?ltu??','D?nciuc',
'D?ng?nit','D?n?uit','D?rab','D?r?bu?','D?r?cit','D?r?citur?','D?r?p?n?tur?','D?râm?tur?','D?ruial?','D?ruin??',
'D?sc?la?','D?sc?leal?','D?sc?lici','D?sc?litur?','D?sc?li??','D?una?','D?una??','Dâlm?','Dâmb','Dâmbovi?eanc?',
'Dâmbule?','Dânsul','Dâr?','Dârdal?','Dârdâial?','Dârdâit','Dârdor?','Dârloag?','Dârlog','Dârlogel',
'Dârmoz','Dârst?','Dârval?','Deadweight','Deal','Deambulatoriu','Debaclu','Debandad?','Debara','Debit',
'Debitant','Debitant?','Debitez?','Debitmetru','Debleu','Debreiaj','Deburaj','Deburbaj','Debu?eu','Debut',
'Debutant','Debutant?','Decabrist','Decabrist?','Decacord','Decad?','Decadentism','Decaden??','Decadraj','Decaedru',
'Decagram','Decalaj','Decalc','Decalcifiant','Decalitru','Decalog','Decametru','Decanal?','Decanat','Decan?',
'Decapaj','Decapant','Decapod','Decasilab','Decastil','Decatlonist','Decatlonist?','Decembrist','Decembrist?','Decemvirat',
'Deceniu','Decen??','Decep?ionism','Deces','Decibel','Decibelmetru','Decigrad','Decigram','Decilitru','Decima',
'Decimal','Decim?','Decimetru','Deck','Declamativism','Declarant','Declarant?','Declasat','Declasat?','Declic',
'Declinograf','Declinometru','Declivometru','Decoct','Decodaj','Decofraj','Decolmataj','Decolorant','Decolteu','Deconectant',
'Decongestiv','Decont','Decopert?','Decorativism','Decovil','Decozin?','Decrement','Decrescendo','Decret','Decro?aj',
'Decubit','Decupaj','Decupat','Decurs','Decuvaj','Dedal','Dedesubt','Dedi??','Dedi?el','Dedoi',
'Defazaj','Defecant','Defect','Defectolog','Defectolog?','Defectoscop','Defensiv?','Deferen??','Defervescen??','Defetism',
'Defetist','Defetist?','Deficient','Dezinteres','Dezinvoltur?','Dezm??','Dezmiri?tit','Dezmor?eal?','Deznod?mânt','Dezodorizant',
'Dezoxidant','Dezumflat','Dezv??','Diabet','Diabetic','Diabetic?','Diac','Diachen?','Diaclaz?','Diaconic',
'Diadem?','Diadoh','Diafilm','Diafiz?','Diafor?','Diaforetic','Diaforez?','Diafragm?','Diagenez?','Diagnostic',
'Diagnostician?','Diagnoz?','Diagonal?','Diagram?','Dialect','Dialectalism','Dialectic?','Dialectician?','Dialectolog','Dialectolog?',
'Dialel?','Dialingvistic?','Dialipetal?','Dializ?','Dialog','Diamagnetism','Diamant','Diametru','Diapedez?','Diapozitiv',
'Diartroz?','Diascop','Diasistem','Diaspora','Diastaz?','Diastil','Diastol?','Diat?','Diatec?','Diatez?',
'Diatomit','Diatonic?','Diatrib?','Diavol','Diavoli??','Dibl?','Diblu','Dibol','Dibuial?','Dibuit',
'Dicaziu','Dichici','Dichis','Dichiseal?','Dichiu','Dicotiledonat?','Dicroism','Dictando','Dictat','Dictatur?',
'Dicteu','Dic?ion?ra?','Didactic?','Didacticism','Diecel','Diecez?','Dieci??','Diedru','Dielectric','Diencefal',
'Dierez?','Diet?','Dietetic?','Dietetician?','Diez','Diferend','Diferen??','Diferen?ial','Diferen?ial?','Difluen??',
'Difteric','Difteric?','Diftin?','Diftong','Droag?','Drob','Drobi??','Drog','Droghist','Droghist?',
'Drojdioar?','Drojdiu??','Drongo','Dropgol','Dropic?','Dropicoas?','Dropicos','Dropioi','Drops','Drosofil?',
'Dro?c?','Dro?cu??','Drot','Drug','Drug?','Drughinea??','Drugule?','Drum','Druma?','Drumeag',
'Drumea??','Drume?','Drumule?','Drup?','Dru?c?','Druz?','Dual','Dualism','Dualist','Dualist?',
'Dubas','Dub?','Dubeal?','Dubiu','Dublaj','Dubl?','Dublet','Dublur?','Dubniu','Ducat',
'Duc?','Duces?','Ducipal','Duco','Duct','Dud','Dud?','Dud?u','Duduc?','Duducu??',
'Duduit','Duduitur?','Dudui??','Duecento','Duel','Duelgiu','Duelist','Duet','Dughean?','Duglas',
'Dugli?','Dugli??','Dugong','Duh','Duhovnic','Duium','Dulam?','Dulap','Dul?pa?','Dul?u',
'Dulcea??','Dulgherit','Dulu??','Dum-dum','Dum?','Dumbe?','Dumbrav?','Dumbravnic','Dumbr?veanc?','Dumbr?vioar?',
'Dumicat','Duminecea','Duminic?','Dumitri??','Dumping','Dun?','Dunet?','Dung?','Dung??ea','Dunguli??',
'Dungu??','Duo','Duodenit?','Duotriod?','Dup?-amiaz?','Dup?-mas?','Dup?it','Dup?itur?','Duplex','Duplicat',
'Duracid','Duracryl','Duraluminiu','Durat','Durat?','Dur?','Dur?it','Dur?itur?','Durbac?','Durd?',
'Durduit','Durit','Duri??','Durligi','Duro','Duroflex','Duroscop','Duruit','Duruitur?','Durut',
'Dus','Du?','Du?c?','Du?egubin?','Du?man?','Du?manc?','Du?umea','Dutc?','Duumvirat','Duz?',
'Duzin?','Ebenist','Ebenist?','Ebenistic?','Ebonit?','Ebo??','Ebraic?','Ebraist','Ebraist?','Ebuliometru',
'Ebulioscop','Ecarisaj','Ecarlat','Ecartament','Echidistan??','Echidn?','Echilibrist','Echilibrist?','Echilibristic?','Echilibru',
'Echimoz?','Echin?','Echingiu','Echinid?','Echinism','Echinococ','Echinococoz?','Echinoc?iu','Echinoderm','Echipaj',
'Echipament','Echip?','Echipier?','Echipolen??','Echistic?','Echivalent','Echivalen??','Echivoc','Eclectism','Ecleraj',
'Ecleziarh','Ecleziast','Eclimetru','Eclips?','Ecliptic?','Eclis?','Ecluz?','Ecluzist','Ecluzist?','Ecofeedback',
'Ecogram?','Ecolog','Ecolog?','Ecolot','Ecometru','Econoam?','Econom','Economat','Economist','Economist?',
'Ecor?eu','Ecoscop','Ecosez?','Ecosistem','Ecosond?','Ecotip','Ecou','Ecpaia','Ecrazit?','Ecru',
'Ecruisaj','Ecstasy','Ectim?','Ectoderm','Ectoendoparazit?','Ectogenez?','Ectoparazit?','Ectoplasm?','Ecuadorian?','Ecuatorial',
'Ecvideu','Eczematoas?','Eczematos','Eczem?','Edam','Edec','Edecliu','Edelvais','Edem','Edentat',
'Edict','Edicul','Edificiu','Edil','Editorial','Editur?','Edulcorant','Efeb','Efect','Efectiv',
'Efedrin?','Efemer?','Efemerid?','Efendi','Efervescen??','Efet','Efetonin?','Eficien??','Eflorescen??','Efluviu',
'Eflux','Eforat','Efort','Efuziometru','Egalitarism','Egalitarist','Egalitarist?','Eghilet','Egid?','Egiptean?',
'Egipteanc?','Egiptolog','Egip?ian?','Eglog?','Egocentrism','Egoism','Egotism','Egrenat','Egret?','Egumen?',
'Eidetism','Einsteiniu','Elagaj','Elastic','Elastin?','Elastomecanic?','Elaterid','Eldorado','Eleat','Electorat',
'Electret','Electrician?','Electroacupunctur?','Electroacustic?','Electroanaliz?','Electrobuz','Electrocardiograf','Electrocardiogram?','Electrocardioscop','Electrocarist',
'Electrocaustic?','Electroc?ldur?','Electroceramic?','Electrochimograf','Electrochimogram?','Electrocinetic?','Electrocultur?','Electrod','Electrodiagnostic','Electrodiagnoz?',
'Electrodializ?','Electrodinam','Electrodinamic?','Electrodinamism','Electroencefalograf','Electroencefalogram?','Electrofiltru','Electroforegram?','Electroforez?','Electroglotograf',
'Electroglotogram?','Electrograf','Electrogravur?','Electroizolant','Electrolit','Electroliz?','Electroluminescen??','Electromagnet','Electromagnetism','Electromecanic?',
'Electrometru','Electromiograf','Electromiogram?','Electromobil','Electron-volt','Electronarcoz?','Electronic?','Electronist','Electronist?','Electronograf',
'Electronopunctur?','Electrooptic?','Electroosmoz?','Electropunctur?','Electroscop','Electrostatic?','Electro?oc','Electrotehnic?','Electrotonus','Electrotraumatism',
'Electrotropism','Electrovalen??','Electrum','Elefant','Elefantiazis','Elegan??','Element','Elen?','Elenism','Elenist',
'Elenist?','Elev','Elevatorist','Elev?','Elevez?','Elf','Elicoid','Extras','Extrasistol?','Extraterestr?',
'Extraterestru','Extravagan??','Extrem','Extremal?','Extrem?','Extremism','Extremist','Extremist?','Exuberan??','Ezerin?',
'Ezoterism','Factotum','Factur?','Facul?','Fading','Fado','Fag','Fagocit','Fagocitoz?','Fagot',
'Fagotist','Fagotist?','Faian??','Faim?','Fairplay','Falang?','Falangist','Falansterian?','Falansterianism','Fal?',
'Falbala','Falc?','Falconet','Falconiform','Fald','Falet','Falez?','Faliment','Falit','Falit?',
'Fals','Falset','Fal?','Familiarism','Familist','Familist?','Fanal','Fanaragiu','Fanariot','Fanariotism',
'Fanatic','Fanatic?','Fanatism','Fandango','Fandoseal?','Fandosit','Fandosit?','Fanerit','Fanerogam?','Fanfar?',
'Fanfaroan?','Fanfaronad?','Fantasm?','Fantast','Fantast?','Fant?','Fantom?','Fanto??','Fapt','Fapt?',
'Farad','Faradmetru','Farafastâc','Farandol?','Farb?','Fard','Fardat','Faretr?','Farfara','Farfasit',
'Farfasit?','Farfurioar?','Farfuriu??','Faringism','Faringit?','Faringolaringit?','Faringoscop','Fariseism','Fariseu','Farmacist',
'Farmacist?','Farmacolog','Farmacolog?','Farmacovigilen??','Farmazoan?','Farmec','Fars?','Fascicul','Fascicul?','Fascin?',
'Fascism','Fascist','Fascist?','Fasoleal?','Fasolic?','Fasonaj','Fasonat','Fasung','Fa??','Fata',
'Morgana','Fatalism','Fatalist','Fatalist?','Fat?','Fatum','Fa?ad?','Fa??','Fa?etat','Fa?et?',
'Fault','Faun?','Favorit','Favorit?','Favoritism','Favus','Faz?','Fazmetru','F?c?le?','F?c?luit',
'F?c?tur?','F?c?u','F?clioar?','F?cliu??','F?cut','F?ga?','F?g?d?u','F?g?duial?','F?g?duin??','F?g?r??eanc?',
'F?get','F?ge?el','F?in?','F?lcari??','F?lcea','F?l?uit','F?pta?','F?pta??','F?ptur?','F?ra?',
'F?râmat','F?râm?','F?râm?tur?','F?râmic?','F?râmi?at','F?râmi??','F?r?erot','F?t','F?tat','F?t?l?u',
'F?toi','F?tuc?','F?tu??','F??uial?','F??uit','F?z?ni??','Fâlfâit','Fâlfâitur?','Fâna?','Fânea??',
'Fânoas?','Fântân?','Fântânea','Fântânel','Fântânioar?','Fântâni??','Fârnâit','Fârtai','Fârtat','Fâs?',
'Fâsâial?','Fâsâit','Fâsâitur?','Fâstâceal?','Fâ?','Fâ?âial?','Fâ?âit','Fâ?âitur?','Fâ?ioar?','Fâ?nea??',
'Fâ??','Fâ?âial?','Fâ?âit','Fâ?i?oar?','Febr?','Febrifug','Fecalom','Fecioar?','Feciora?','Fecioreasc?',
'Fecioric?','Fecul?','Feculen??','Fecundat','Fedele?','Federalism','Federalist','Federalist?','Federat','Federvais',
'Fiertur?','Fierturic?','Fiest?','Figurant','Figurant?','Figur?','Figurin?','Fiic?','Fiin??','Filacter?',
'Filad?','Filaliu','Filament','Filantroap?','Filantrop','Filantropism','Filaria','Filarioz?','Filarmonic?','Filarmonist',
'Filarmonist?','Filat','Filatelist','Filatelist?','Filatur?','Fil?','Filde?','Filet','Fileu','Filial?',
'Filier?','Filigranist','Filigranolog','Filigranolog?','Filigranoscop','Filimic?','Filipic?','Filipinez','Filipinez?','Filistinism',
'Film','Filmfonograf','Filmotec?','Filodorm?','Filogenez?','Filogenist','Filogenist?','Filolog','Filolog?','Filomel?',
'Filotim','Filoxer?','Filozoaf?','Filozof','Filtraj','Filtrat','Filtru','Fil?','Final','Final?',
'Finalism','Finalist','Finalist?','Financiar?','Fin?','Finet','Finic','Finisaj','Fini?','Finit',
'Finitism','Finlandez','Finlandez?','Fiol?','Fiong','Fiord','Fioritur?','Firesc','Firet','Firfiric',
'Firicel','Firicic?','Firid?','Firimitur?','Firiz','Firmament','Firm?','Firmuli??','Firnis','Firoscoas?',
'Firoscos','Firu?','Fis?','Fisc','Fiscalism','Fistic','Fistul?','Fisur?','Fi??','Fi?c?',
'Fi?ic','Fi?iu','Fi?teic?','Fit','Fitil','Fitilist','Fitilist?','Fiting','Fitocenoz?','Fitocid',
'Fitofag','Fitogenez?','Fitoparazit','Fitopatolog','Fitopatolog?','Fitoterapeut','Fitoterapeut?','Fitotoxic','Fitotoxin?','Fi?uic?',
'Fiu','Fiule?','Fiu?','Fixaj','Fixativ','Fixism','Fixist','Fixist?','Fizic','Fizicalism',
'Fizicalist','Fizicalist?','Fizic?','Fizician?','Fiziocrat','Fiziocratism','Fiziolog','Fiziolog?','Fiziologist','Fiziologist?',
'Fizionomist','Fizionomist?','Fiziopatolog','Fiziopatolog?','Fizioterapeut','Flac?r?','Flacona?','Flagel','Flagelat','Flagran??',
'Flaimoc','Flajolet','Flamand','Flamand?','Flam?','Flambaj','Flamingo','Flamur?','Flanc','Flancgard?',
'Flanel?','Flanelu??','Flan??','Flash','Flashback','Fla?net?','Flaut','Flautist','Flautist?','Flavon?',
'Flax','Fl?c?iandru','Fl?c?ia?','Fl?c?u','Fl?c?u?','Fl?mânzic?','Fl?mânzil?','Fleac','Fleanc?','Fleandur?',
'Flea?c?','Flea??','Flebit?','Flec','Flecar?','Flec?real?','Flecule?','Flecu?te?','Flegmatism','Flegm?',
'Fleic?','Flenderi??','Fle??','Fle?c?ial?','Fle?c?it','Flexibil','Flexur?','Flic-flac','Flicten?','Flint',
'Flint?','Flintuli??','Flirt','Fli?','Flit','Floc','Floco?el','Floco?ic?','Flocul','Flogistic',
'Flogopit','Flor?','Flor?reas?','Floreal','Floret?','Floretist','Floretist?','Floricea','Floricultur?','Florii',
'Florilegiu','Florist','Florist?','Flori?oar?','Floroglucin?','Flotan?i','Flot?','Flotil?','Flox','Flu',
'Fluaj','Flud?','Fluen??','Fluid','Fluidifiant','Fluidizant','Fluiera?','Fluierat','Fluometru','Fluorescein?',
'Fluorescen??','Fluorimetru','Fluorin?','Fluoroscop','Fluoroz?','Fluorur?','Flu?turatic','Flu?turatic?','Flutura?','Fluturat',
'Fluturel','Fluviometru','Fluviu','Galaonul','Gal?','Galb','Galen?','Galenism','Galen?i','Galeopitec',
'Galer?','Galet','Galet?','Galiard','Galiard?','Galican?','Galicanism','Galic?','Galicism','Galiform?',
'Galimatias','Galiot?','Gali??','Gali?ian?','Galiu','Galofob','Galofob?','Galoman?','Galonat','Galop',
'Galopad?','Galoroman?','Galo?','Galvanism','Galvanometru','Galvanonarcoz?','Galvanoscop','Galvanotehnic?','Galvanotropism','Gama',
'Gamaglobulin?','Gam?','Gamb?','Gambet','Gambet?','Gambit','Gamel?','Gamet','Gametangiu','Gametofit',
'Gametogenez?','Gamogenez?','Gamopetal','Gamosepal?','Gana??','Gang','Gang?','Gangsterism','Ganoid','Garaj',
'Garajist','Garant','Garant?','Garan??','Garan?in?','Gar?','Gard','Gard?','Garderob','Garderobier?',
'Gardin?','Gardist','Garf','Gargar?','Gargariseal?','Gargarism','Gargui','Gargus?','Garmond','Garnet?',
'Garnierit','Garnisaj','Garnitur?','Garni??','Garnizoan?','Garoaf?','Garofi??','Garou','Garsonier?','Gasteropod',
'Gastrin?','Gastrit?','Gastroenterit?','Gastroenterolog','Gastroenterolog?','Gastronoam?','Gastronom','Gastroscop','Gastrul?','Ga??',
'Ga?c?','Ga?peri??','Gat','Gaterist','Gaucho','Gaur?','Gauss','Gavaj','Gavanos','Gavot?',
'Gay','Gaz','Gazd?','Gazel','Gazel?','Gazetar?','Gazet?','Gazet?ra?','Gazoduct','Gazolin?',
'Gazometru','Gazorni??','Gazoscop','G?g?u??','G?g?uz','G?g?uz?','G?ina?','G?in?','G?in?reas?','G?in?ri??',
'G?inu??','G?l?moz','G?l??ean?','G?l??eanc?','G?lbeaz?','G?lbejeal?','G?lbena?','G?lbenea','G?lbeneal?','G?lbenu?',
'G?lbenu??','G?lbini??','G?leat?','G?lu?c?','G?oaz?','G?r?fioar?','G?rdule?','G?rdurari??','G?rg?ri??','G?selni??',
'G?sit','G?teal?','G?tej','G?tit','G?uno?itur?','G?urea','G?urit','G?v?no?el','Gâdilat','Gâdil?tur?',
'Gâdilici','Gâfâial?','Gâfâit','Gâgâit','Gâgâitur?','Gâlc?','Gâlceav?','Gâlgâial?','Gâlgâit','Gâlgâitur?',
'Gâlm?','Gând','Gândac','Gând?cel','Gândirism','Gândirist','Gândirist?','Gângav','Gângav?','Gâng?veal?',
'Gângurit','Gânj','Gânsac','Gârbaci','Gârbi??','Gârl?','Gârlici','Gârli??','Gârne?','Gârni??',
'Gârni?et','Gâscari??','Gâsc?','Gâsc?ri??','Gâsculi??','Gât','Gâti??','Gâtlej','Gâtuitur?','Gâz?',
'Gâzuli??','Gâzu??','Geac','Gealat','Geal?','Geal?u','Geam','Geamal?','Geamandur?','Geamant?na?',
'Geam?t','Geamba?','Geamba?lâc','Geamblac','Geamgiu','Geamlâc','Gean?','Geant?','Gecko','Gel',
'Gelatin?','Gelato','Gelep','Gelivur?','Geloz?','Gem','Gem?','Gem?nari??','Gemul?','Gemule?',
'Gemut','Gen?','Genealogist','Genealogist?','General','Generalisim','Generalist','Generalist?','Generativism','Generativist',
'Generativist?','Generic','Genet?','Genetic?','Genetician?','Genetism','Genez?','Genist','Genitiv','Geniu',
'Genocid','Genol','Genom','Genotip','Gentilom','Gentuli??','Gentu??','Gen?ian?','Genulier?','Genunchi',
'Genunchier?','Geobotanic?','Gloab?','Gloat?','Glob','Globigerin?','Globin?','Globul?','Globulin?','Glockenspiel',
'Glod','Gloda?','Glodurari??','Glomerul?','Glon?','Glos?','Glosem','Glosematic?','Glosit?','Glota?',
'Glot?','Glucid?','Gluciniu','Glucocorticoid','Glucometru','Glucoz?','Glucozid?','Glug?','Glum?','Glumel?',
'Glutamin?','Glutein?','Gnais','Gnatostom','Gnom','Gnostic','Gnostic?','Gnosticism','Gnu','Goan?',
'Goang?','Goarn?','Godac','Godânac','Godet?','Godeu','Godevil','Godin?','Goeland','Goelet?',
'Gofraj','Gofrat','Gofreu','Gog','Gogoa??','Gogoloi','Gogonea','Gogori??','Gogo?ea','Gol',
'Golan?','Golanc?','Golaveraj','Gol?nea??','Gol?nel','Gol?ne?','Goldan?','Golf','Goliard','Golicic?',
'Golomoz','Gomaj','Gom?','Gomenol','Gomoas?','Gomos','Gonaci','Gonad?','Gonadotrop','Gona?',
'Gondol?','Gondolet?','Gondolier?','Gonflant','Gong','Gongorism','Gonidii','Goniometru','Goni??','Gonocit',
'Gonococ','Gonogenez?','Gopac','Gorgon?','Gorgonzola','Goril?','Gorjeanc?','Gornic','Gornist','Gorunet',
'Goruni?','Gospod?rioar?','Gospodin?','Gostat','Go?tin?','Got','Gotc?','Goz','Grab?','Grad',
'Gradat','Gradel','Gradient','Gradin?','Gradual','Graf','Grafem','Graffito','Grafic','Grafic?',
'Grafician?','Grafit','Grafolog','Grafolog?','Grafometru','Grafospasm','Graham','Grai','Grajd','Gram',
'Gramaj','Gramatic','Gramatic?','Gramatician?','Gramier?','Gramol?','Grandilocven??','Grandoman?','Granic','Granit',
'Grani??','Granivor?','Granodiorit','Granul?','Granulit','Granulocit','Granulocitoz?','Granulom','Grap?','Grapin?',
'Graptolit','Graset','Gravel?','Gravelit','Gravid?','Gravimetru','Gravur?','Gr?dea','Gr?din?','Gr?din?reas?',
'Gr?din?rit','Gr?dini??','Gr?dinu??','Gr?mad?','Gr?m?deal?','Gr?m?joar?','Gr?m?tic','Gr?pat','Gr?p?tur?','Grâu',
'Grâule?','Greac?','Grea??','Greblat','Grebl?','Grec','Grecism','Greco-catolic','Greco-oriental','Grecoaic?',
'Grecotei','Greement','Gref','Gref?','Gregarism','Greiera?','Greierel','Greieru?','Grej','Grena',
'Grenad?','Grenadin?','Grep','Grepfrut','Gresaj','Gre?','Gre?eal?','Greu','Grev?','Grevist',
'Grevist?','Gri','Griddipmetru','Grif?','Grij?','Grijit','Gril','Grilaj','Gril?','Grimas?',
'Grim?','Grimea','Grimelu??','Grimeur?','Grind','Grind?','Grindei','Grindel','Grindin?','Grindi?',
'Grinduli??','Grindu??','Grip?','Gripc?','Grisai','Gri?','Griv','Grizu','Grizumetru','Grizuscop',
'Grizutin?','Grizzly','Groap?','Groaz?','Grof','Grofi??','Grog','Grogren?','Groh?it','Groh?itur?',
'Grohot','Grohoti?','Grom','Gromovnic','Groom','Grop','Grop?reas?','Gropi?','Gropi??','Gropni??',
'Gropu?oar?','Gros','Grosisment','Gro?','Gro?i??','Grot?','Grotesc','Ground','Grozam?','Grui',
'Gruie?','Grumaz','Grund','Grunz','Grup','Grupaj','Grup?','Grupet','Grupule?','Gruzin?',
'Guaiac','Guanaco','Guanidin?','Guanin?','Guano','Guarana','Guarani','Guard','Gua??','Guatemalez',
'Guatemalez?','Gub?','Gudronaj','Guelf','Gugu?tiuc','Gui?at','Gui??tur?','Gula?','Gulera?','Gulerat',
'Gulerat?','Gulfstream','Gumaj','Gum?','Gumilastic','Gunoi','Gunoier?','Gunoit','Guraliv','Guraliv?',
'Gur?','Gurgui','Guri??','Gurluit','Gurmand','Gurmand?','Gurm?','Gurn?','Guru','Gurut',
'Guseu','Gust','Gust?ric?','Gu?at','Gu?at?','Gu??','Gu?uli??','Gutaperc?','Gut?','Gutoas?',
'Gutos','Gutui','Guturai','Guvernant?','Guvern?mânt','Guvid','Guz','Guzl?','Halen?','Half',
'Halieutic?','Halima','Halit','Halo','Halofit?','Halogenur?','Haloizit','Halometru','Halt?','Halter?',
'Halterofil','Halucinat','Halucinat?','Halucinoz?','Halva','Halvagiu','Ham','Hamac','Hamad?','Hamadriad?',
'Hamal','Hamalâc','Hamamelis','Hamei','Hami?i','Hamut','Hanap','Hanat','Hanâm?','Handbal',
'Handbalist','Handbalist?','Handicap','Handicapat','Handicapat?','Handral?u','Hang','Hangioaic?','Hangi??','Hangiu',
'Hanorac','Hans?','Hantel?','Hantru','Han??','Hanzel?','Haos','Hap','Hapc?','Haplea',
'Haplofaz?','Happening','Happy-end','Hara-para','Haraba','Harababur?','Harabagiu','Harachiri','Haraci','Haram',
'Haramba??','Haranc?','Harapnic','Harbuz','Harchin?','Hard','Hard','Rock','Harem','Hares',
'Haretism','Harghiteanc?','Harh?t','Harna?ament','Harp?','Harpist','Harpist?','Harpsicord','Har?a','Hart?',
'Har??','Har?i','Haruspiciu','Hasc?','Hasma?uchi','Haspel','Hassiu','Hasta?i','Ha?c?','Ha?i?',
'Ha?i?ism','Ha?m?','Ha?ur?','Hat','Hataia','Hati?erif','Ha?egana','Ha?egan?','Havaian?','Havaj',
'Havalea','Havan?','Havez?','Havr?','Havuz','Haz','Hazard','Hazna','Hazn?','H?buc',
'H?ci','H?d?rag','H?d?r?u','H?ini?oar?','H?inu??','H?it','H?ita?','H?ituial?','H?itu?c?','H?l?ciug?',
'H?m?ial?','H?m?it','H?m?itur?','H?meseal?','H?ulit','H?ulitur?','Hân??u','Hâr?','Hâr?u','Hârâial?',
'Hârâit','Hârâitur?','Hârb','Hârbu?','Hârc?','Hârcâial?','Hârcâit','Hârciog','Hârd?ia?','Hârd?u',
'Hârjoan?','Hârjoneal?','Hârle?','Hârlostea','Hâr?âit','Hâr?âitur?','Hârt?u','Hârtioar?','Hârtiu??','Hârtop',
'Hâr?oag?','Hârzob','Hâtr?','Hâtru','Hebefrenic','Hebefrenic?','Hecatomb?','Hecel?','Hecht','Hectograf',
'Hectogram','Hectolitru','Hectometru','Hectowatt','Hedonism','Hedonist','Hedonist?','Hegelian?','Hegelianism','Hegemonism',
'Hegir?','Heimatlos','Heiuri','Helanc?','Helcometru','Helcoz?','Hele?teu','Heliant','Heliantin?','Heliast',
'Heliocentral?','Heliocentrism','Heliofob','Heliofob?','Heliograf','Heliogravur?','Heliometru','Helioscop','Heliostat','Heliotactism',
'Heliotehnic?','Heliotehnician?','Heliotrop','Heliotropin?','Heliotropism','Helioz?','Helipot','Heliu','Heliu-3','Helmint',
'Helmintiaz?','Helmintosporioz?','Helofit?','Helve?i','Hem','Hemangiom','Hemartroz?','Hematemez?','Hematimetru','Hematin?',
'Hematit','Hematocel','Hematocheratoz?','Hematocrit','Hematocrom','Hematofag','Hematofag?','Hematoglobinometru','Hematolog','Hematolog?',
'Hematom','Hematopoiez?','Hematoporfirin?','Hematoscop','Hematoxilin?','Hematoz?','Hemeralop','Hemeralop?','Hemerolog','Hemerolog?',
'Hemerotec?','Hemiceluloz?','Hemiciclu','Hemicriptofit?','Hemielitr?','Hemimel','Hemimel?','Hemin?','Hemiparez?','Hemiplegic',
'Hemiplegic?','Hemocianin?','Hemocit','Hemocitometru','Hemocultur?','Hemodiagnostic','Hemodializ?','Hemodinamic?','Hemodinamometru','Hemogenic',
'Hemogenic?','Hemoglobin?','Hemoglobinometru','Hemogram?','Hemolimf?','Hidrocentral?','Hidrocentru','Hidrochimist','Hidrochimist?','Hidrochinon?',
'Hidrocinematic?','Hidrocor?','Hidrocosmetic?','Hidrocultur?','Hidrodinamic?','Hidrofil?','Hidrofit?','Hidrofob','Hidrofob?','Hidroftalmic',
'Hidroftalmic?','Hidrogel','Hidrogenoliz?','Hidrogeolog','Hidrogeolog?','Hidrograd','Hidrograf','Hidrograf?','Hidroizohips?','Hidrolaz?',
'Hidroliz?','Hidrolog','Hidrolog?','Hidromasaj','Hidromecanic?','Hidromel','Hidrometru','Hidromodul','Hidronefroz?','Hidronim',
'Hidroniu','Hidropedez?','Hidropic','Hidropic?','Hidropicoas?','Hidropicos','Hidropneumatic','Hidropneumotorax','Hidroponic?','Hidrosadenit?',
'Hidroscal?','Hidrosfer?','Hidrosol','Hidrostatic?','Hidrotehnic?','Hidrotehnician?','Hidroterapeut','Hidrotropism','Hidroxid','Hidroxil',
'Hidrur?','Hien?','Hienid?','Hieratism','Hierofant','Hieroglif?','Hif?','Higrofit?','Higrograf','Higrogram?',
'Higrom?','Higrometru','Higroscop','Higrostat','Hil','Hilea','Hilozoism','Hilozoist','Hilozoist?','Himer?',
'Hindi','Hindichi','Hinduism','Hinduist','Hinduist?','Hindus','Hindus?','Hindustan?','Hinterland','Hinteu',
'Hiol?','Hiperalgezic','Hiperalgezic?','Hiperbat?','Hiperbol?','Hiperboloid','Hiperboreu','Hipercheratoz?','Hiperfrecven??','Hiperhidroz?',
'Hiperinsulinism','Hipermetrop','Hipermetrop?','Hipermetropism','Hipermetru','Hipernim','Hiperostoz?','Hiperparatiroidism','Hiperparazit','Hiperparazit?',
'Hipersunet','Hipertensiv','Hipertensiv?','Hipertiroidian?','Hipertiroidism','Hipertricoz?','Iertat','Ierunc?','Ie?eanc?','Ie?ind',
'Ie?it','Ie?itur?','Iet?cel','Iez?tur?','Iezuit','Iezuitism','Ifos','Ifosard','Ifosard?','Igien?',
'Igienist','Igienist?','Igli??','Iglu','Ignam?','Ignat','Ignipunctur?','Ignorant','Ignorant?','Ignoran??',
'Ignoratio','Elenchi','Iguan?','Ihneumonid','Ihtiocol','Ihtiofaun?','Ihtiol','Ihtiolit','Ihtiolog','Ihtiolog?',
'Ihtiornis','Ihtioz?','Ihtiozic','Ihtiozic?','Ii?oar?','Ikebana','Il?u','Ilean?','Ilegalist','Ilegalist?',
'Ileit?','Ileocolit?','Ileus','Ilfoveanc?','Ilic','Ilicel','Ilir?','Ili?','Illium','Ilmenit',
'Ilogism','Ilot','Ilotism','Iluminat','Iluminism','Iluminist','Iluminist?','Ilustrat?','Ilustrativism','Iluzionism',
'Iluzionist','Iluzionist?','Im','Imagism','Imagist','Imagist?','Imagistic?','Imago','Imam','Imamat',
'Imambaialdî','Imamea','Imanentism','Imanentist','Imanentist?','Imanen??','Ima?','Imaterialism','Imaterialist','Imaterialist?',
'Imbecil','Imbecil?','Imbold','Imbroglio','Imigrant','Imigrant?','Iminei','Iminen??','Imobil','Imobilism',
'Imobilist','Imobilist?','Imoralism','Imoralist','Imoralist?','Imortel?','Impacien??','Impact','Impala','Impas',
'Impedan??','Impediment','Impeniten??','Imperativ','Imperial?','Imperialism','Infinit','Infinitism','Infinitiv','Infirm',
'Infirm?','Infirmier?','Infix','Inflorescen??','Influen??','Influx','Inforenergetic?','Informatic?','Informatician?','Inframicrob',
'Inframicrobiolog','Inframicrobiolog?','Infraro?u','Infrastructur?','Infrasunet','Infravirus','Infundibul','Ingambament','Ingenu?','Ingerin??',
'Inginera?','Inginer?','Ingrat','Ingrat?','Ingredient','Ingredien??','Inim?','Inimioar?','Inimoi','Inimuc?',
'Inimu??','Ininteligen??','Ini??','Ini?ial?','Ini?iat','Ini?iat?','Ini?iativ?','Inocen??','Inorog','Inox',
'Input','Ins','Insect?','Insecticid','Insectifug','Insectofungicid','Insert','Insign?','Insignifian??','Insisten??',
'Insolen??','Inspectorat','Instantaneu','Instan??','Instinct','Institut','Institu?ionalism','Instructaj','Instrument','Instrumentalism',
'Instrumentalist','Instrumentalist?','îngropat','îngurzitur?','înh?mat','înjugat','înjunghietur?','înjur?tur?','înmurgit','înn?ditur?',
'înnegreal?','înnod?tur?','înnoptat','înot','înotat','îns?ilat','îns?il?tur?','îns?mân?at','îns?rcinat','înscris',
'însemn?ric?','înserat','înso?it','înstr?inat','însurat','însur??el','înt?ritur?','întâlni?','întâlnitur?','întins',
'întinsur?','întors','întors?tur?','întorsur?','întortochetur?','întredeschiz?tur?','întregol','între?inut','între?inut?','Jen?',
'Jep','Jerb?','Jerseu','Jertf?','Jertfelnic','Jet','Jetel?','Jeteu','Je?','Jgheab',
'Jghebule?','Jiana','Jian?','Jianca','Jianc?','Jidanc?','Jid?ncu??','Jidov','Jigal?','Jig?real?',
'Jighiu??','Jigl?','Jigou','Jil?veal?','Jiletc?','Jilip','Jil?','Jimb?tur?','Jimbl?','Jimbl?reas?',
'Jinduial?','Jinti??','Jintuial?','Jintuit','Jip','Jirovin?','Jitni??','Jiu-jitsu','Jivin?','Jivraj',
'Jlip','Jnepeni?','Joac?','Joant?','Joard?','Job','Joc','Jocheu','Jocot','Jocule?',
'Jocu?','Jofr?','Jogging','Joi','Joiana','Joian?','Joim?ri??','Joj?','Jonc?','Jordi??',
'Josean?','Jot?','Jubart?','Jubileu','Jucat','Juc?rea','Juc?ric?','Juc?rioar?','Judecat?','Judec?tora?',
'Judec?toreas?','Jude?','Judo','Jugastru','Jug?na?','Jug?nel','Jug?rit','Jugendstil','Jujeu','Juke-box',
'Julep','Julf?','Julitur?','Jumar?','Jumel?','Jumping','Jumuleal?','Jumulit','Junc','Juncan?',
'Juncanc?','Junc?','Junc?na?','Junctur?','Juncu?','Juncu??','Junel','Junela?','Junghi','Junghietur?',
'Jungl?','Juni','Junimism','Junimist','Junimist?','Juninc?','Junioar?','Lactobioz?','Lactodensimetru','Lactoduc',
'Lactoferment','Lactofiltru','Lactoflavin?','Lactofruct','Lactogenez?','Lactometru','Lactoz?','Lacun?','Lad?','Ladin?',
'Lady','Laf','Lagun?','Laicism','Lainic','Lainic?','Laitmotiv','Lalea','Lama','Lamaism',
'Lamaist','Lamaist?','Lamarckism','Lamarckist','Lamarckist?','Lamartinist','Lam?','Lamb?','Lambda','Lambert',
'Lamblia','Lambliaz?','Lambriu','Lamel?','Lamelibranhiat?','Lamento','Laminaj','Laminaria','Laminat','Lamin?',
'Laminorist','Laminorist?','Lampagiu','Lampas','Lamp?','Lampist','Lamur?','Lanametru','Lancasterian?','Land',
'Land?','Landgraf','Landgrafiat','Landou','Landras','Land?aft','Landtag','Langust?','Lanital','Lanolin?',
'Lansaj','Lanset?','Lantanid?','Lantern?','Lanternou','Lan?','Lan?et?','Lan?ug','Lanugo','Lao?ian?',
'Lapalisad?','Laparoscop','Lapicid','Lapidariu','Lapiez','Lapili','Lapis','Lapislazuli','Lapon?','Lapovi??',
'Lapsus','Lap?i','Larariu','Lard','Larg','Larghetto','Largo','Lari','Lariform?','Laringit?',
'Laringolog','Laringolog?','Laringoscop','Laringospasm','Laringostroboscop','Larm?','Larv?','Larvicid','Laset?','Lasou',
'Lastex','Lastic','Lastr?','La?','La??','Lat','Laten??','Laterit','Latex','Laticlav?',
'Latifundiar?','Latifundiu','Latin?','Latinism','Latinist','Latinist?','Latrin?','Latur?','La?','Lau',
'Laudanum','Laud?','Lutein?','Luteran?','Luteranism','Lute?iu','Luth','Lutist','Lutist?','Lutr?',
'Lutru','Lux','Luxemburghez','Luxemburghez?','Luxmetru','Luxur?','Luxurian??','Mac','Maca','Macac',
'Macadam','Macagiu','Macairodus','Macam?','Macara','Macaragist','Macaragi??','Macaragiu','Macaroan?','Macaronad?',
'Macaronism','Macat','Macaz','Macedonean?','Macedoneanc?','Macedoromân?','Macedoromânc?','Mach','Machet?','Machetist',
'Machetist?','Machiaj','Machiavelism','Machiaverlâc','Machior?','Machism','Machist','Machist?','Machmetru','Macioal?',
'Macl?','Macrameu','Macrobiotic?','Macroblast','Macrocefal','Macrocefal?','Macrocit','Macroclim?','Macrocosm','Macrocosmos',
'Macroelement','Macroflor?','Macrogamet','Macromolecul?','Macronucleu','Macropod','Macroseism','Macrosistem','Macrostructur?','Macrou',
'Maculatur?','Madam?','Madea','Madlen?','Madmoazel?','Madon?','Madrier?','Madrigal','Madrilen?','Maestr?',
'Maestru','Mafiot','Mafiot?','Mag','Magazinaj','Magaziner?','Magazioar?','Magazioner?','Magenta','Magherni??',
'Maghiar?','Maghiarism','Magician?','Magism','Magistral?','Magistrat','Magistratur?','Magistru','Magmatism','Magm?',
'Magna','Cum','Magnaliu','Magnat','Magnet','Magnetism','Magnetit','Magnetit?','Magnetoflex','Magnetograf',
'Magnetogram?','Magnetohidrodinamic?','Magnetometru','Magnetooptic?','Magnetopauz?','Magnetoscop','Magnetosfer?','Magnetostatic?','Magnetotec?','Magnetotropism',
'Magnetou','Magnezit','Magnezit?','Magneziu','Magnico','Magnificen??','Magniflex','Magno','Magot','Mahala',
'Mahalagioaic?','Mahalagism','Mahalagi??','Mahalagiu','Maharajah','Maharani','Mahdism','M?m?lig?','M?m?ligoi','M?m?ligu??',
'M?m?ru??','M?mic?','M?mi??','M?mi?ic?','M?muc?','M?mucu??','M?mulic?','M?muli??','M?mu?oar?','M?mu??',
'M?n?stioar?','M?ng?l?u','M?nt?lu??','M?nunchi','M?nunchia?','M?nunchiule?','M?nu??','M?raz','M?r?cina?','M?r?cinet',
'M?r?cini?','M?r?mioar?','M?r?mu??','M?r?ra?','M?rfu?oar?','M?rg?rit','M?rg?rit?','M?rg?rit?ra?','M?rg?rit?rel','M?rgea',
'M?rgelu??','M?rgelu??','M?rghil?','M?rgina?','M?rgina??','M?rginu??','M?rgioar?','M?ri','M?rit','M?ritat',
'M?riti?','M?riu??','M?r?ân?','M?runta','M?run?elul','M?run?i?','M?run?it','M?run?u?','M?sai','M?s?ri??',
'M?scar?','M?sc?real?','M?sc?rici','M?sea','M?selari??','M?selu??','M?slag','M?slin?','M?sluial?','M?soi',
'M?surat','M?sur?','M?su??','M?t?cin?','M?t?sic?','M?t?uz','M?tc?l?u','M?tr?gun?','M?trea??','M?tri??',
'M?turat','M?tur?','M?tur?tur?','M?turea','M?turoi','M?tu??','M?tu?ic?','Mâgla?','Mâgl?','Mâgliseal?',
'Mâl','Mâlitur?','Mânaci','Mâna?','Mânat','Mân?','Mân??tergur?','Mân?tarc?','Mân?tur?','Mâncat',
'Mânc?cioas?','Mânc?cios','Mânc?ric?','Mânc?rici','Mânc?tur?','Mânc?u','Mând?lac','Mândr?','Mândri?oar?','Mândrulean?',
'Mândrulic?','Mândruli??','Mânecat','Mânec?','Mânecu??','Mânjeal?','Mânjitur?','Mântuial?','Mântuin??','Mântuitorul',
'Mântu?','Mânuri??','Mânu?i??','Naufragiu','Nauplius','Nautic?','Nautil','Nav?','Navet?','Navetist',
'Navetist?','Navigraf','Navlu','Navomodel','Navomodelism','Navomodelist','Navomodelist?','Nazal?','Nazism','Nazist',
'Nazist?','Nazuri','N?b?daic?','N?b?d?i','N?boi','N?buc','N?bu?eal?','N?cl?ial?','N?drag','N?dr?gel',
'N?duf','N?du?eal?','N?fram?','N?fr?mioar?','N?fr?mi??','N?fr?mu??','N?furic?','N?gar?','N?g?ru?','N?imeal?',
'N?imit','N?imit?','N?jit','N?luc?','N?luceal?','N?mol','N?past?','N?patc?','N?pârc?','N?pârstoac?',
'N?pârstoc','N?prasn?','N?prasnic','N?prasnic?','N?prui','N?rav','N?r?veal?','N?rtil?','N?ruitur?','N?sad?',
'N?s?dit','N?s?il?','N?s?udeanc?','N?scoceal?','N?scocitur?','N?scut','N?scut?','N?soi','N?strap?','N?stura?',
'N?sturel','N?suc','N?su?','N??ea','N??el','N??ic','N??ic?','N??icu??','N??it','N?t?flea??',
'N?t?fle?','N?t?r?u','N?t?roaic?','N?tâng','N?tâng?','N?uceal?','N?ut','N?val?','N?valnic','N?v?dit',
'N?vârlii','N?vod','N?vrap','N?z?real?','N?z?ritur?','N?zuin??','Nea','Nepoat?','Nepot','Nepotism',
'Nepo?ea','Nepo?el','Nepreget','Neprev?zut','Neprofesionist','Neprofesionist?','Neptunism','Neptuniu','Neputin??','Ner?suflat',
'Nerecuno?tin??','Neregul?','Nereid?','Nereu?it?','Neroad?','Nerod','Nerv','Nervatur?','Nervism','Nervist',
'Nervist?','Nervur?','Nes','Nesa?','Nes?buin??','Nes?r?tur?','Nesfâr?it','Nesiguran??','Nesim?it','Nesocotin??',
'Nesp?lat','Ne?ans?','Ne?tiin??','Netezi?','Netoat?','Netot','Ne?','Neum?','Neurastenic','Neurastenic?',
'Neurin?','Neurocit','Neurofibromatoz?','Neuroleptic','Neurolimf?','Neurolog','Neurolog?','Neurom','Neuroplegic','Neurotrop',
'Neutrino','Nev','Nevast?','Nev?stuic?','Nev?zut','Nevertebrat?','Nevestic?','Nevoin??','Nevolnic','Nevolnic?',
'Nevrax','Nevrica','Nevrit?','Nevrom','Nevropat','Nevropat?','Nevrotic','Nevrotic?','Nevroz?','Newtonian?',
'Nex','Nicaraguan?','Nichel','Nichelaj','Nichelin?','Nichipercea','Nicochera','Nicotin?','Nicotinism','Nicoval?',
'Nicrom','Nictalop','Nictalop?','Nigerian?','Nigrozin?','Nihilism','Nihilist','Nihilist?','Nilgau','Nimb',
'Nimbostratus','Nimbus','Nimereal?','Nimf?','Nimfoman?','Nimic','Nimitez','Ning?u','Niobiu','Niplu',
'Nipon?','Nipral?','Nirvana','Nisetru','Nisfia','Nisip','Nisipari??','Nisiparni??','Nisipi?','Nistagmus',
'Ni?angiu','Oal?','Oar?','Oarecic?','Oasp?t?','Oaz?','Obad?','Obcin?','Obedien??','Obel?',
'Obelisc','Oberec','Oberliht','Ober?al','Obial?','Obicei','Obid?','Obiect','Obiectiv','Obiectivism',
'Obielu??','Obi?nuin??','Obi?nuit','Oblanic','Oblânc','Oble?','Oblic?','Obliga','Oblig?','Obligean?',
'Oblojeal?','Oblomovism','Oblona?','Oboi','Oboist','Oboist?','Obol','Oborean?','Oboroc','Oboseal?',
'Obot','Obra?','Obraz','Obr?jel','Obr?znic?tur?','Obrinteal?','Obrintitur?','Obscurantism','Obscurantist?','Obsedat',
'Obsedat?','Obsig?','Obsolescen??','Obstacol','Obstetric?','Obstetrician?','Obstruc?ionism','Obstruc?ionist','Pajur?','Pakistanez',
'Pakistanez?','Pal','Paladiu','Palafit?','Palanc?','Pala?c?','Palat','Palatal?','Palatinat','Palatit?',
'Palatogram?','Palavragioaic?','Palavragiu','Palavr?','Pal?','Palc?','Paleantrop','Paleoantropolog','Paleoantropolog?','Paleoastronaut',
'Paleoastronautic?','Paleobotanic?','Paleobotanist','Paleobotanist?','Paleoclim?','Paleoetnolog','Paleoetnolog?','Paleogeofizic?','Paleograf','Paleograf?',
'Paleolitic','Paleontolog','Paleontolog?','Paleoslav?','Paleosol','Paleoteriu','Paleozoic','Paleozoolog','Paleozoolog?','Palestinian?',
'Palestr?','Palet?','Pali','Paliag','Paliativ','Palici','Palimpsest','Palinc?','Palindrom','Palingenez?',
'Palisad?','Palisaj','Palisandru','Palium','Palm','Palmac','Palmares','Palmatur?','Palm?','Palmet?',
'Palmier?','Palmiped','Palmitat','Palmitin?','Palograf','Palogram?','Palo?','Palp?','Palpit','Palplan??',
'Paltona?','Palud?','Paludic','Paludism','Paludolog','Paludolog?','Paludrin?','Palux','Pambriu','Pamflet',
'Pamfletist','Pamfletist?','Pampas','Panacagiu','Panaceu','Panachid?','Panacod','Panafricanism','Panahid?','Panama',
'Panamericanism','Panamericanist','Panamericanist?','Panamez','Panamez?','Panari?iu','Pana?','Pan?','Pancalism','Pancart?',
'Pancov?','Pancra?iu','Pancreas','Pancreatin?','Pancreatit?','Panda','Pandant','Pandantiv','Pandeism','Pandela?',
'Pandemoniu','Pandit','Pandor?','Panegiric','Panegirist','Panel','Panelenism','Panelenist','Panelenist?','Panera?',
'Pangea','Pangenez?','Pangermanic','Pangermanic?','Pangermanism','Pavat','Pav?z?','Pavea','Pavecerni??','Paviment',
'Pavlichian?','Pavlichianc?','Pavlovism','Pavlovist','Pavlovist?','Pavoaz','Pazarlâc','Pazarnic','Paz?','Paznic',
'Pazvangiu','Pazvant','Pazvantlâu','Pazvantoglu','P?cal?','P?cat','P?c?leal?','P?c?lici','P?c?lit','P?c?litur?',
'P?c?neal?','P?c?nit','P?c?nitur?','P?corni??','P?cuin?','P?cur?','P?cur?ra?','P?cur?rel','P?cur?rit','P?cur?ri??',
'P?ducel','P?ducherni??','P?dur?rit','P?durean?','P?dureanc?','P?duri??','P?ft?lu??','P?gân?','P?gânism','P?guba?',
'P?guba??','P?h?ra?','P?h?rel','P?h?rniceas?','P?h?rnicel','P?h?ru?','P?h?ru?','P?ienjeni?','P?injeni??','P?ioar?',
'P?ioas?','P?i?','P?iu?','P?iu?c?','P?iu?','P?l?mid?','P?l?rioar?','P?l?riu??','P?l?vatic','P?l?vr?geal?',
'P?l?vr?git','P?lincu??','P?litur?','P?lma?','P?lmi??','P?lmu??','P?lo?el','P?ltina?','P?ltinel','P?ltini?',
'P?m?tuf','P?mânt','P?mânteanc?','P?mântiu','P?mân?el','P?mânzalc?','P?nur?','P?nu??','P?nu?i??','P?p?l?u',
'P?p?lud?','P?p?rad?','P?pic?','P?puric?','P?puri?','P?pu??','P?pu?easca','P?pu?ic?','P?pu?oi','P?rangin?',
'P?ra?','P?r?gineal?','P?r?let','P?r?lu??','P?r?situr?','Ramolit?','Ramp?','Ramur?','Ran?','Ranch',
'Ranchiun?','Randalin?','Randament','Rand?','Ranforsaj','Ranfort','Rang','Rang?','Rani??','Rapakiwi',
'Rapanghel','Rapel','Rapid','Rapier?','Rapi??','Raport','Rapsod','Rapt','Raptus','Rar?',
'Rari??','Ras','Ras?','Rascolnic','Rascolnic?','Rasism','Rasist','Rasist?','Rasol','Rasoleal?',
'Rast','Rastel','Rastru','Ra?c?','Ra?chet?','Ra?el','Ra?pel','Ratat','Rat?','Rate?',
'Rateu','Raticid','Ratier?','Rating','Ra??','Ra?c?','Ra?ionalism','Ra?ionalist','Ra?ionalist?','Ra?ionament',
'Ravac','Ravagiu','Raven?','Raz','Razan??','Raz?','Razmot','Razn?','Raznocin?i','R?boj',
'R?bufneal?','R?bufnitur?','R?buial?','R?c?nel','R?ceal?','R?chit?','R?chiti?','R?chi?ic?','R?cil?','R?cit',
'R?citur?','R?cnet','R?coreal?','R?covin?','R?cule?','R?cu?c?','R?da?c?','R?d?cin?','R?d?cini?','R?d?cinoas?',
'R?ftule?','R?fuial?','R?gaz','R?get','R?gilat','R?gu?eal?','R?mas','R?m??ag','R?m??eal?','R?m??i??',
'R?murea','R?muri?','R?p?ial?','R?p?it','R?p?itur?','R?pciug?','R?pitur?','R?posat','Risip?','Risling',
'Ri?c?','Ritidom','Ritm','Ritmic?','Ritornel?','Ritual','Ritualism','Ritualist','Ritualist?','Ri?',
'Ri?uit','Rival','Rival?','Rivalt?','Rivanol','Rivier?','Riz','Rizac?','Rizeafc?','Rizic',
'Rizicultur?','Rizoctonioz?','Rizoderm?','Rizoid','Rizom','Rizopod','Rizosfer?','Rizoto','Roab?','Roat?',
'Rob','Robanc','Rob?','Robinet','Robinsonad?','Robot','Robot?','Roboteal?','Robotehnic?','Robotic?',
'Robotit','Roburit','Roc','Rocad?','Rocarni??','Roc?','Rochioar?','Rochi??','Roco?ea','Rod',
'Rodaj','Rodan??','Rodenticid','Rodeo','Rodin?','Rodioar?','Rodiu','Rodocrozit','Rodonit','Rodopsin?',
'Roentgeniu','Rofii','Rogojin?','Rogoz','Rogozi?','Rohatc?','Roi','Roib','Roib?','Roini??',
'Roit','Rojdanic','Rol','Rol?','Rolfilm','Rolgang','Rom','Roman?','Romancero','Romancier?',
'Romanist','Romanist?','Romanistic?','Romani??','Roman??','Romantic','Romantic?','Romantism','Roman??','Româna?',
'Român?','Românc?','Româncu??','Româneasc?','Românism','Romb','Romboedru','Romboid','Rond','Rondel',
'Rondel?','Rondino','Rondo','Rondou','Rongalit','Ronjant','Ron??ial?','Ron??it','Ropot','Ros?tur?',
'Rosbif','Rosbrat','Rospisc?','Rost','Rostogol','Rostogolit','Rostopasc?','Rostru','Ro???ea','Ro?cat',
'Ro?c?','Ro?cov','Ro?cov?','Ro?eal?','Ro?ea??','Ro?ioar?','Ro?tei','Ro?u','Sabat','Sabin?',
'Sabinism','Sabi??','Sablaj','Sablant','Sablez?','Sabord','Sabordaj','Sabotaj','Sabreta?','Sac',
'Saca','Sacad?','Sacagiu','Sacâz','Sacerdot','Sacerdo?iu','Sacnasiu','Sacos','Saco??','Sacou',
'Sacovi??','Sacrament','Sacrificiu','Sacrilegiu','Sacrum','Sacul?','Sad','Sad?','Sadin?','Sadism',
'Saducheism','Saducheu','Safari','Safeu','Safism','Saftea','Safterea','Saga','Sagn?','Sago',
'Sagum','Saharian?','Sahel','Saiga','Saigiu','Saint-bernard','Sal','Salahorit','Salam','Salamalec',
'Salamandr?','Salariat','Salariat?','Salariu','Salat?','Salatier?','Sal?','Salband?','Salb?','Salc?',
'Salcâm','Salep','Salepgiu','Saleu','Salicilat','Salicilin?','Salieni','Salin?','Salinometru','Salipirin?',
'Salivat','Saliv?','Salmiac','Salmonel?','Salmoneloz?','Salmonid','Salol','Salonard','Salonard?','Salona?',
'Salopet?','Salpetru','Salpingit?','Salpingoovarit?','Salpingoscop','Salt','Saltanat','Saltea','Saltelu??','Saltimbanc',
'Sal??','Salut','Salvamarist','Salvamont','Salvamontist','Salvamontist?','Salv?','Salvconduct','Sama','Samar?',
'Samaritean?','Samariu','Sam?','Samb?','Sambo','Samc?','Same?','Samni?i','Samoan?','Samoed',
'Samoed?','Suspensoid','Suspinat','Su??','Sutan?','Suta?','Sut?','Suti?oar?','Sutur?','Suvac',
'Suveic?','Suveicu??','Suvelni??','Suveran?','Svastic?','Swing','?','?','?','?a',
'?abac?','?abana','?ablonism','?abot?','?acal','?ag?','?ah','?ahin?ah','?ahist','?ahist?',
'?ahzadea','?ai','?aic?','?aidaj','?al','?aland','?alanj','?al?u','?alg?u','?alup?',
'?alupist','?alvaragiu','?alvari','?am','?amanism','?ambran?','?amoa','?amot?','?ampan?','?ancroid',
'?ancru','?andrama','?ans?','?ansonet?','?ansonetist','?ansonetist?','?ansonier?','?antaj','?antajist','?antajist?',
'?antez?','?antierist','?antierist?','?antung','?an?','?ap?','?apcaliu','?apc?','?apirograf','?apou',
'?araban?','?arad?','?arampoi','?aret?','?arg','?ariaj','?arj?','?arlatanism','?arl?','?arlot?',
'?arm','?arnier?','?arpant?','?art','?asiu','?asla','?a?lâc','?atr?','??lu?','??n?ule?',
'??n?urel','??tr?reas?','??tru??','?â?âit','?chioap?','?chiop?tur?','?coal?','?col?ri??','?edin??','?edin?oman?',
'?edit?','?ef','?ef?','?eic','Tahograf','Tahometru','Taht','Taic?','Taifas','Taifet',
'Taiga','Taikonaut','Taim-aut','Tain?','Taini??','Talab?','Talamus','Talang?','Talant','Talasogenez?',
'Tala?','Tala?c?','Talaz','Tal?','Talâm','Talc','Talcioc','Talcoz?','Talc?ist','Talent',
'Talerist','Talerist?','Talgera?','Talhâ?','Talhâ?ciu','Taliu','Talme?-balme?','Talmud','Talmudism','Talmudist',
'Talmudist?','Talofit?','Talonaj','Talonet?','Talp?','Talpin?','Talus','Taluz','Talveg','Tam-tam',
'Tamarisc?','Tamarix','Tamazlâc','Tamâ?','Tambuchi','Tamburin?','Tamponament','Tana','Tanagra','Tanaj',
'Tanana','Tananica','Tanant','Tanat','Tanatogenez?','Tan?t','Tanc','Tanchet?','Tanchist','Tancodrom',
'Tandalu??','Tandem','Tanea','Tangaj','Tangara','Tangent?','Tangen??','Tangou','Tantal','Tantalit',
'Tanti','Tantiem?','Tantrism','Tanzanian?','Taoism','Taol?','Tapaj','Tapangea','Tap?','Tapet',
'Tapeur?','Tapioc?','Tapo?nic','Tapur?','Tarabagiu','Tarab?','Tarabostes','Tarabulus','Tarac','Taraf',
'Taragot','Taragotist','Tarama','Taranc?','Tarantel?','Tarantul?','Tarapana','Tarapangiu','Tarara','Tar?',
'Tardigrad','Targ?','Tarif','Tarisfat','Tarla','Tarni??','Taroc','Tarod','Tars','Tartaj',
'Tartan?','Tart?','Tartin?','Tartori??','Tartraj','Tartrat','Tartru','Tartufism','Tescovin?','Tesla',
'Tesl?','Test','Testaceu','Testament','Testea','Testemel','Testicul','Testimoniu','Te?cherea','Te?itur?',
'Tetanism','Tetanos','Tet?','Tetea','Teterist','Tetier?','Tetin?','Tetra','Tetrachen?','Tetraciclin?',
'Tetraclorur?','Tetracord','Tetradrahm?','Tetraedrit','Tetraedru','Tetraevanghel','Tetragram?','Tetrahidronaftalin?','Tetralin?','Tetrametru',
'Tetraonid?','Tetrapod','Tetrarh','Tetrarhat','Tetrasilab','Tetratlonist','Tetratlonist?','Tetrea','Tetrod?','Teu',
'Teug?','Tevatur?','Tex','Texoprint','Text','Textolit','Textolog','Textolog?','Textur?','Tez?',
'Tezism','Tezist','Tezist?','Thailandez','Thailandez?','Thalidomid?','Tiamin?','Tiar?','Tibet','Tibetan?',
'Tibia','Tic','Tic?ial?','Tic?it','Tic?loas?','Tic?los','Tichet','Tichiu??','Tifdruc','Tific',
'Tific?','Tifl?','Tiflit?','Tiflocolit?','Tiflograf','Tiflotehnic?','Tifobaciloz?','Tifos','Tig?i??','Tighel',
'Tighelit','Tignafes','Tigres?','Tigroaic?','Tigru','Tigv?','Tihn?','Tihneal?','Tij?','Tild?',
'Tiliaceu','Tilinc?','Tilincu??','Tili?c?','Timariot','Timbru','Timf','Timin?','Timi?eanc?','Timi?oreanc?',
'Timleac','Timoftic?','Timol','Timon?','Timp','Timpanism','Timpanist','Timpanist?','Timpanit?','Timus',
'Tin?','Tinctur?','Tind?','Tindu??','Tineret','Ultrastructur?','Ultrasunet','Ultravirus','Uluc','Uluc?',
'Uluial?','Umanism','Umanist','Umanist?','Umanitarism','Umanitarist','Umanitarist?','Umanoid','Umanoid?','Umbel?',
'Umbelifer?','Umblat','Umbl?tur?','Umblet','Umbral','Umbr?','Umbrel?','Umbrelu??','Umbri?','Umbri?oar?',
'Umbri??','Umera?','Umezeal?','Umfl?tur?','Umidometru','Umilin??','Umilit','Umlaut','Umorist','Umorist?',
'Umplut','Umplutur?','Unchi','Unchia?','Uncrop','Uncropeal?','Uncropel','Undametru','Und?','Undit',
'Undi??','Undrea','Unealt?','Unghi','Unghioar?','Unghi?oar?','Unghiu??','Unguent','Ungulat','Unguligrad',
'Unguligrad?','Ungura?','Ungureanc?','Ungureasc?','Ungurism','Unguroaic?','Unicat','Uniform?','Unionism','Unisonan??',
'Unit','Unitarianism','Univalent','Univers','Universal','Universalii','Universalism','Universiad?','Uns','Unt',
'Untier?','Untur?','Ununbiu','Ununhexiu','Ununoctiu','Ununpentiu','Ununquadiu','Ununseptiu','Ununtriu','Upercut',
'Uracil','Uralit','Uranin?','Uraninit','Uranism','Uranit','Uraniu','Uraniu-238','Uranotil','Urat',
'Ur?','Ur?tur?','Urât','Urbanism','Urbanist','Urbanistic?','Urbariu','Urcat','Urceol','Urciora?',
'Urcioru?','Urcu?','Urd?','Urdini?','Urdu','Urecheal?','Urecheat','Urecheat?','Urechea?i','Urechelni??',
'Urechiu??','Uredinal?','Uremic','Uremic?','Uretrit?','Uretroscop','Uretru','Urgen??','Uria?','Uria??',
'Uric','Urinal','Urin?','Urlat','Urla?i','Urlet','Urloi','Urluial?','Urm','Urma?',
'Urma??','Urm?','Urm?rit','Urm?rit?','Urmuli??','Urmu?oar?','Urmu??','Urn?','Urobilin?','Urocordat',
'Urocultur?','Urodel','Urolog','Urolog?','Urometru','Urotropin?','Urs','Urs?','Urs?ri??','Ursid?',
'Ursit','Ursit?','Ursoaic?','Ursule?','Ursulin?','Ursuzlâc','Ur?inic','Uruioc','Urzeal?','Urzic?',
'Urzic?tur?','Urzicu??','Urzit','Uscat','Uscatul','Usc?tur?','Usc?turea','Usc??ea','Usn?','Usta?',
'Ustensil?','Ustur?tur?','Usturoi','Usturoi??','Usuc','U?arnic','U?arnic?','U??','U?cheal?','U?cioar?',
'U?i??','U?uli??','U?urin??','U?u??','Ut','Util','Utilaj','Utilitarism','Utilitarist','Utilitarist?',
'Utopism','Utopist','Utopist?','Uvertur?','Uviol','Uvraj','Uvrier?','Uvul?','Uz','Uzaj',
'Uzan??','Uzbec','Uzbec?','Uzi','Uzinaj','Uzin?','Uzufruct','Uzufructuar?','Uzur?','Vacan??',
'Vacarm','Vacat','Vac?','Vaccin?','Vacs','Vacuol?','Velist','Velist?','Velni?','Velni??',
'Velociped','Velocipedist','Velocipedist?','Velodrom','Ven?','Vendet?','Venerolog','Venerolog?','Venet','Venetic',
'Venetic?','Vene?ian?','Venezuelan?','Vengherc?','Veninari??','Venit','Venit?','Ventil','Ventricea','Ventricul',
'Ventrilic?','Ventriloc','Ventriloc?','Ventru','Venturimetru','Ventuz?','Venusian?','Verand?','Verb','Verbalism',
'Verbiaj','Verbin?','Verdea??','Verdict','Verg?','Vergea','Vergel','Vergelu??','Vergelu??','Vergen??',
'Vergetur?','Veric','Verif','Verig?','Verigea','Verigel','Verighet?','Verigu??','Verin?','Verism',
'Verist','Verist?','Veri?can?','Veri?oar?','Veri?oric?','Vermicid','Vermifug','Vermin?','Verminoz?','Vermis',
'Vermorel','Vermut','Vernis','Vernisaj','Veronal','Veronic?','Vers','Versant','Verset','Verslibrism',
'Verslibrist','Verslibrist?','Verso','Verst?','Versurel','Vertebrat','Vertebr?','Vertex','Vertical','Vertical?',
'Verticil','Vertij','Veruc?','Verv?','Verven?','Verzi?','Verzi?oar?','Verzitur?','Vesel?','Vespasian?',
'Vest','Vestal?','Vest?','Vestibul','Vestigiu','Ve?c?','Ve?mânt','Veteran?','Veto','Vetrel?',
'Vetri?oar?','Vetri??','Veveri??','Vexil','Vezic?','Vezicul?','Via','Viaduct','Via??','Vibrato',
'Wiki','Willemit','Willy-willy','Windsurf','Wolfram','Wolframat','Wolframit','Wombat','Wulfenit','Wurtzit',
'Xantelasma','Xantelasm?','Xantin?','Xantocit','Xantofil?','Xantom','Xantomatoz?','Xenism','Xenobioz?','Xenodiagnostic',
'Xenofil','Xenofil?','Xenofob','Xenofob?','Xenogenez?','Xenolit','Xenoman?','Xenotropism','Xeres','Xerofit?',
'Xeroform','Xerogel','Xerograf','Xeromorfism','Xerox','Xeroz?','Xifoid','Xilem','Xilidin?','Xilofonist',
'Xilofonist?','Xilograf','Xilograf?','Xilogram?','Xilogravur?','Xilolit','Xiloz?','Yal?','Yankeu','Yard',
'Yearling','Yemenit','Yemenit?','Yoga','Yoghin?','Yoghist','Yoghist?','Yohimbin?','York','Yterbin?',
'Yterbiu','Ytriu','Yucca','Yuki','Yuri','Zabet','Zabrac','Zabr?','Zacherlin?','Zacusc?',
'Zad?','Zagara','Zaharat','Zaharaz?','Zaharica','Zaharimetru','Zaharin?','Zaharni??','Zaharometru','Zaharoz?',
'Zaharuri','Zaherea','Zaiafet','Zaic?','Zaicoi','Zaiflâc','Zaimf','Zairez','Zairez?','Zalhana',
'Zambian?','Zambil?','Zambilic?','Zambol','Zamc?','Zamfir?','Zamparagiu','Zamparalâc','Zapat','Zapateado',
'Zapcial?','Zapcilâc','Zapciu','Zapis','Zapisc?','Zapt','Zaraf','Zarafi??','Zaratit','Zar?',
'Zarf','Zarnacadea','Zarpa','Zarv?','Zarzavagioaic?','Zarzavagiu','Zarzavat','Zarz?r?','Zastup','Za?',
'Zaver?','Zavergiu','Zavesc?','Zavragioaic?','Zavragiu','Z?bal?','Z?bav?','Z?b?lu??','Z?bl?u','Z?branic',
'Z?brea','Zdrobitur?','Zdrumic?tur?','Zdruncin?tur?','Zdup','Zdup?ial?','Zeam?','Zeamil','Zebereal?','Zebr?',
'Zebu','Zecic?','Zecimal?','Zeciuial?','Zeciuit','Zeciuri','Zeflemea','Zeflemism','Zegras','Zein?',
'Zei??','Zel','Zemnic','Zemos','Zenana','Zend?','Zenit','Zeolit','Zerdiceaf','Zermacup',
'Zero','Zestra?','Zestri?oar?','Ze?aj','Ze??ri??','Ze?uit','Zeu','Zeugm?','Zgaib?','Zganc?',
'Zgard?','Zg?ibuli??','Zg?rdi??','Zg?rdu??','Zg?u','Zgâit','Zgâl?âial?','Zgâl?âit','Zgâl?âitur?','Zgâmboi',
'Zgârci','Zgârcioab?','Zgârciob','Zgârcitur?','Zgârieci','Zgârietur?','Zgl?voac?','Zgl?voc','Zgomot','Zgr?bun??',
'Zgr?bun?ic?','Zgrip?ora?','Zgrip?uroaic?','Zgrip?uroi','Zguduial?','Zguduitur?','Zgur?','Zi','Ziarist','Ziarist?',
'Ziaristic?','Zibelin?','Zibet?','Zical?','Zica?','Zic?la?','Zic?tur?','Zid','Zid?reas?','Zid?rit',
'Zid?ri??','Ziditorul','Zidurel','Zigogeneza','Zigogenez?','Zigom?','Zigot','Zigurat','Zigzag','Zila?',
'Ziler?','Zili?oar?','Zimaz?','Zimberec','Zimbil','Zimbru','Zim?','Zinc','Zincograf','Zincograf?',
'Zincogravur?','Zinnwaldit','Zirconiu','Zis?','Ziulic?','Ziuli??','Ziu?oar?','Zl?t?reas?','Zloat?','Zlot',
'Zlota?','Zmeoaic?','Zmeoi','Zmeu','Zmeule?');
  
  lista_substantive_rn varr := varr('Aalenian','Abager','Abajur','Abandon','Abator','Abdomen','Abecedar','Abientin','Aborigen','Abrazor',
'Abreviator','Abrudean','Absorbitor','Abur','Academician','Acadian','Acaparator','Acar','Acarian','Accelerator',
'Acheuleean','Achizitor','Acin','Acompaniator','Acordeon','Acordor','Acromion','Acrospor','Actinon','Actinopterigian',
'Activator','Actor','Actuar','Ac?ionar','Acumulator','Acupunctor','Acustician','Acu?or','Acuzator','Acvamarin',
'Acvaplan','Aeromotor','Aeroplan','Aeroplancton','Aeroreactor','Afân?tor','Afgan','Afin','Afinor','Afion',
'Afi?ier','Afi?or','Afl?tor','Afon','African','Afrikaander','Afrikander','Agar-agar','Agarean','Agheasmatar',
'Agitator','Aglomerator','Aglutinogen','Agnomen','Antecesor','Antediluvian','Antetren','Antevorbitor','Anticar','Anticiclon',
'Anticipator','Anticlor','Antielectron','Antifon','Antifonar','Antigen','Antihormon','Antiinflamator','Antineutron','Antioxigen',
'Antiparazitar','Antiproton','Antiroman','Antiser','Badian','Badminton','Baedeker','Baian','Baider','Bajoaier',
'Balador','Balafon','Balansier','Balansoar','Balansor','Balastor','Balaur','Balcon','Baldachin','Balerin',
'Balistician','Balizor','Balon','Ban','Banan','Bananier','Bancaiz?n','Bancher','Bancrutar','Bandurar',
'Banian','Bantustan','Bar','Barbar','Barbi?on','Barbun','B?ligar','B?l?ean','B?n??ean','B?nicer',
'B?ni?or','B?r?gan','B?rbier','B?rz?un','B?snar','B?t?tor','B?trân','B?utor','Bârdan','Bârfitor',
'Bârl?dean','Bâtlan','Becar','Becer','Becher','Beduin','Belfer','Belgian','Blan?ir','Blasfemator',
'Blastomer','Blazer','Blazon','Bl?nar','Blidar','Blogger','Bluzon','Boar','Bobinator','Bogasier',
'Bogatâr','Bog?tan','Boier','Boiler','Boi?tean','Boitar','Bojogar','Boldi?or','Bolivian','Bolovan',
'Bol?ar','Bombardier','Bombardon','Cefar','Celar','Celebrator','Celestin','Celibatar','Celofan','Celuitor',
'Celular','Cenomanian','Centaur','Centenar','Centiar','Centiron','Centralizator','Centromer','Centumvir','Centurion',
'Cenur','Cenu?ar','Cenzor','Cepchen','Cepu?or','Cer','Cerber','Cercar','Cerc?tor','Cercet?tor',
'Cercuitor','Cercu?or','Chivernisitor','Christadelfian','Cian','Cianogen','Cibernetician','Cicar','Ciclamen','Ciclan',
'Cicloalcan','Ciclohexan','Ciclon','Ciclopentan','Ciclopropan','Ciclotron','Cimbri?or','Cimen','Cimi?ir','Cimitir',
'Cimpoier','Cin','Cincantin','Cincar','Cincin','Cineamator','Cineroman','Cioban','Comedon','Comentator',
'Comesean','Comis-voiajor','Comisar','Comision','Comisionar','Comodor','Comor','Como?tenitor','Compactor','Companion',
'Comparator','Compendiator','Compensator','Comper','Competitor','Compilator','Compostor','Compozitor','Compresor','Computer',
'Comun','Comutator','Con','Cooperator','Coordonator','Copaier','Copan','Copier','Copolimer','Coproprietar',
'Copywriter','Cor','Coralier','Coran','Coraportor','Cor?bier','Corbi?or','Corbu?or','Cordar','Cordelier',
'Cordon','Cordovan','Corector','Coredactor','Coreean','Coregizor','Coregon','Coreligionar','Corepetitor','Corhan',
'Coridor','Corindon','Corintian','Danian','Dansator','Dar','D?bilar','D?ltuitor','D?n?uitor','D?r?citor',
'D?râm?tor','D?ruitor','D?un?tor','Dâmbovi?ean','Dâmbu?or','Dârmon','Dealer','Debarasor','Debarcader','Debitor',
'Debre?in','Decagon','Decameron','Decan','Decantor','Decapator','Decapsulator','Decar','Decaster','Decatlon',
'Decatron','Decemvir','Decister','Declan?ator','Declan?or','Declin','Declinator','Decor','Decorator','Decorticator',
'Decupator','Decurion','Decuscutator','Defazor','Defecator','Defendor','Defensor','Defibrator','Defibrilator','Dezleg?tor',
'Dezmiri?titor','Dezodorizator','Dezorganizator','Diacon','Diagnostician','Dialectician','Dializor','Diapazon','Diaproiector','Diblar',
'Dictafon','Dictator','Dicton','Dic?ionar','Dietetician','Difuzor','Driver','Drobu?or','Dromader','Dro?car',
'Drumar','Drumlin','Drummer','Drumu?or','Dub?lar','Dublon','Duhan','Dul?pior','Dulci?or','Dulgher',
'Dumper','Dun?rean','Duoden','Dup?cinar','Duramater','Duramen','Durian','Durilon','Du?man','Duumvir',
'Eastmancolor','Eben','Ebo?oar','Echer','Echilibror','Echipier','Eclator','Ecler','Ecleror','Eclozionator',
'Economizator','Economizor','Ecran','Ectropion','Ecuadorian','Ecuator','Ecuson','Edafon','Edecar','Edelschwein',
'Eden','Editor','Educator','Efector','Efor','Efractor','Efuzor','Egalizator','Egalizor','Egiptean',
'Egumen','Egutor','Eider','Eidofor','Ejector','Elan','Elastomer','Elebor','Elector','Electrician',
'Electrocar','Electrocauter','Electrofon','Electrofor','Electrolizor','Electromotor','Electron','Electropor?elan','Electrosomn','Elektron',
'Elen','Eleron','Elevator','Elicopter','Extrasezon','Facturier','Faeton','Faian?ar','Faian?ator','Falaitar',
'Falanster','Falansterian','Falern','Falsificator','Falun','Famen','Fan','Fanar','Fanfaron','Fanion',
'Fanon','Far','Faraon','Farmazon','Farsor','Fason','Fasonator','Faun','Faur','Faurmaur',
'Fazan','Fazitron','Fazotron','F?c?tor','F?clier','F?g?r??ean','F?litor','F?l?uitor','F?ptuitor','F?râm?tor',
'F??uitor','F?urar','F?uritor','Fân','Fâni?or','Fântânar','Fecior','Feder','Filator','Filer',
'Filfizon','Filigran','Filistean','Filistin','Filodendron','Filon','Fin','Financiar','Finan?ator','Finisor',
'Fior','Fiorin','Fir','Firezar','Firi?or','Firman','Fi?ier','Fitohormon','Fitopatogen','Fitoplancton',
'Fitotron','Fixator','Fizician','Flacon','Flaier','Flamin','Flan','Flanger','Fla?netar','Fl?c?uan',
'Flecar','Flegmon','Fler','Fleuron','Fligorn','Flocu?or','Florar','Florean','Floricultor','Florin',
'Flotor','Fludor','Fluidizor','Fluier','Fluierar','Fluor','Fluorfosgen','Flutter','Flutur','Galben',
'Galican','Galion','Gali?ian','Galoman','Galon','Galoroman','Galvanocauter','Gambir','Ganglion','Gangster',
'Gaolean','Garderobier','Gardian','Garlin','Ga?per','Gater','Gauleiter','Gaur','Gazbeton','Gazetar',
'Gazoanalizator','Gazogen','Gazon','Gazotron','G?inar','G?itan','G?it?nar','G?l??ean','G?lbior','G?ligan',
'G?man','G?rdinar','G?rg?un','G?sitor','G?van','G?zar','Gâlcevitor','Gânditor','Gârgâr','Gâscan',
'Gâscar','Gâtar','Gâti?or','Gâtlan','Geamantan','Gear','Gen','Generator','Genetician','Genitor',
'Gentleman','Genuncher','Globe-trotter','Globu?or','Glosar','Glosator','Gluten','Gluton','Gnomon','Goblen',
'Godin','Godron','Gogoman','Gogo?ar','Golan','Goldan','Golgheter','Gologan','Gondolier','Gonfalon',
'Gonfalonier','Gonitor','Gordin','Gorgan','Gorjean','Gorun','Gospodar','Go?tinar','Gotcan','Graben',
'Graden','Gradier','Graf-plotter','Grafician','Grafofon','Grafoman','Graifer','Gramatician','Gramofon','Grandoman',
'Grangur','Granivor','Granulator','Graten','Graur','Graviton','Gravor','Gr?dinar','Gr?jdar','Gr?nicer',
'Gr?sun','Gr?tar','Gr?uncior','Grânar','Grâu?or','Greab?n','Greb?nar','Grecoman','Grecu?or','Greder',
'Green','Grefier','Grefon','Greghetin','Greier','Gren','Gresor','Grifon','Grimeur','Grivan',
'Groh?itor','Gropan','Gropar','Gros-plan','Groscior','Grosoman','Grosular','Grum?jer','Grupu?or','Gruzin',
'Guardaman','Gudron','Gudronator','Gugiuman','Gujon','Gulden','Guler','Gunoier','Gustar','Gust?tor',
'Gu?ter','Guvern','Guvernator','Guvernor','Guzgan','Guzlar','Halebardier','Halogen','Halon','Haloplancton',
'Halor','Halucinogen','Hambar','Hamburger','Hamster','Han','Han-t?tar','Hangan','Hangar','Hanger',
'Har','Haraiman','Haramin','Hardpan','Harghitean','Harman','Harpagon','Harpon','Harponier','Hartan',
'Ha?urator','Hatâr','Hatman','Ha?egan','Haustor','Havator','H?inar','H?itar','Hânsar','Hebdomadar',
'Hectar','Heder','Hegelian','Hegemon','Helicon','Heliodor','Heliogravor','Helion','Heliotehnician','Hematogen',
'Hematozoar','Hemion','Hemipter','Hemodializor','Hidrociclon','Hidrocortizon','Hidroelevator','Hidrofon','Hidrofor','Hidrogen',
'Hidrogenerator','Hidroglisor','Hidrolocator','Hidrometeor','Hidromonitor','Hidroseparator','Hidrotehnician','Hidrozoar','Himen','Himenopter',
'Hingher','Hiparion','Hiperon','Hipertiroidian','Ie?ean','Iezer','Iezi?or','Iezu?or','Ighemonicon','Ignitor',
'Ignitron','Iguanodon','Ihneumon','Ihtiozaur','Ileon','Ilfovean','Ilion','Ilir','Iluminator','Ilustrator',
'Imbrohor','Imitator','Imn','Impactor','Infirmier','Informatician','Informator','Infractor','Infuzor','Inginer',
'Inhalator','Inhibitor','Inion','Ini?or','Ini?iator','Injector','Inovator','Insectar','Insectivor','Insecutor',
'Inspector','Inspirator','Instalator','Instaurator','Instigator','Instilator','Institutor','Instructor','Instrumentar','îngrijitor',
'înjunghietor','înlocuitor','înmuietor','înmul?itor','înot?tor','înregistrator','înrobitor','însemn','înso?itor','întemeietor',
'întinz?tor','întorc?tor','întrefier','întrerup?tor','Jeton','Jian','Jiclor','Jidan','Jigher','Jimblar',
'Jipan','Jir','Jitar','Jitnicer','Jneap?n','Joag?r','Jobber','Joben','Jocu?or','Joimir',
'Joker','Jonctor','Josean','Juc?tor','Judec?tor','Judocan','Jugan','Jug?nar','Juisor','Juncan',
'Juncu?or','Jungher','Junior','Lacto-vegetarian','Lactobar','Lactofermentator','Lactogen','Lactoser','Ladin','Lag?r',
'Laib?r','Lainer','Lamantin','Lambrechin','Laminator','Laminor','Lampadar','Lampion','Lamprofir','Lan',
'Lancasterian','Landler','Lansator','Lantan','Lao?ian','Lapon','Laringofon','Laser','Laticifer','Latifundiar',
'Latin','Latinizator','Latir','Laur','Lute?ian','Lutier','Luti?or','Macaronar','Macedonean','Macedoromân',
'Macerator','Macferlan','Machetator','Machior','Macmahon','Macropor','Macrospor','Maculator','Madipolon','Madrepor',
'Madrilen','Magazin','Magaziner','Magazioner','Maghiar','Maghiran','Magician','Magiun','Magnadur','Magnetizator',
'Magnetofon','Magnetomotor','Magneton','Magnetron','Mah?r','M?mular','M?nu?ar','M?r','M?rar','M?r?cinar',
'M?rfar','M?rg?ritar','M?rgean','M?rmurar','M?r??luitor','M?rturisitor','M?r?i?or','M?run?i?ar','M?sar','M?s?lar',
'M?selar','M?slin','M?slinar','M?sluitor','M?sur?tor','M?t?sar','M?turar','M?tur?tor','M??ar','M??i?or',
'M?z?rar','Mânc?tor','Mândri?or','Mânecar','Mâner','Mânuitor','Navigator','Navlositor','Nazar','Nazâr',
'N?dr?gar','N?ier','N?imitor','N?lbar','N?p?stuitor','N?s?udean','N?scior','N?sturar','N?su?or','N?v?litor',
'N?vodar','Neprieten','Nerecunosc?tor','Neseser','Nesomn','Netezitor','Neuron','Neutron','Nev?z?tor','Nevropter',
'Newton','Newtonian','Nicaraguan','Nichelator','Nictemer','Nigerian','Nipon','Nisipar','Ob?dar','Ober',
'Oberchelner','Obijduitor','Oblon','Obor','Oborean','Obr?jor','Obr?zar','Observator','Obsidian','Obstetrician',
'Paladin','Palan','Palanchin','Palatin','Paleocen','Paleogen','Palestinian','Palicar','Palier','Palmer',
'Palmier','Palonier','Palpator','Paltin','Palton','Pamfletar','Panacodar','Panaghiar','Pandi?pan','Pandur',
'Paner','Pangar','Panglicar','Pavator','Pavian','Pavilion','Pavlichian','Pavor','Pazarghidean','P?curar',
'P?durar','P?durean','P?gân','P?ianjen','P?ier','P?injinar','P?i?or','P?l?mar','P?l?rier','P?limar',
'P?liur','P?lmar','P?ltior','P?mântean','P?nu?er','P?pu?ar','P?r','Rap?n','Raportor','Raster',
'Ra?chetator','Raton','R?can','R?car','R?chitan','R?chitar','R?citor','R?cu?or','R?dvan','R?puitor',
'Ri?car','Rodan','Rodier','Rododendron','Rodor','Rodozahar','Rogojinar','Rolan','Roli?or','Roller',
'Roman','Romancier','Român','Romergan','Röntgen','Roshar','Rostogolitor','Rostuitor','Ro?ior','Sabin',
'Sabir','Sablator','Sabotor','Sabrer','Sabur','Sachelar','Sacrificator','Sacristan','Safir','Safran',
'Saftian','Sagitar','Sagotier','Sahan','Saidecar','Saivan','Salahor','Salon','Saloon','Salvamar',
'Salvarsan','Samar','Samaritean','Samoan','Suspensor','Suspin','Sus?in?tor','Susur','Sutar','Sutien',
'Suvenir','Suveran','Suzeran','Sveter','?ab?r','?ablon','?ablonar','?afar','?agrin','?ah?r-mah?r',
'?alander','?alanger','?alazion','?alt?r','?alupar','?alvir','?aman','?ambelan','?amotar','?amotier',
'?ampon','?an','?anfren','?ansonier','?antan','?antier','?aran','?arlatan','??n?i?or','??trar',
'?colar','?edin?oman','?eitan','Tahmin','Tahogenerator','Taier','Taifun','Tain','Taior','Talan',
'Talar','Taler','Talger','Talian','Talion','Talisman','Talon','Taloner','Tamar','Tamarin',
'Tambur','Tampon','Tandur','Tanghir','Tangon','Tanin','Tanzanian','Tapetar','Tapeur','Tapir',
'Tapi?er','Tar','Taracan','Tarar','Tarhan','Tarhon','Tarlatan','Tarpan','Tartan','Tartar',
'Tartor','Teslar','Testator','Tester','Testosteron','Te?itor','Tetraclormetan','Tetragon','Tetrahidrobenzen','Tetratlon',
'Teuton','Textier','Tezaur','Tezaurar','Tezaurizator','Thriller','Tibetan','Tibi?ir','Tifan','Tifon',
'Timar','Timi?ean','Timi?orean','Timonier','Timpan','Timpanon','Um?r','Umbl?tor','Umbrar','Umerar',
'Umezitor','Umor','Unchi?or','Undi?ar','Uneltitor','Ung?tor','Unghenean','Ungher','Ungur','Ungurean',
'Unicorn','Unison','Unitarian','Universitar','Untar','Untdelemn','Unti?or','Uragan','Urangutan','Uranofan',
'Ur?tor','Urcior','Urdar','Uretan','Ureter','Uricar','Urm?ritor','Urm?tor','Urobilinogen','Ursar',
'Ursitor','Urson','Urzitor','Usc?tor','U?er','U?ier','U?or','Uter','Utilizator','Uvrier',
'Uzufructuar','Uzurar','Uzurpator','Vaccin','Velnicer','Velur','Vene?ian','Venezuelan','Venin','Ventilator',
'Venusian','Verfafor','Verificator','Verigar','Veri?can','Veri?or','Vermillon','Vernier','Versificator','Versor',
'Versuitor','Verzi?or','Vestiar','Vestitor','Veston','Veteran','Vezuvian','Vibrafon','Woofer','Xenoman',
'Xenon','Xilan','Xilen','Xilofon','Yen','Yoghin','YouTuber','Yuan','Zabaion','Zadar',
'Zaharificator','Zah?r','Zaib?r','Zambian','Zamfir','Zaporojean','Zar','Zarafir','Zarz?r','Zdrobitor',
'Zdruncin','Zecer','Zefir','Zelar','Zelator','Zeonifer','Zeppelin','Ze?ar','Zgrip?or','Zgrun?ur',
'Ziar','Zidar','Ziditor','Zigospor','Ziler','Zimnicean','Zimogen','Zim?i?or','Zircon','Zl?tar',
'Zmeur','Zmeurar','Zmeurar');
  
  lista_nume varr := varr('Ababei','Acasandrei','Adascalitei','Afanasie','Agafitei','Agape','Aioanei','Alexandrescu','Alexandru','Alexe',
  'Alexii','Amarghioalei','Ambroci','Andonesei','Andrei','Andrian','Andrici','Andronic','Andros','Anghelina','Anita','Antochi','Antonie',
  'Apetrei','Apostol','Arhip','Arhire','Arteni','Arvinte','Asaftei','Asofiei','Aungurenci','Avadanei','Avram','Babei','Baciu','Baetu',
  'Balan','Balica','Banu','Barbieru','Barzu','Bazgan','Bejan','Bejenaru','Belcescu','Belciuganu','Benchea','Bilan','Birsanu','Bivol',
  'Bizu','Boca','Bodnar','Boistean','Borcan','Bordeianu','Botezatu','Bradea','Braescu','Budaca','Bulai','Bulbuc-aioanei','Burlacu',
  'Burloiu','Bursuc','Butacu','Bute','Buza','Calancea','Calinescu','Capusneanu','Caraiman','Carbune','Carp','Catana','Catiru','Catonoiu',
  'Cazacu','Cazamir','Cebere','Cehan','Cernescu','Chelaru','Chelmu','Chelmus','Chibici','Chicos','Chilaboc','Chile','Chiriac','Chirila',
  'Chistol','Chitic','Chmilevski','Cimpoesu','Ciobanu','Ciobotaru','Ciocoiu','Ciofu','Ciornei','Citea','Ciucanu','Clatinici','Clim','Cobuz',
  'Coca','Cojocariu','Cojocaru','Condurache','Corciu','Corduneanu','Corfu','Corneanu','Corodescu','Coseru','Cosnita','Costan','Covatariu',
  'Cozma','Cozmiuc','Craciunas','Crainiceanu','Creanga','Cretu','Cristea','Crucerescu','Cumpata','Curca','Cusmuliuc','Damian','Damoc',
  'Daneliuc','Daniel','Danila','Darie','Dascalescu','Dascalu','Diaconu','Dima','Dimache','Dinu','Dobos','Dochitei','Dochitoiu','Dodan',
  'Dogaru','Domnaru','Dorneanu','Dragan','Dragoman','Dragomir','Dragomirescu','Duceac','Dudau','Durnea','Edu','Eduard','Eusebiu','Fedeles',
  'Ferestraoaru','Filibiu','Filimon','Filip','Florescu','Folvaiter','Frumosu','Frunza','Galatanu','Gavrilita','Gavriliuc','Gavrilovici',
  'Gherase','Gherca','Ghergu','Gherman','Ghibirdic','Giosanu','Gitlan','Giurgila','Glodeanu','Goldan','Gorgan','Grama','Grigore','Grigoriu',
  'Grosu','Grozavu','Gurau','Haba','Harabula','Hardon','Harpa','Herdes','Herscovici','Hociung','Hodoreanu','Hostiuc','Huma','Hutanu','Huzum',
  'Iacob','Iacobuta','Iancu','Ichim','Iftimesei','Ilie','Insuratelu','Ionesei','Ionesi','Ionita','Iordache','Iordache-tiroiu','Iordan','Iosub',
  'Iovu','Irimia','Ivascu','Jecu','Jitariuc','Jitca','Joldescu','Juravle','Larion','Lates','Latu','Lazar','Leleu','Leon','Leonte','Leuciuc',
  'Leustean','Luca','Lucaci','Lucasi','Luncasu','Lungeanu','Lungu','Lupascu','Lupu','Macariu','Macoveschi','Maftei','Maganu','Mangalagiu',
  'Manolache','Manole','Marcu','Marinov','Martinas','Marton','Mataca','Matcovici','Matei','Maties','Matrana','Maxim','Mazareanu','Mazilu',
  'Mazur','Melniciuc-puica','Micu','Mihaela','Mihai','Mihaila','Mihailescu','Mihalachi','Mihalcea','Mihociu','Milut','Minea','Minghel',
  'Minuti','Miron','Mitan','Moisa','Moniry-abyaneh','Morarescu','Morosanu','Moscu','Motrescu','Motroi','Munteanu','Murarasu','Musca',
  'Mutescu','Nastaca','Nechita','Neghina','Negrus','Negruser','Negrutu','Nemtoc','Netedu','Nica','Nicu','Oana','Olanuta','Olarasu',
  'Olariu','Olaru','Onu','Opariuc','Oprea','Ostafe','Otrocol','Palihovici','Pantiru','Pantiruc','Paparuz','Pascaru','Patachi','Patras',
  'Patriche','Perciun','Perju','Petcu','Pila','Pintilie','Piriu','Platon','Plugariu','Podaru','Poenariu','Pojar','Popa','Popescu',
  'Popovici','Poputoaia','Postolache','Predoaia','Prisecaru','Procop','Prodan','Puiu','Purice','Rachieru','Razvan','Reut','Riscanu',
  'Riza','Robu','Roman','Romanescu','Romaniuc','Rosca','Rusu','Samson','Sandu','Sandulache','Sava','Savescu','Schifirnet','Scortanu',
  'Scurtu','Sfarghiu','Silitra','Simiganoschi','Simion','Simionescu','Simionesei','Simon','Sitaru','Sleghel','Sofian','Soficu','Sparhat',
  'Spiridon','Stan','Stavarache','Stefan','Stefanita','Stingaciu','Stiufliuc','Stoian','Stoica','Stoleru','Stolniceanu','Stolnicu','Strainu',
  'Strimtu','Suhani','Tabusca','Talif','Tanasa','Teclici','Teodorescu','Tesu','Tifrea','Timofte','Tincu','Tirpescu','Toader','Tofan','Toma',
  'Toncu','Trifan','Tudosa','Tudose','Tuduri','Tuiu','Turcu','Ulinici','Unghianu','Ungureanu','Ursache','Ursachi','Urse','Ursu','Varlan',
  'Varteniuc','Varvaroi','Vasilache','Vasiliu','Ventaniuc','Vicol','Vidru','Vinatoru','Vlad','Voaides','Vrabie','Vulpescu','Zamosteanu','Zazuleac');
  
  lista_prenume_fete varr := varr('Adina','Alexandra','Alina','Ana','Anca','Anda','Andra','Andreea','Andreia','Antonia','Bianca','Camelia',
  'Claudia','Codrina','Cristina','Daniela','Daria','Delia','Denisa','Diana','Ecaterina','Elena','Eleonora','Elisa','Ema','Emanuela','Emma',
  'Gabriela','Georgiana','Ileana','Ilona','Ioana','Iolanda','Irina','Iulia','Iuliana','Larisa','Laura','Loredana','Madalina','Malina','Manuela',
  'Maria','Mihaela','Mirela','Monica','Oana','Paula','Petruta','Raluca','Sabina','Sanziana','Simina','Simona','Stefana','Stefania','Tamara',
  'Teodora','Theodora','Vasilica','Xena');
  
  lista_prenume_baieti varr := varr('Adrian','Alex','Alexandru','Alin','Andreas','Andrei','Aurelian','Beniamin','Bogdan','Camil','Catalin',
  'Cezar','Ciprian','Claudiu','Codrin','Constantin','Corneliu','Cosmin','Costel','Cristian','Damian','Dan','Daniel','Danut','Darius','Denise',
  'Dimitrie','Dorian','Dorin','Dragos','Dumitru','Eduard','Elvis','Emil','Ervin','Eugen','Eusebiu','Fabian','Filip','Florian','Florin',
  'Gabriel','George','Gheorghe','Giani','Giulio','Iaroslav','Ilie','Ioan','Ion','Ionel','Ionut','Iosif','Irinel','Iulian','Iustin','Laurentiu',
  'Liviu','Lucian','Marian','Marius','Matei','Mihai','Mihail','Nicolae','Nicu','Nicusor','Octavian','Ovidiu','Paul','Petru','Petrut','Radu',
  'Rares','Razvan','Richard','Robert','Roland','Rolland','Romanescu','Sabin','Samuel','Sebastian','Sergiu','Silviu','Stefan','Teodor','Teofil',
  'Theodor','Tudor','Vadim','Valentin','Valeriu','Vasile','Victor','Vlad','Vladimir','Vladut');
        
  lista_tari varr := varr('Rusia','Romania','Germania','Grecia','Turcia','Spania','Anglia','Suedia','Albania','Bulgaria'); 
  lista_gen varr := varr('Drama','Romance','Poetry','Fiction','Fabule','Horror','Psihologic','Jurnal','Carte de colorat',
  'Povesti pentru copii','Istorie'); 
  
   
  v_nume VARCHAR2(255);
  v_prenume VARCHAR2(255);
  v_prenume1 VARCHAR2(255);
  v_prenume2 VARCHAR2(255);
  v_matr VARCHAR2(6);
  v_matr_aux VARCHAR2(6);
  v_temp int;
  v_temp1 int;
  v_temp2 int;
  v_temp3 int;
  v_temp_date date;
  v_data_nastere date;  
  v_nationalitate VARCHAR2(255);
  v_salariu int;
  v_an_publicatie date;
  v_nr_totale int;
  v_nr_disponibile int;
  v_gen_carte VARCHAR2(255);
  v_titlu_carte VARCHAR2(255);
  v_titlu1 VARCHAR2(255);
  v_titlu2 VARCHAR2(255);
  tipA int;
  tipB int;
  v_data_tranzactie date;
  v_data_limita date;
  v_username VARCHAR2(255);
  v_pass VARCHAR2(255);

  v_gen VARCHAR2(255);
  v_valoare_platita int;
  v_tip int;
  
  v_oras VARCHAR2(255);
  v_strada VARCHAR2(255);
  v_phone VARCHAR2(255);
  v_address VARCHAR2(255);
  v_mail VARCHAR2(255);

BEGIN
  
   DBMS_OUTPUT.PUT_LINE('Inserarea a 5000 autori...');
   FOR v_i IN 1..5000 LOOP
    
        v_nume := lista_nume(TRUNC(DBMS_RANDOM.VALUE(0,lista_nume.count))+1);
      IF (DBMS_RANDOM.VALUE(0,100)<50) THEN      
         v_prenume1 := lista_prenume_fete(TRUNC(DBMS_RANDOM.VALUE(0,lista_prenume_fete.count))+1);
         LOOP
            v_prenume2 := lista_prenume_fete(TRUNC(DBMS_RANDOM.VALUE(0,lista_prenume_fete.count))+1);
            exit when v_prenume1<>v_prenume2;
         END LOOP;
       ELSE
         v_prenume1 := lista_prenume_baieti(TRUNC(DBMS_RANDOM.VALUE(0,lista_prenume_baieti.count))+1);
         LOOP
            v_prenume2 := lista_prenume_baieti(TRUNC(DBMS_RANDOM.VALUE(0,lista_prenume_baieti.count))+1);
            exit when v_prenume1<>v_prenume2;
         END LOOP;       
       END IF;
     
     IF (DBMS_RANDOM.VALUE(0,100)<60) THEN  
        IF LENGTH(v_prenume1 || ' ' || v_prenume2) <= 20 THEN
          v_prenume := v_prenume1 || ' ' || v_prenume2;
        END IF;
        else 
           v_prenume:=v_prenume1;
      END IF;       
       
  
    
     v_nationalitate := lista_tari(TRUNC(DBMS_RANDOM.VALUE(0,lista_tari.count))+1);
      
      v_temp:='';
    
                      
        insert into autori values(v_i, v_nume, v_prenume,v_nationalitate, sysdate, sysdate);
   END LOOP;
   DBMS_OUTPUT.PUT_LINE('Inserarea a 5000 autori... GATA !');
   
  --------------------------
  --------------------------
  -------------------------
  ---------------------------
  ---angajati-------------
   DBMS_OUTPUT.PUT_LINE('Inserarea a 30 angajati...');
   
   FOR v_i IN 1..30 LOOP
      v_nume := lista_nume(TRUNC(DBMS_RANDOM.VALUE(0,lista_nume.count))+1);
      IF (DBMS_RANDOM.VALUE(0,100)<50) THEN      
         v_prenume1 := lista_prenume_fete(TRUNC(DBMS_RANDOM.VALUE(0,lista_prenume_fete.count))+1);
         LOOP
            v_prenume2 := lista_prenume_fete(TRUNC(DBMS_RANDOM.VALUE(0,lista_prenume_fete.count))+1);
            exit when v_prenume1<>v_prenume2;
         END LOOP;
       ELSE
         v_prenume1 := lista_prenume_baieti(TRUNC(DBMS_RANDOM.VALUE(0,lista_prenume_baieti.count))+1);
         LOOP
            v_prenume2 := lista_prenume_baieti(TRUNC(DBMS_RANDOM.VALUE(0,lista_prenume_baieti.count))+1);
            exit when v_prenume1<>v_prenume2;
         END LOOP;       
       END IF;
       
       IF (DBMS_RANDOM.VALUE(0,100)<60) THEN  
          IF LENGTH(v_prenume1 || ' ' || v_prenume2) <= 20 THEN
            v_prenume := v_prenume1 || ' ' || v_prenume2;
          END IF;
          else 
             v_prenume:=v_prenume1;
        END IF;               
    
         v_salariu := '';
         v_salariu := DBMS_RANDOM.VALUE(8,20)*100;
      v_data_nastere := TO_DATE('01-01-1960','MM-DD-YYYY')+TRUNC(DBMS_RANDOM.VALUE(0,365))+TRUNC(DBMS_RANDOM.VALUE(0,40))*365;
      v_temp:='';
                        
    insert into angajati values(v_i, v_nume, v_prenume, v_data_nastere, v_salariu, sysdate, sysdate);
   END LOOP;
   DBMS_OUTPUT.PUT_LINE('Inserarea a 30 angajati... GATA !');
   
  ---------------------------- 
    --------------------------
  --------------------------
  -------------------------
  ---------------------------
  ---carti-------------
    DBMS_OUTPUT.PUT_LINE('Inserarea a 10000 de carti...');
   
   FOR v_i2 IN 1..10000 LOOP
    
   IF (DBMS_RANDOM.VALUE(0,100)<50) THEN  
      v_titlu1 := lista_substantive(TRUNC(DBMS_RANDOM.VALUE(0,lista_substantive.count))+1);
      tipA:=1;
       ELSE
      v_titlu1 := lista_substantive_rn(TRUNC(DBMS_RANDOM.VALUE(0,lista_substantive_rn.count))+1);
       tipA:=2;
   END IF;
   
   IF (DBMS_RANDOM.VALUE(0,100)<50) THEN  
         v_titlu2 := lista_substantive_e(TRUNC(DBMS_RANDOM.VALUE(0,lista_substantive_e.count))+1);
          tipB:=1;
        ELSE
         v_titlu2 := lista_adjective(TRUNC(DBMS_RANDOM.VALUE(0,lista_adjective.count))+1);
          tipB:=2;
   END IF;
   
          IF(tipA!=2)THEN
          IF(tipB!=2)THEN
           IF LENGTH(v_titlu1 || ' si '|| v_titlu2) <= 25 THEN
             v_titlu_carte:=v_titlu1 || ' si '|| v_titlu2;
          END IF;
          else 
             v_titlu_carte:=v_titlu1;
          END IF;
          END IF;
          
          IF(tipA!=2)THEN
          IF(tipB!=1)THEN
           IF LENGTH(v_titlu1 || ' regele '|| v_titlu2||'ilor') <= 25 THEN
             v_titlu_carte:=v_titlu1 || ' regele '|| v_titlu2||'ilor';
          END IF;
          else 
             v_titlu_carte:=v_titlu1;
          END IF;
          END IF;
          
          IF(tipA!=1)THEN
          IF(tipB!=1)THEN
           IF LENGTH(v_titlu1 || ' cel '|| v_titlu2) <= 25 THEN
             v_titlu_carte:=v_titlu1 || ' cel '|| v_titlu2;
          END IF;
          else 
             v_titlu_carte:=v_titlu1;
          END IF;
          END IF;
          
          IF(tipA!=1)THEN
          IF(tipB!=2)THEN
           IF LENGTH(v_titlu1 || ' zis si '|| v_titlu2) <= 25 THEN
             v_titlu_carte:=v_titlu2 || ' zis si '|| v_titlu1;
          END IF;
          else 
             v_titlu_carte:=v_titlu1;
          END IF;
          END IF;
       
     --1470
       v_gen_carte:= lista_gen(TRUNC(DBMS_RANDOM.VALUE(0,lista_gen.count))+1);
        
         v_nr_totale := DBMS_RANDOM.VALUE(1,20);
          v_nr_disponibile := DBMS_RANDOM.VALUE(1,v_nr_totale);
      v_data_nastere := TO_DATE('01-01-1960','MM-DD-YYYY')+TRUNC(DBMS_RANDOM.VALUE(0,365))+TRUNC(DBMS_RANDOM.VALUE(0,40))*365;
      v_an_publicatie := TO_DATE('01-01-1960','MM-DD-YYYY')+TRUNC(DBMS_RANDOM.VALUE(0,365))+TRUNC(DBMS_RANDOM.VALUE(0,40))*365;
            
    insert into carti values(v_i2,(DBMS_RANDOM.VALUE(1,5000)), v_titlu_carte,  v_an_publicatie, v_gen_carte,v_nr_disponibile,v_nr_totale,DBMS_RANDOM.VALUE(10,500), sysdate, sysdate);
   END LOOP;
   DBMS_OUTPUT.PUT_LINE('Inserarea a 10000 carti... GATA !');
  
  -----------------------------
  ---------------------------
  ---------------------------- 
    --------------------------
  --------------------------
  -------------------------
  ---------------------------
    DBMS_OUTPUT.PUT_LINE('Inserarea a 10000 useri...');
   
   FOR v_i IN 1..10000 LOOP
      v_nume := lista_nume(TRUNC(DBMS_RANDOM.VALUE(0,lista_nume.count))+1);
      IF (DBMS_RANDOM.VALUE(0,100)<50) THEN     
      v_gen:='fata';
         v_prenume1 := lista_prenume_fete(TRUNC(DBMS_RANDOM.VALUE(0,lista_prenume_fete.count))+1);
         LOOP
            v_prenume2 := lista_prenume_fete(TRUNC(DBMS_RANDOM.VALUE(0,lista_prenume_fete.count))+1);
            exit when v_prenume1<>v_prenume2;
         END LOOP;
       ELSE
       v_gen:='baiat';
         v_prenume1 := lista_prenume_baieti(TRUNC(DBMS_RANDOM.VALUE(0,lista_prenume_baieti.count))+1);
         LOOP
            v_prenume2 := lista_prenume_baieti(TRUNC(DBMS_RANDOM.VALUE(0,lista_prenume_baieti.count))+1);
            exit when v_prenume1<>v_prenume2;
         END LOOP;       
       END IF;
       
       IF (DBMS_RANDOM.VALUE(0,100)<60) THEN  
          IF LENGTH(v_prenume1 || ' ' || v_prenume2) <= 20 THEN
            v_prenume := v_prenume1 || ' ' || v_prenume2;
          END IF;
          else 
             v_prenume:=v_prenume1;
        END IF;    
        
      v_oras := lista_address_oras(TRUNC(DBMS_RANDOM.VALUE(0,lista_address_oras.count))+1);
      v_strada := lista_address_strada(TRUNC(DBMS_RANDOM.VALUE(0,lista_address_strada.count))+1);
   
     
      v_phone:='07'||TRUNC(DBMS_RANDOM.VALUE(2,9))||TRUNC(DBMS_RANDOM.VALUE(1000000,9999999));
      v_address:='Oras: '||v_oras||', strada: '||v_strada|| ' nr: '||TRUNC(DBMS_RANDOM.VALUE(1,765));
      v_pass:=v_nume||TRUNC(DBMS_RANDOM.VALUE(0,40));
      v_username:=v_nume||TRUNC(DBMS_RANDOM.VALUE(0,40));
      v_data_nastere := TO_DATE('01-01-1960','MM-DD-YYYY')+TRUNC(DBMS_RANDOM.VALUE(0,365))+TRUNC(DBMS_RANDOM.VALUE(0,40))*365;
      v_temp:='';
      v_mail:=v_username||'@'||lista_address(TRUNC(DBMS_RANDOM.VALUE(0,lista_address.count))+1)||'.com';
                        
    insert into useri values(v_i,v_username,v_pass, v_nume, v_prenume, v_gen,v_phone,v_address,v_mail, sysdate, sysdate);
   END LOOP;
   DBMS_OUTPUT.PUT_LINE('Inserarea a 10000 useri... GATA !');
  -----------------------------------------
  ---------------------------
  -------------------
   DBMS_OUTPUT.PUT_LINE('Inserarea a 2000 imprumuturi...');
   
   FOR v_i IN 1..2000 LOOP
     
        
        
      v_data_tranzactie := TO_DATE('01-01-2019','MM-DD-YYYY')+TRUNC(DBMS_RANDOM.VALUE(0,365));
      v_data_limita := v_data_tranzactie + 30;

      v_temp:='';
                        
    insert into imprumuturi values(v_i,TRUNC(DBMS_RANDOM.VALUE(0,10000)+1), TRUNC(DBMS_RANDOM.VALUE(0,10000)+1), v_data_tranzactie, v_data_limita, sysdate, sysdate);
   END LOOP;
   DBMS_OUTPUT.PUT_LINE('Inserarea a 2000 imprumuturi... GATA !');
    
    
    ------------
    ----------
    ---------
    ----membership
     DBMS_OUTPUT.PUT_LINE('Inserarea a 600 membership...');
   
   FOR v_i IN 1..600 LOOP
     
        
        v_valoare_platita:=TRUNC(DBMS_RANDOM.VALUE(100,465));
      v_tip := TRUNC(DBMS_RANDOM.VALUE(0,3));
    
    
                        
    insert into membership values((DBMS_RANDOM.VALUE(0,10000)+1),v_valoare_platita,v_tip, sysdate, sysdate);
   END LOOP;
   DBMS_OUTPUT.PUT_LINE('Inserarea a 600 membership... GATA !');
   
   
   
   -------------------
   ---------------------
   ----tranzactii----
    DBMS_OUTPUT.PUT_LINE('Inserarea a 500 tranzactii...');
   
   FOR v_i IN 1..500 LOOP
     
        
      v_tip := TRUNC(DBMS_RANDOM.VALUE(0,3));
    
    
                        
    insert into tranzactii values(v_i,(DBMS_RANDOM.VALUE(0,10000)+1),(DBMS_RANDOM.VALUE(0,10000)+1),v_tip, sysdate, sysdate);
   END LOOP;
   DBMS_OUTPUT.PUT_LINE('Inserarea a 600 tranzactii... GATA !');
    
END;
/


select count(*)|| ' angajati inserati' from angajati;
select count(*)|| ' autori inserati' from autori;
select count(*)|| ' carti inserate' from carti;
select count(*)|| ' useri inserati' from useri;
select count(*)|| ' imprumuturi inserate' from imprumuturi;
select count(*)|| ' membership inserat' from membership;
select count(*)|| ' tranzactii inserate' from tranzactii;




/
CREATE TABLE membership (
  id_membership INT NOT NULL,
  valoare_platita INT NOT NULL,
  tip INT NOT NULL,
  created_at DATE,
  updated_at DATE,
  CONSTRAINT fk_membership_id_membership FOREIGN KEY (id_membership) REFERENCES useri(id_user)
  
)
/
CREATE TABLE tranzactii (
  id_tranzactie INT NOT NULL PRIMARY KEY,
  id_carte INT NOT NULL,
  id_cumparator INT NOT NULL,
  tip INT NOT NULL,
  created_at DATE,
  updated_at DATE,
  CONSTRAINT fk_tranzactii_id_carte FOREIGN KEY (id_carte) REFERENCES carti(id_carte),
  CONSTRAINT fk_tranzactii_id_cumparator FOREIGN KEY (id_cumparator) REFERENCES useri(id_user) 
)
/
CREATE TABLE imprumuturi (
  id_imprumut INT NOT NULL PRIMARY KEY,
  id_carte_i INT NOT NULL,
  id_datornic INT NOT NULL,
  data_tranzactie DATE NOT NULL,
  data_limita DATE NOT NULL,
  created_at DATE,
  updated_at DATE,  
 CONSTRAINT fk_imprumuturi_id_carte_i FOREIGN KEY (id_carte_i) REFERENCES carti(id_carte),
 CONSTRAINT fk_imprumuturi_id_datornic FOREIGN KEY (id_datornic) REFERENCES useri(id_user)
)
/
CREATE TABLE angajati (
  id_angajat INT NOT NULL PRIMARY KEY,
  nume VARCHAR2(15) NOT NULL,
  prenume VARCHAR2(30) NOT NULL,
  data_nastere DATE NOT NULL,
  salariu INT NOT NULL,
  created_at DATE,
  updated_at DATE
 
)
/



SET SERVEROUTPUT ON;

DECLARE
  TYPE varr IS VARRAY(210000) OF varchar2(1255);
   lista_adjective varr := varr('buc?laie','bucle','caudine','dulce','eficace','fiece','fierbinte','fitece','abandonat','abaxial','ab?tut','abdominal','aberant','aberativ','abil','abiotic','abisal','abject',
'ablativ','abnorm','aboli?ionist','abominabil','abordabil','abortiv','abracadabrant','abra?','abraziv','abreviat',
'abreviativ','abrogat','abrupt','abrutizant','abrutizat','abscons','absent','absenteist','absidial','absolut',
'absolutist','absolutoriu','absorbant','absorbit','absten?ionist','abstract','abstrac?ionist','abstrus','absurd','ab?iguit',
'abulic','abundent','aburit','aburos','abuziv','academic','acaju','acaloric','acatalectic','ac?t?rii',
'accelerat','accelerated','accentuat','acceptabil','accesibil','accesoriu','accidental','accidentat','acefal','acel',
'acela','acela?i','acerb','acest','acesta','acetic','acetilsalicilic','acherontic','achitat','achiu',
'aciclic','acid','acidificat','acidofil','acidulat','acinos','aclinic','acomodabil','acoperit','acordabil',
'acordat','acordic','acotiledonat','acreditat','acrescent','acrilic','acrit','acriu','acrobatic','acrocefal',
'acromat','acromatic','acronic','acru','acru?','actinic','actinometric','actinomorf','activ','activant',
'actoricesc','actual','aculeat','aculeiform','acumbet','acuminat','acurat','acustic','acut','acuzat',
'acvafortist','acvatic','ad-interim','adaptabil','adaptiv','ad?ugit','ad?ugit?','adânc','adâncat','adâncit',
'adâncos','adecvat','ademenit','adenoid','adept','aderent','adev?rat','adeziv','adiabatic','adiacent',
'adipic','adipos','aditiv','adi?ional','adi?ionat','adjectival','adjectivat','adjectivizat','adjunct','adjuvant',
'administrativ','admirabil','admirativ','admisibil','admonitiv','adnat','adnotat','adogmatic','adonic','adoptiv',
'adorabil','adorat','adormit','adpres','adrenergic','adult','adus','adventist','adventiv','adverbial',
'adverbializat','advers','adversativ','aerat','aeriform','amabil','amalgamat','amarnic','am?git','am?nunt',
'am?nun?it','am?rât','am?riu','am?rui','amânat','ambetant','ambiant','ambidextru','ambiental','ambiguizat',
'ambiguu','ambi?ios','ambivalent','ambliop','ambroziac','ambulant','ambulatoriu','ambuscat','ambuteiat','ameliorabil',
'ameliorant','ameliorativ','amenajabil','amenajat','amendabil','americ?nesc','amestecat','ametabol?','ametrop','ame?it',
'amfibiu','amfibologic','amfibrahic','amfiguric','amiabil','amical','amielinic','amigdaloid','amilaceu','amnezic',
'amniot','amnistiabil','amoniacal','amoral','amoralist','amorezat','amorf','amoros','amortibil','amortizabil',
'amor?it','amovibil','ampelografic','amplectiv','amplexicaul','amplu','amuzant','anabaptist','anabatic','anabolic',
'anaciclic','anacreontic','anacronic','anacronistic','anacruzic','anaerob','anaerobiotic','anafilactic','anaforic','anafrodiziac',
'anagliptic','anagogic','anagramatic','anahoretic','anal','analeptic','analfabet','analgeziant','analgezic','analitic',
'analizabil','analog','analogic','anamorfozat','anapestic','anaplastic','anarhic','anarhist','anastaltic','anastatic',
'anastigmat','anastigmatic','anastomotic','anastomozat','anatomic','anatomopatologic','ancestral','anchilozat','anclan?at','andaluz',
'andezitic','andosat','aneantizat','anecdotic','anecoid','anemiat','anemic','anemofil','anemometric','aneroid',
'anesteziant','anestezic','aneuploid','anevoios','anevrismal','anevrismatic','anex','anexat','anexionist','angajant',
'angajat','angelic','angelolatru','angiografic','angiologic','angiosperm','anglofil','anglofob','angoasant','angoasat',
'angolez','angrenat','angrosist','anhidru','aniconic','animal','animalic','animat','animist','anistoric',
'anizotrop','anodic','anomal','anonim','anorectic','anorganic','anormal','anost','anseriform','antagonic',
'antagonist','antalgic','antarctic','antebelic','antecalculat','antecedent','antenatal','antenup?ial','antepenultim','anteprogramat',
'bilateral','bildungsromanesc','bilingv','bilios','bilobat','bimensual','bimetalic','bimetalist','binecuvântat','bioacustic',
'bioastronautic','biobibliografic','biocenotic','biochimic','biocibernetic','biocinetic','bioclimatic','biocompatibil','biodegradabil','biodinamic',
'bioelectric','bioenergetic','biofizic','biogenetic','biogeochimic','biogeografic','biografic','biologic','biologizant','bioluminescent',
'biomatematic','biomedical','biometeorologic','bionic','biopsic','biosociologic','biospeologic','biostatistic','biostimulent','biotehnic',
'biotelemetric','biotic','bipartid','bipartit','biped','birefringent','birj?resc','birocratic','birocratizat','biruit',
'bis','bis?pt?mânal','bisect','bisericesc','bisericos','bisextil','bisexual','bisexuat','bisilabic','bisimetric',
'bistri?','bisulc','bituminos','biunivoc','biv','bivalent','bivalv','blagoslovit','blamabil','blamat',
'blazat','bl?nos','blând','blea?c?','bleg','blegit','blenoragic','bleojdit','bleot','blestemat',
'bleu','blindat','blond','bluzat','bobletic','boble?','bobo?it','bocciu','boem','bogasieresc',
'bogat','boghet','bogomilic','boieresc','boieros','boit','bolând','bolbo?at','boldit','bolnav',
'boln?vicios','bolometric','bolov?nit','bolov?nos','bol?evic','boltit','bombastic','bombat','bonapartist','bondoc',
'bondocel','bont','borât','borc?nat','bordo','boreal','boric','boricat','bornat','bor?it',
'bortelit','bortit','bor?os','bosniac','bosumflat','bo?orog','botanic','botezat','botos','botulinic',
'bo?it','bourel','bouresc','bracteal','bradicardic','brahial','brahicefal','brahmanic','bramburit','branhial',
'brav','br?cuit','br?zdat','brânzit','brânzos','breaz','brevetat','brevilocvent','briant','bric',
'britanic','brizant','brodat','bromhidric','bromic','bronhial','bronhic','bron?itic','bronzat','brosc?resc',
'bro?at','bro?tesc','brudiu','brudnic','bruiat','brumat','brumatic','brum?riu','brumos','brunat',
'brunet','brusc','brut','brutal','bubonic','bubos','buburos','bucal','buc?lai','buc?lat',
'buc?liu','buciardat','buclat','bucluca?','bucolic','bucuros','budist','buf','bufant','buged',
'buh?it','buhos','buiac','buiestra?','buiestru','buimac','buimatic','buim?cit','bulbiform','bulbos',
'bulbucat','buldozerist','bulg?resc','bulg?ros','bulimic','bulonat','bulversat','bunicel','bunu?','burduh?nos',
'burduhos','burdu?it','buretos','burghez','burgund','burlesc','burni?os','burticos','burtos','buruienos',
'burzuluit','busnat','busuioc','butac','butaforic','but??it','butilic','butiric','butuc?nos','butucos',
'buvabil','buzat','buz??el','buz?u','cabalistic','cablat','cabotinesc','cacofonic','cadastral','cadaveric',
'caden?at','cadrilat','caduc','cafard','cafeniu','cainic','cainozoic','calabrez','calamitat','calandrat',
'calcaros','calcic','calcicol','calcificat','calcifil','calcifug','calcinat','calcografiat','calcografic','calculabil',
'calculat','calculos','cald','caledonian?','caleidoscopic','calendaristic','calicesc','caliciform','calificabil','calificat',
'calificativ','caligrafic','calitativ','calm','calmant','calmat','calmuc','calmucesc','calofil','calofilic',
'calomnios','caloric','calorific','calorifug','calorimetric','calos','calp','calvinesc','calvinist','camaraderesc',
'cambial','cambrat','cameleonic','cameral','camerunez','camforat','camuflat','canalizabil','canalizat','canarisit',
'canceriform','cancerizat','cancerologic','canceros','candid','candriu','canelat','cangrenat','cangrenos','canibalic',
'caniculat','canonial','canonic','cantabil','cantitativ','cantonal','caolinos','capabil','capacitativ','capacitiv',
'capelat','cape?','capital','capitalist','capitalizabil','capitalizat','capitat','capitonat','capitos','capitulard',
'capiu','capot','capricios','capsat','capsulat','captabil','captat','captiv','captivant','captivat',
'caracterial','caracteristic','caracterizabil','caracterizant','caracterizat','caracterologic','caraghios','caragialesc','carbonic','carbonilic',
'carcinologic','cardanic','cardat','cardiac','cardinal','cardiografic','cardiotonic','cardiotoxic','carenal','carenat',
'carent','caren?ial','carfologic','cariat','caricatural','caricaturistic','carierist','caritabil','carminativ','carnal',
'carnat','carnavalesc','carosabil','carpatic','carpofag','carstic','cartaginez','cartelat','cartilaginos','cartist',
'cartografic','cartonat','casabil','casant','cascadoricesc','casnic','cast','castaniu','castrat','ca?ectic',
'ca?erat','cataclastic','cataleptic','catalitic','catamenial','cataral','catastrofal','catastrofic','categorematic','categorial',
'categoric','categorisit','cathartic','catifelat','catifeliu','catihetic','cationic','catodic','catolic','catolicizat',
'catonic','cauciucat','caudal','caulescent','caustic','causticizat','caustificat','cauzal','cauzalist','cauzativ',
'cav','cavaleresc','cavernicol','cavernos','cazual','cazuistic','c?l?resc','c?l?re?','c?l?torit','c?lâu',
'c?ldicel','c?lduros','c?ldu?','c?libil','c?lit','c?lug?resc','c?m??uit','c?m?t?resc','c?ngiuit','c?p?tuit',
'c?p??ânos','c?piat','c?pos','c?presc','c?priu','c?prui','c?puit','c?r?miziu','c?r?rat','c?rbunos',
'c?rnos','c?rp?nos','c?rtur?resc','c?runt','c?run?it','c?s?toresc','c?s?torit','c?scat','c?snicesc','c?t?nesc',
'c?tr?nit','c?utat','c?uz??esc','c?z?cesc','c?znit','c?zut','câinesc','câinos','câl?os','câmpenesc',
'câmpesc','cânepiu','cânt?rit','cârâit','cârc?lit','cârciog?resc','cârcota?','cârlion?at','cârmâziu','cârnu?',
'câ?','câ?tigat','ceadiriu','ceapist','ceapr?zuit','cebocefal','cecal','cefalalgic','cefalic','cefalometric',
'cefaloscopic','ceh','cehesc','cehoslovac','cel','cela','celebru','celest','celiac','celofanat',
'celomic','celt','celtic','celuit','celulozic','cementat','cementos','cenestezic','cenobitic','cenogenetic',
'centezimal','centigrad','central','centralist','centralizat','centrat','centrifug','centrifugal','centripet','centripetal',
'centrist','centum','centumviral','centuplu','centuriat','cenu?iu','cenzurabil','cenzurat','cepeleag','ceramic',
'cerat','cercat','cerc?nat','cercelat','cercetat','cercet??esc','cerchez','cerchezesc','cerebelos','cerebral',
'cerebroid','cerebrospinal','ceremonios','ceresc','cernit','cernut','ceros','cer?etoresc','cert','certat',
'cert?re?','ceruminos','cervical','cest','cet??enesc','cetonic','ce?os','ceva','cezaro-cr?iesc','chefliu',
'chefos','chel','chel?l?it','chelbos','chelicerat','chemat','chen?ruit','chenzinal','cheratinizat','cheratolitic',
'cherchelit','chiaburesc','chiasmatic','chibzuit','chihlimbariu','chimic','chimiosterilizat','chimioterapic','chinestezic','chinez',
'chinezesc','chinovial','chinuit','chiolh?nos','chiomp','chiorâ?','chipe?','chipos','chircit','chirilic',
'chirografic','chiromantic','chirurgical','chisnovat','chistic','chitc?it','chitinizat','chitinos','chitit','chituit',
'chiurluit','chivernisit','cianotic','cianozat','cibernetic','cibernetizat','cicatricial','cicatrizant','cicatrizat','ciclic',
'ciclist','cicloidal','ciclonal','ciclonic','ciclopic','ciclotimic','cicloturistic','cifotic','cifrat','cifric',
'ciliat','cilibiu','cilindric','cilindroid','cinchit','cincinal','cinegetic','cinematic','cinematografic','cinetic',
'cinic','cinstit','ciob?nesc','ciobit','ciocnit','ciocoiesc','ciocolatiu','ciolac','ciol?nos','cioturos',
'cipriot','circulant','comatos','combatant','combativ','combinabil','combinat','combinativ','comburant','combustibil',
'comemorabil','comemorativ','comensurabil','comerciabil','comercial','comestibil','comic','cominatoriu','cominutiv','comiserativ',
'comisoriu','comisural','comi?ial','comod','compact','compactibil','comparabil','comparat','comparativ','compartimental',
'compartimentat','compatibil','compensabil','compensat','compensativ','compensatoriu','competent','competitiv','competi?ional','complet',
'completat','complex','complexat','complexificat','complexual','complezent','compliant','complicat','component','componistic',
'comportamental','comportamentist','compostat','compozit','compozi?ional','comprehensibil','comprehensiv','compresibil','compresiv','comprimabil',
'comprimat','compromis','compromisoriu','compus','computerizat','comunal','comunicabil','comunicant','comunicativ','comunist',
'comutabil','comutativ','conabiu','cona?ional','concav','concentrat','concentric','conceptibil','conceptual','conceptualist',
'conceptualizat','concep?ional','concertant','concertistic','concesional','concesiv','concherant','conciclic','conciliant','concis',
'concludent','conclusiv','concoidal','concomitent','concordant','concordist','concrescent','concrescut','concret','concretizat',
'concupiscent','concurent','condamnabil','condensabil','condensat','condescendent','condimentat','condi?ional','condi?ionat','conductibil',
'conductiv','conduplicat','conectat','conectiv','conex','confec?ionat','confederat','confederativ','confesional','confesiv',
'confiat','confiden?ial','confient','configurat','configurativ','configura?ional','configura?ionist','confinat','confirmativ','confiscabil',
'conflagrant','conflictual','confluent','conform','conformat','confortabil','confortant','confr??esc','confucianist','confundabil',
'confuz','confuzionant','confuzionist','congelabil','congelant','congelat','congenital','congestionat','congestiv','congolez',
'congrega?ional','congruent','conic','conivent','conjectural','conjugabil','conjugal','conjugat','conjunctiv','conjunctival',
'conjunctural','conjuncturist','conjunc?ional','conoid','conoidal','conotativ','consacrant','consacrat','conscriptibil','consecutiv',
'consecvent','consemnabil','conservant','conservativ','considerabil','considerat','consimil','consistent','dodecafonist','dodecagonal',
'dodecasilab','dodecasilabic','doftoricesc','dogit','dogmatic','dogorit','doldora','dolihocefal','dolomitic','dolosiv',
'domenial','domestic','domesticit','dominant','domnesc','domol','donchihotesc','donjuanesc','doric','dornic',
'dorob?n?esc','dorsal','dorsoventral','dosit','dosnic','dospit','dotal','dotat','dozabil','draconic',
'drag','drajefiat','dramatic','drapat','drastic','dr?cesc','dr?cos','dr?g?la?','dr?g?stos','dr?gule?',
'dr?gulic','dr?guli??','dr?gu?','dreg?toresc','drept','dreptunghic','dres','dresat','druidic','dualist',
'dubios','dubit','dubitativ','dublat','dublu','ducal','duc?re?','ductil','dugli?','duhliu',
'duhovnicesc','duios','dulceag','dulcicol','dumesnic','duminical','dumnezeiesc','dungat','duodecimal','duodenal',
'dupuros','durabil','durativ','durd','durduliu','dureros','dus','du?m?nesc','du?m?nos','E',
'ebraic','ecarisat','ecarlat','echicurent','echidistant','echilateral','echilibrat','echilibrist','echinoc?ial','echipat',
'echipolent','echipoten?ial','echitabil','echivalent','echivoc','eclamptic','eclatant','eclectic','ecleziastic','ecliptic',
'ecografic','ecologic','ecometric','econom','econometric','economic','economicesc','economicos','ecosez','ecru',
'ectodermic','ectoparazit','ectopic','ecuatorial','ecumenic','ecvestru','eczematos','edafic','edenic','edentat',
'edictal','editorial','educabil','educat','educativ','educa?ional','edulcorant','edulcorat','efectiv','efectuat',
'efeminat','eferent','efervescent','eficient','efigial','eflorescent','efluent','efuziv','egal','egalabil',
'egalat','egalitarist','egocentric','egoist','egolatru','egotist','eidetic','elansat','elastic','eleat',
'eleatic','electiv','electoral','electric','electrificat','electrizabil','electrizant','electrizat','electroacustic','electrobiologic',
'electrocaloric','eruptiv','escamotabil','escatologic','eschimos','eseistic','esen?ial','esopic','esperantist','estetic',
'estetizant','estic','estimabil','estimativ','estimatoriu','estiv','estival','estompat','estradistic','estral',
'estropiat','e?antionat','etajat','etalonat','etan?','etapizat','etatizat','eterat','eteric','eternizat',
'eterodox','etic','etichetat','etilic','etimologic','etiologic','etirat','etnic','etnobotanic','etnocultural',
'etnofolcloric','etnografic','etnologic','etnopedagogic','etrusc','eudemonist','eufemistic','eufonic','euforic','euforizant',
'eufuistic','eugenezic','eugenic','euharistic','eupeptic','euribiont','euristic','euriterm','euritmic','europenesc',
'eutectic','evacuabil','evacuat','evadat','evaluabil','evaluat','evanescent','evanghelic','evaporabil','evazat',
'evaziv','evenimen?ial','eventual','evghenicos','evident','eviden?iat','evitabil','evlavios','evocabil','evocativ',
'evoluat','evolutiv','evolu?ionist','evreiesc','exacerbat','exact','exagerat','exaltat','exasperant','exasperat',
'excelent','excentric','excep?ional','excesiv','excipient','excitabil','excitant','excitat','exclamativ','exclus',
'exclusiv','exclusivist','execrabil','executabil','executant','executat','executiv','executoriu','exegetic','exhaustiv',
'exhibitoriu','exigent','exigibil','exilat','existent','existen?ial','existen?ialist','exoftalmic','exogam','exorbitant',
'exorcist','exortativ','exosferic','exoteric','exoterm','exotermic','exotic','expandat','expansibil','expansionist',
'expansiv','expatriat','expectorant','expeditiv','experimental','experimentat','expert','expertizat','expiabil','expletiv',
'explicabil','explicat','explicativ','explicit','exploatabil','exploatat','explorabil','explorat','explozibil','exploziv',
'exponen?ial','exportabil','expozant','expozitiv','expozi?ional','expres','expresionist','expresiv','exprimabil','exprimat',
'expropriat','expugnabil','exsanguu','exsudant','extatic','extaziat','extemporaneu','extensibil','extensiv','extenuant',
'extenuat','exteritorial','exterminant','festiv','festivist','festonat','fe?telit','fetal','fetesc','fetid',
'feti?ist','feti?izant','feudal','feudalizat','fezabil','fezandat','fiabil','fibrocartilaginos','fibrolemnos','fibromatos',
'fibros','fictiv','fideist','fidel','fiert','fiesc','figurat','figurativ','filamentos','filantropic',
'filarmonic','filat','filatelic','filde?iu','filetat','filial','filiform','filigranat','filipinez','filmic',
'filmologic','filogenetic','filologic','filotim','filozofic','filtrabil','filtrant','filtrat','final','finalist',
'finalizat','finic','finisat','finit','finlandez','finlandez?','fino-ugric','fioros','firav','firesc',
'firos','firoscos','fiscal','fisionabil','fistichiu','fistulos','fisurat','fitilist','fitobiologic','fitocenotic',
'fitocid','fitofag','fitofarmaceutic','fitogeografic','fitopatologic','fitotehnic','fitoterapic','fitotoxic','fix','fixabil',
'fixat','fixativ','fixist','fizic','fizicalist','fiziocratic','fiziognomonic','fiziologic','fizionomic','fiziopatologic',
'fizioterapic','flacid','flagrant','flamand','flamboaiant','flasc','flavescent','fl?mând','fl?mânzit','flecuit',
'flegmatic','flendurit','flenduros','fleo?','fle?c?it','fle?','flexibil','flexibilizat','flocos','floco?it',
'flogistic','floral','floribund','floricol','florid','floristic','floriu','flotabil','flotant','flu',
'fluctuant','fluent','fluid','fluidal','fluidic','fluidizat','fluorescent','fluorurat','flu?turatic','fluturatic',
'fluvial','fluviatil','fluviometric','focal','focometric','focos','foiletonistic','foios','folcloric','folcloristic',
'foliaceu','foliat','folk','folosit','fondant','fonematic','fonemic','fonetic','fonf','fonf?it',
'fonic','fonoabsorbant','fonografic','fonogramic','fonoizolant','fonologic','fonometric','forabil','forjabil','forjat',
'formal','formalist','format','gr?din?resc','gr?niceresc','gr?suliu','gr?su?','gr?un?os','great','greb?nos',
'grec','grecesc','greco-catolic','greco-oriental','grej','greoi','gresat','gre?it','gre?os','greu',
'greunatic','grevist','gri','grifat','grijnic','grijuliu','grimat','gripal','gripat','griv',
'grivei','grizat','grizonant','grizutos','groaznic','grob','grofesc','groggy','gropit','gros',
'grosu?','grotesc','grozav','grunduit','grunjos','grunzuros','grupat','guatemalez','gubav','gudronat',
'gulerat','gumat','gunoios','gunoit','guraliv','gure?','gurguiat','gurmand','gustativ','gustos',
'gu?at','gutos','gutural','guvernamental','guvernant','habitual','habotnic','habsburgic','hagiografic','hagiologic',
'haido?','haiducesc','haihui','hainit','haios','haiti?','halieutic','halofil','halofit?','haloid',
'halomorf','halucinant','halucinatoriu','hami?','hamitic','handbalistic','handicapat','hanseatic','haotic','harbuzesc',
'hardughit','harnic','ha?urat','havaiu','hazardat','hazliu','h?b?uc','h?mesit','h?mi?liu','h?r?zit',
'h?rnicel','h?rnicu?','h?rt?nit','h?r?uit','h?tm?nesc','hâd','hâit','hârâit','hârbare?','hârbuit',
'hârsit','hâtru','hebefrenic','heboid','hectic?','hectolitric','hectometric','hedonist','hedonistic','hegemonic',
'heliac','heliocentric','heliofil','heliofizioterapic','heliofob','heliografic','heliometric','heliotehnic','helioterapic','helioterm',
'heliotermic','heliotropic','helmintic','helofit','hematofag','hematologic','hematopoietic','hematuric','hemeralop','hemerologic',
'hemicriptofit','hemimetabol?','hemiplegic','hemofag','hemogenic','hemolitic','hemopatic','hemoptizic','hemoragic','hemoroidal',
'hemostatic','hemotrop','hepatic','hepatologic','heptaedric','heptagonal','heraldic','hercinic','hermafrodit','hermeneutic',
'herminat','herpetic','herul','heterociclic','heteroclit','heterodont','heterogam','heterometabol?','heteromorf','heteromorf',
'?aalenian','abductor','aborigen','abrudean','absorbitor','acadian','acaparator','accelerator','acheuleean','acicular',
'acoperitor','acotiledon','acreditar','acri?or','activator','acuzator','acvatubular','acvifer','acvilin','acvitanian',
'adamantin','ademenitor','adeveritor','adolescentin','adormitor','aduc?tor','aductor','adulator','adulmec?tor','adulter',
'adulterin','adun?tor','aerian','aerifer','alveolar','amar','amator','am?gitor','ambigen','ambulacrar',
'ameliorator','amenin??tor','american','amerindian','ame?itor','amfoter','amigdalian','amintitor','amplexiflor','amplificator',
'ancilar','andin','androgen','androgin','anemocor','anglican','anglo-saxon','anglofon','angloman','angular',
'anihilator','animalier','animator','aniversar','anodin','anofelogen','anovulator','antediluvian','antemeridian','biliar',
'bilunar','biman','bimilenar','bimolecular','bimotor','binar','binef?c?tor','binevoitor','binocular','biogen',
'biostimulator','bipolar','bireactor','birman','biruitor','bisecular','bistri?ean','bizantin','bizar','blagian',
'blajin','blasfemator','bleumarin','blondin','boac?n','bocitor','bolivian','boln?vior','bo?iman','boto??nean',
'bourean','bovin','bozafer','brahman','bra?ovean','brazilian','br?ilean','brâncu?ian','breton','briliantin',
'brun','bubuitor','bucium?tor','bucovinean','bucure?tean','bufon','bugetar','bugetivor','bulbar','bulbifer',
'bulevardier','bulgar','bun','buni?or','bursier','buzoian','byronian','cabalin','caciur','cadmifer',
'calcifer','caldeean','calibror','calin','calomniator','calorifer','calorigen','calvin','cambodgian','cambrian',
'canadian','canalicular','canalizator','canar','cancanier','cancerigen','canicular','canin','capilar','capitolin',
'caprin','capsular','capsulifer','capucin','caracterizator','caragialian','carbonier','carbonifer','carcinogen','cardiovascular',
'carnasier','carnian','carnivor','carolingian','carosier','carotidian','carpatin','carpian','cartezian','catalan',
'catifelin','caucazian','caudifer','cauzator','cavalin','cavicorn','cavitar','cazon','c?l?r??ean','c?l?tor',
'c?l?uzitor','c?ldi?or','c?linescian','c???r?tor','c?z?tor','câmpean','câmpinean','cânt?tor','cârâitor','cârn',
'cârp?citor','cârtitor','câ?tig?tor','ceacâr','cefalorahidian','cehovian','celuitor','celular','cenomanian','centralizator',
'cenzitar','cercet?tor','cerealier','cerebelar','cerifer','cervin','cetogen','cezarian','cheltuitor','chem?tor',
'chiabur','chiar','chilian','chilifer','chinuitor','chior','chirografar','christadelfian','cic?litor','ciclamen',
'ciliar','cincar','circular','circulator','combinator','comp?timitor','compensator','complementar','complinitor','compresor',
'compromi??tor','comun','comunitar','concentra?ionar','conciliator','concordatar','concretizator','concre?ionar','condimentar','conduc?tor',
'conductor','conector','congener','conidian','conlocuitor','consangvin','consângean','conservator','dogoritor','doinitor',
'dojenitor','doljean','dolofan','domiciliar','dominator','dominican','domnitor','dorian','doritor','dostoievskian',
'doveditor','dravidian','dreptunghiular','dulci?or','dumbr?vean','dun?rean','duplicitar','dur','du?man','ebenin',
'echigranular','echiscalar','echiunghiular','echiunitar','ecuadorian','edificator','edilitar','educator','efemer','egalitar',
'egalizator','egeean','egiptean','ejaculator','esofagian','eston','estonian','etern','eterogen','etiopian',
'euclidian','euribar','eurihalin','european','evocator','examinator','excedentar','excitator','excretor','executor',
'exemplar','exocrin','exogen','expeditor','expedi?ionar','expiator','expirator','explicator','exploatator','exportator',
'extensor','exterior','festivalier','fe?telitor','fetomatern','fibrilar','fiduciar','fierbincior','fin','financiar',
'fitogen','fitopatogen','fitosanitar','flagelator','flexionar','flor','florean','florentin','florifer','fluier?tor',
'flutur?tor','foc??nean','folicular','folositor','fonator','fondator','forestier','forfetar','forfotitor','gr?itor',
'gr?san','gr?sun','greco-r?s?ritean','greco-roman','gregar','gregorian','grijitor','grobian','groh?itor','groscior',
'grosier','grosolan','hain','halogen','halucinogen','hapsân','harghitean','ha?egan','havan','hârâitor',
'hârbar','hebdomadar','hegelian','heliomarin','hematogen','hemicristalin','hepatogen','heptemimer','herculean','herniar',
'hertzian','heterofon','heteromer');
  
 lista_substantive_e varr := varr('Abagerie','Abandonare','Abate','Abatere','Aba?ie','Abazie','Abdicare','Abduc?ie','Abera?ie','Abietacee',
'Abietinee','Abilitare','Abilitate','Abiologie','Abiotrofie','Abita?ie','Abjec?ie','Abjudecare','Abjurare','Ablactare',
'Ablacta?ie','Abla?iune','Ablefarie','Ablepsie','Ablu?iune','Abnegare','Abnega?ie','Abnormitate','Abolire','Aboli?iune',
'Abonare','Abordare','Abrahiocefalie','Abrazare','Abraziune','Abrevia?ie','Abreviere','Abrogare','Abroga?ie','Abrutizare',
'Abscizie','Absciziune','Absolutizare','Absolu?iune','Absolvire','Absorbire','Absorb?ie','Absten?iune','Abstractizare','Abstrac?ie',
'Abstragere','Absurditate','Ab?iguire','Ab?inere','Abulie','Aburire','Academie','Acalmie','Acantacee','Acaparare',
'Acaparatoare','Acarologie','Acatafazie','Acatagrafie','Acatalepsie','Accedere','Accelerare','Accelera?ie','Accentuare','Acceptare',
'Accep?ie','Accesibilitate','Accesiune','Accidentare','Acciden?e','Acefalie','Aceracee','Acetificare','Acetilare','Acetonemie',
'Acetonurie','Achiesare','Achilie','Achinezie','Achitare','Achizitoare','Achizi?ie','Achizi?ionare','Acianopsie','Acidificare',
'Acidimetrie','Aciditate','Acidulare','Acioaie','Aciuare','Aclamare','Aclama?ie','Aclimatare','Aclimatizare','Acnee',
'Acolie','Acomodare','Acompaniatoare','Acondroplazie','Acontare','Acoperire','Acoperitoare','Acordare','Acorie','Acostare',
'Acotiledonate','Acreditare','Acribie','Acribologie','Acrime','Acrimonie','Acrinie','Acrire','Acroba?ie','Acrocefalie',
'Acrofobie','Acromanie','Acromatopsie','Acromegalie','Acromicrie','Acromie','Acroparestezie','Acro?are','Actinide','Actinie',
'Actinobiologie','Actinografie','Actinometrie','Actinomicete','Actinoterapie','Activare','Activitate','Activizare','Actorie','Actualitate',
'Actualizare','Ac?ionare','Ac?iune','Acuitate','Acultura?ie','Acumetrie','Acumulare','Acuplare','Acurate?e','Acuzare',
'Acuzatoare','Acuza?ie','Acvaforte','Acvaplanare','Acvariofilie','Aerografie','Aerologie','Aerometrie','Aerosoloterapie','Aerosta?ie',
'Aerotaxa?ie','Aeroterapie','Aerotopografie','Afabilitate','Afabula?ie','Afacere','Afagie','Afazie','Afânare','Afectare',
'Afectivitate','Afec?iune','Aferenta?ie','Afilia?ie','Afiliere','Afinare','Afinitate','Afirmare','Afirma?ie','Afi?are',
'Afi?oare','Aflare','Aflic?iune','Afluire','Afonie','Afonizare','Afretare','Africanitate','Africanologie','Afrontare',
'Aftershave','Afumare','Afum?toare','Afum?torie','Afunzime','Afurcare','Afurisenie','Agalactie','Agaricacee','Agasare',
'Ag??are','Ag???toare','Agenezie','Agen?ie','Agerime','Aghesmuire','Agie','Agitare','Agitatoare','Agita?ie',
'Aglomerare','Aglomera?ie','Aglosie','Aglutinare','Agna?iune','Agnozie','Agonale','Agonie','Agonisire','Agorafobie',
'Agrafie','Antecalculare','Antecalcula?ie','Antecesoare','Antem?sur?toare','Anteridie','Anterioritate','Antevorbitoare','Antibioterapie','Anticalofilie',
'Antic?rie','Antichitate','Anticipare','Anticipatoare','Anticipa?ie','Antifonie','Antilogie','Antilope','Antimaterie','Antim?lurire',
'Antinomie','Antipatie','Antipoezie','Antipoluare','Antisepsie','Badijonare','Badinerie','Bagatelizare','Bagdadie','Baie',
'Balansare','Balastare','Balcanologie','Bale','Balie','Balizare','Balneologie','Balneoterapie','Balonare','Balotare',
'Banalitate','Banalizare','Bandajare','Bantustanizare','Barabuli?te','Barbarie','Barbotare','B?lo?ire','B?nie','B?nuire',
'B?r??ie','B?rb?rie','B?rb??ie','B?rbie','B?rbierie','B?rduire','B?snire','B??c?lie','B??icare','B?taie',
'B?t?lie','B?t?toare','B?teli?te','B?trâne?e','B?trânime','B?utoare','Bâjbâire','Bântuire','Bârcoace','Bârfire',
'Bârfitoare','Bâzâitoare','Bâzdâganie','Beatificare','Beatitudine','Bebe','Becerie','Bechie','Becisnicie','Begonie',
'Behehe','Beldie','Bele-arte','Belvedere','Blan?are','Blan?iruire','Blasfematoare','Blasfemie','Blazare','Bl?n?rie',
'Blânde?e','Blenoragie','Bleojdire','Blestem??ie','Blindare','Blinie','Blocare','Boare','Bobinare','Bobinatoare',
'Bobotaie','Bocire','Bocitoare','Bodog?nire','Bogasierie','Bog??ie','Boiangerie','Boicotare','Boierie','Boierime',
'Boi?te','Bolborosire','Boli?te','Bombardare','Bombare','Bomb?nire','Cebare','Cebocefalie','Cece','Cecidie',
'Cecitate','Cecografie','Cedare','Cefalalgie','Cefalee','Cefalografie','Cefalometrie','Cefaloscopie','Cefalotomie','Cefalotorace',
'Celebrare','Celebratoare','Celebra?ie','Celebritate','Celeritate','Celioscopie','Celiotomie','Celofanare','Celuitoare','Cementare',
'Cementa?ie','Cenestezie','Centralizare','Centraliza?ie','Centrare','Centrifugare','Centruire','Centurie','Cenzurare','Cepuire',
'Cerb?rie','Cerbice','Cerbicie','Cercare','Cerc?toare','Cercetare','Cercet??ie','Cercet?toare','Cercuire','Chiulangie',
'Chiuretare','Chivernisire','Cianhidrizare','Cianizare','Cianoficee','Cianopsie','Cianotipie','Cianurare','Cibernetizare','Cicadee',
'Cicatrice','Cicatrizare','Cic?lire','Cicerone','Ciclare','Ciclicitate','Ciclocefalie','Ciclopie','Ciclotimie','Cicoare',
'Cifrare','Cilindrare','Cilindree','Cilindricitate','Cilindrurie','Cimentare','Cimotie','Cincime','Cine-verite','Cineamatoare',
'Cineanima?ie','Cinefilie','Cinematografie','Cinematografiere','Cineradiografie','Cing?toare','Cinste','Cinstire','Ciob?nie','Comedie',
'Comemorare','Comemora?ie','Comenduire','Comensurabilitate','Comentare','Comentatoare','Comercializare','Comic?rie','Comicitate','Cominu?ie',
'Comisie','Comisoaie','Comite','Comitere','Comizera?ie','Comoditate','Como?tenitoare','Como?ie','Compacitate','Compactare',
'Compactibilitate','Compactitate','Compactizare','Companie','Comparare','Compara?ie','Compartimentare','Compasiune','Compatibilitate','Comp?timire',
'Compendiatoare','Compensare','Compensa?ie','Competitivitate','Competitoare','Competi?ie','Compilare','Compilatoare','Compila?ie','Compl?cere',
'Complementaritate','Completare','Completitudine','Completivitate','Complexificare','Complexitate','Complexiune','Complicare','Complica?ie','Complice',
'Complicitate','Complimentare','Complinire','Componente','Comportare','Compostare','Compoundare','Compozee','Compozite','Compozitoare',
'Compozi?ie','Comprehensibilitate','Comprehensiune','Compresibilitate','Compresiune','Comprimare','Compromitere','Compulsare','Compunere','Computerizare',
'Comunicabilitate','Comunicare','Comunicativitate','Comunica?ie','Comunitate','Comuniune','Comutare','Comutativitate','Comutatoare','Comuta?ie',
'Convolu?ie','Convorbire','Convulsie','Convulsioterapie','Cooperare','Cooperativizare','Cooperatoare','Coopera?ie','Cooptare','Coordonare',
'Coordonatoare','Copaie','Coparticipare','Coparticipa?ie','Copastie','Copertare','Copie','Copiere','Copil?rie','Cople?ire',
'Copolimerizare','Coporâie','Coposesiune','Copre?edinte','Coproduc?ie','Coprofagie','Coprofilie','Coprolalie','Coprologie','Coproprietate',
'Coproscopie','Coprostazie','Copula?ie','Corabie','Coraziune','Cor?biele','Cor?bierie','Corcire','Cordialitate','Corealitate',
'Corectare','Corectazie','Corectitudine','Corectoare','Corectopie','Corec?ie','Coree','Coregizoare','Coregrafie','Corelativitate',
'Corela?ie','Corepetitoare','Corepeti?ie','Corifee','Corijare','Damaschinare','Damblagie','Damblagire','Damnare','Damna?iune',
'Danie','Dansatoare','Dantelare','Dantel?rie','Dantologie','Danturare','Dare','Darie','Datare','Datorie',
'D?inuire','D?ltuire','D?ltuitoare','D?n?naie','D?nd?naie','D?ng?nire','D?n?uire','D?n?uitoare','D?r?cire','D?r?citoare',
'D?r?p?nare','D?râmare','D?râm?toare','D?rnicie','D?ruire','D?ruitoare','D?sc?lie','D?sc?lime','D?sc?lire','D?ulare',
'Dârzenie','Dârzie','Deambula?ie','Debarasare','Debarasoare','Debarcare','Debavurare','Debilitare','Debilitate','Debitare',
'Debitoare','Debleiere','Deblocare','Debordare','Debreiere','Deburare','Deburbare','Debusolare','Debu?are','Debye',
'Decafeinizare','Decalare','Decalcare','Decalcifiere','Decalcomanie','Decalibrare','Decalva?ie','Decantare','Decanta?ie','Decapare',
'Decapitare','Decapita?ie','Decapotare','Decapsulare','Decapsula?ie','Decarburare','Decarbura?ie','Decatare','Decavare','Dec?dere',
'Dec?lire','Decelare','Decelera?ie','Decembrie','Decep?ie','Decerebrare','Decernare','Decimare','Decima?ie','Decizie',
'Declamare','Declama?ie','Declan?are','Declarare','Declara?ie','Declasare','Declimatare','Declinare','Declina?ie','Declivitate',
'Declorizare','Decoc?ie','Decodare','Decodificare','Decofrare','Decolare','Decoletare','Decolmatare','Decolonizare','Decolorare',
'Decomandare','Decompensare','Decompensa?ie','Decompozi?ie','Decompresiune','Decomprimare','Deconectare','Decongelare','Decongela?ie','Deconsiliere',
'Deconsolidare','Deconspirare','Decontaminare','Decontare','Decontractare','Decopertare','Decorare','Decorativitate','Decoratoare','Decora?ie',
'Decoromanie','Decorticare','Decortica?ie','Decrepitare','Decrepitudine','Decretare','Decriptare','Decrispare','Decromare','Decro?are',
'Decupare','Decuplare','Decurie','Decusa?ie','Decuscutare','Dedenti?ie','Dedicare','Dedica?ie','Dedublare','Deducere',
'Deduc?ie','Defalcare','Defavorizare','Defazare','Def?imare','Defecare','Defeca?ie','Defectare','Defectologie','Defectoscopie',
'Defectuozitate','Defec?iune','Defeminizare','Deferire','Deferizare','Defertilizare','Defeti?izare','Defibrare','Dezinfestare','Dezinflamare',
'Dezinformare','Dezinhibare','Dezinhibi?ie','Dezinsectizare','Dezinsec?ie','Dezintegrare','Dezinteresare','Dezintoxicare','Dezintoxica?ie','Deziotacizare',
'Dezl?n?uire','Dezlânare','Dezlegare','Dezleg?toare','Dezlipire','Dezm??are','Dezmembrare','Dezmeticire','Dezmierdare','Dezmin?ire',
'Dezmiri?tire','Dezmor?ire','Dezmo?tenire','Dezna?ionalizare','Dezn?d?jduire','Dezn?dejde','Deznisipare','Deznodare','Dezobi?nuire','Dezodorizare',
'Dezolare','Dezongulare','Dezonoare','Dezordine','Dezorganizare','Dezorganizatoare','Dezorientare','Dezosare','Dezoxidare','Dezr?d?cinare',
'Dezr?sucire','Dezrobire','Dezumanizare','Dezumflare','Dezunire','Dezv?luire','Dezvelire','Dezvergare','Dezvinov??ire','Dezvinuire',
'Dezvirginare','Dezvoltare','Diaconie','Diacronie','Diafonie','Diafotie','Diafragmare','Diagnosticare','Dialectologie','Dialogare',
'Diamanticale','Diaree','Diatermie','Diatomee','Dib?cie','Dibuire','Dicasterie','Dichisire','Dictare','Dic?iune',
'Didahie','Diferen?iere','Dificultate','Diformitate','Difrac?ie','Difterie','Diftongare','Difuzare','Difuzibilitate','Difuziune',
'Droaie','Drogare','Drogherie','Drojdie','Dromofobie','Dromomanie','Dropie','Drume?ie','Drupacee','Dualitate',
'Dubire','Dublare','Duble','Duce','Ducere','Ductilitate','Duduie','Dughie','Duhoare','Duio?ie',
'Dulce','Dulceg?rie','Dulcinee','Dulgherie','Dulie','Dumerire','Dumnezeie','Dumnezeire','Dun?re','Duplicitate',
'Durabilitate','Durare','Durere','Durificare','Duritate','Duruire','Du?m?nie','Ebenisterie','Ebo?are','Ebrietate',
'Ebulioscopie','Ebuli?ie','Ecarisare','Ecarte','Eche','Echilibrare','Echipare','Echiparti?ie','Echitate','Echita?ie',
'Echivalare','Echivocitate','Eclampsie','Eclipsare','Ecloziune','Ecluzare','Ecoencefalografie','Ecografie','Ecolalie','Ecoloca?ie',
'Ecologie','Ecometrie','Ecomimie','Econometrie','Economicitate','Economie','Economisire','Ecopraxie','Ecoscopie','Ecospecie',
'Ecostabilitate','Ecranare','Ecranizare','Ectazie','Ectenie','Ectopie','Ecua?ie','Ecvisetacee','Edificare','Edilitate',
'Editare','Editoare','Edi?ie','Educabilitate','Educare','Educatoare','Educa?ie','Efebie','Efectuare','Efemerizare',
'Efemina?ie','Eficacitate','Efigie','Eforie','Efractoare','Efrac?ie','Efuziune','Egalare','Egalitate','Egalizare',
'Egiptologie','Egolatrie','Egrenare','Egumenie','Egutare','Ejaculare','Ejacula?ie','Ejec?ie','Elaborare','Elagare',
'Elansare','Elasticitate','Eleagnacee','Electivitate','Electoare','Electricitate','Electrificare','Electrizare','Electroanestezie','Electroaprindere',
'Electrobiologie','Electrocapilaritate','Electrocardiografie','Electrocardioscopie','Electrocauterizare','Electrochimie','Electrochirurgie','Electrocoagulare','Electrocomunica?ie','Electroconcentrare',
'Electroconductibilitate','Electrocorticografie','Electrocutare','Electroencefalografie','Electrofiziologie','Electrofizioterapie','Electrofotografie','Electroglotospectrografie','Electrografie','Electrogravimetrie',
'Electromecanoterapie','Electrometalurgie','Electrometrie','Electromiografie','Electronaviga?ie','Electronegativitate','Electronizare','Electronografie','Electronomicroscopie','Electropatologie',
'Electropozitivitate','Electroprelucrare','Electroscopie','Electrosecuritate','Electrostimulare','Electrostric?iune','Electroterapie','Electrotermie','Electrotipie','Electrotomie',
'Elec?iune','Elegie','Elementaritate','Eleuterie','Eleva?ie','Eliberare','Elice','Extraneitate','Extrapolare','Extrapola?ie',
'Extrateritorialitate','Extravazare','Extr?dare','Extremitate','Extrofie','Extrospec?ie','Extrudare','Extruziune','Exulcera?ie','Exultare',
'Exulta?ie','Ezitare','Factorizare','Facturare','Fac?iune','Facultate','Fagacee','Fagure','Faian?are','Faian?atoare',
'Falce','Falie','Faliere','Falsificare','Falsificatoare','Falsitate','Familiaritate','Familiarizare','Familie','Fandare',
'Fandosire','Fantazare','Fante','Fantezie','Faradizare','Fardare','Farfur?rie','Farfurie','Faringe','Faringoscopie',
'Farmacie','Farmacodinamie','Farmacologie','Farmacopee','Farmacoterapie','Farmazonie','Farniente','Farsoare','Fascie','Fascinare',
'Fascina?ie','Fascizare','Fasole','Fasolire','Fasonare','Fasonatoare','Fatalitate','Fatigabilitate','Fatuitate','Fa?etare',
'Faultare','Favoare','Favorizare','Fazanerie','F?c?luire','F?c?toare','F?clie','F?inare','F?litoare','F?lnicie',
'F?lo?ie','F?l?uire','F?l?uitoare','F?ptuire','F?ptuitoare','F?r?delege','F?râmare','F?râmele','F?râmi?are','F?tare',
'F?t?toare','F???rie','F???rnicie','F??uire','F??uitoare','F?ur?rie','F?urire','F?uri?te','F?uritoare','Fâlfâire',
'Fân?rie','Fârnâire','Fâsâire','Fâstâcire','Fâ?âire','Fâ?ie','Feble?e','Febricitate','Febrilitate','Februarie',
'Feciorenie','Feciorie','Fecundare','Fecunda?ie','Fecunditate','Federalizare','Federa?ie','Fiere','Figurare','Figura?ie',
'Fiin?are','Filantropie','Filare','Filatelie','Filatoare','File','Filetare','Filia?ie','Filigranare','Filigranologie',
'Filioque','Filmare','Filmografie','Filmologie','Filogenie','Filologie','Filonichie','Filotimie','Filozofare','Filozofie',
'Filtrare','Filtra?ie','Finalitate','Finalizare','Finan?are','Finan?atoare','Finan?e','Fine','Fine?e','Finisare',
'Finisoare','Fire','Fiscalitate','Fisibilitate','Fisionare','Fisiune','Fisurare','Fitobiologie','Fitochimie','Fitofarmacie',
'Fitofiziologie','Fitogeografie','Fitopatologie','Fitotehnie','Fitoterapie','Fi?e','Fixare','Fixitate','Fiziocra?ie','Fiziognomonie',
'Fiziologie','Fizionomie','Fiziopatologie','Fizioterapie','Flagelare','Flagela?ie','Flambare','Flancare','Flatare','Flaterie',
'Fl?c?ime','Fl?c?raie','Fl?c?rie','Fl?c?ruie','Fl?mânzare','Fl?mânzire','Flebologie','Flebotomie','Flec?rie','Flegmazie',
'Fle?c?raie','Flexibilitate','Flexibilizare','Flexiune','Floare','Floco?ire','Flor?rie','Floricultoare','Florinte','Flotabilitate',
'Flotare','Flota?ie','Fluctuare','Fluctua?ie','Fluidificare','Fluiditate','Fluidizare','Fluier?toare','Fluorizare','Fluorografie',
'Fluturare','Fluture','Galanterie','Galantonie','Galaxie','Galerie','Galinacee','Galofobie','Galomanie','Galopare',
'Galo?are','Galvanizare','Galvanocauterizare','Galvanoplastie','Galvanostegie','Galvanostereotipie','Galvanoterapie','Galvanotipie','Garantare','Garan?ie',
'Garare','Gardenie','Garnisire','Gastralgie','Gastrectomie','Gastroenterologie','Gastronomie','Gastroscopie','Gastrotomie','Gastrula?ie',
'Gazare','Gazet?rie','Gazificare','Gazonare','G?bjire','G?buire','G?in?rie','G?it?n?rie','G?l?gie','G?lbinare',
'G?m?lie','G?oace','G?sire','G?sitoare','G?tire','G?urice','G?urire','G?z?rie','G?zdoaie','G?zduire',
'Gâde','Gâdilare','Gâfâire','Gâgâire','Gâgâlice','Gâlcevire','Gâlcevitoare','Gâlgâire','Gândire','Gânditoare',
'Gânganie','Gâng?vie','Gâng?vire','Gângurire','Gâtuire','Geamba?ie','Geamie','Geamparale','Gelatinizare','Gela?ie',
'Gelificare','Geliva?ie','Gelivitate','Gelozie','Geluire','Gem?nare','Gemina?ie','Genealogie','Generalitate','Generalizare',
'Generare','Generatoare','Genera?ie','Genere','Generozitate','Genialitate','Gentile?e','Gen?ianacee','Genuflexiune','Genune',
'Globalitate','Globire','Glod?raie','Glod?rie','Glodire','Glorie','Glorificare','Glosare','Glosatoare','Glosolalie',
'Glucometrie','Gnoseologie','Gnozie','Godie','Godiere','Gofrare','Gogire','Gogleze','Gogom?nie','Gol?nie',
'Gol?nime','Gol?tate','Goliciune','Golire','Gondolare','Gonflare','Goniometrie','Gonire','Gonitoare','Gonoree',
'Goruni?te','Gospod?rie','Gospod?rire','Gradare','Grada?ie','Grafie','Grafitizare','Grafologie','Grafomanie','Gramaticalizare',
'Graminee','Grandiozitate','Grandoare','Grandomanie','Granitizare','Granulare','Granula?ie','Granulie','Granulometrie','Granulozitate',
'Graseiere','Gratie','Gratificare','Gratifica?ie','Gratinare','Gratitudine','Gratuitate','Gratulare','Gratula?ie','Gra?ie',
'Gra?iere','Gra?iozitate','Gravare','Grave','Gravidie','Graviditate','Gravimetrie','Gravitate','Gravita?ie','Gr?bire',
'Gr?din?rie','Gr?di?te','Gr?m?dire','Gr?m?juie','Gr?m?ticie','Gr?pare','Gr?sime','Gr?unte','Greare','Greblare',
'Grecizare','Grecomanie','Grefare','Greime','Gresare','Gresie','Greutate','Grevare','Grifare','Grijanie',
'Grimare','Gripare','Grizare','Grizumetrie','Grofoaie','Groh?ire','Grosime','Grosol?nie','Groz?venie','Groz?vie',
'Groz?vire','Gruie','Grunduire','Grupare','Gubernie','Gudronare','Guinee','Gui?are','Gulie','Gumare',
'Gunoire','Gunoi?te','Gurluire','Gustare','Gust?toare','Guta?ie','Gutuie','Guvernare','Half-time','Halocromie',
'Halogenare','Halterofilie','Halucina?ie','Hamsie','Handicapare','Haploidie','Haplologie','Harabagie','Harabaie','Harbuz?rie',
'Hardughie','Hardware','Harna?are','Harpie','Ha?e','Ha?urare','Hatie','Havare','Hazardare','H?cuire',
'H?in?rie','H?ire','H?l?laie','H?mur?rie','H?r?zire','H?rh?laie','H?rm?laie','Hâdo?enie','Hârâitoare','Hâr?âire',
'Hâr?ie','Hârtie','Hâzenie','Hebefrenie','Hebelogie','Hebetudine','Hectizie','Hegemonie','Helcologie','Helge',
'Heliocromie','Heliofobie','Heliografie','Heliolitografie','Helioplastie','Helioterapie','Heliotermie','Heliotipie','Heliozincografie','Helmintologie',
'Hematie','Hematimetrie','Hematodermie','Hematofagie','Hematofobie','Hematologie','Hematometrie','Hematoscopie','Hematospectroscopie','Hematospermie',
'Hematoterapie','Hematurie','Hemeralopie','Hemerologie','Hemialgie','Hemianestezie','Hemianopsie','Hemiatrofie','Hemicranie','Hemifonie',
'Hemimelie','Hemiopie','Hemiparestezie','Hemiplegie','Hemofilie','Hemogenie','Hemoglobinemie','Hemoglobinometrie','Hemoglobinopatie','Hemoglobinurie',
'Hidrochimie','Hidrocorie','Hidrocu?ie','Hidroenergie','Hidrofilie','Hidrofilizare','Hidrofinare','Hidrofobie','Hidroftalmie','Hidrofugare',
'Hidrogenare','Hidrogeologie','Hidrografie','Hidroizolare','Hidrologie','Hidromanie','Hidromecanizare','Hidrometalurgie','Hidrometeorologie','Hidrometrie',
'Hidronimie','Hidropatie','Hidropizie','Hidroplanare','Hidroree','Hidrosonicitate','Hidroterapie','Hidrotermoterapie','Hidrotimetrie','Hidrotipie',
'Higrologie','Higrometrie','Higroscopicitate','Higroscopie','Hiperaciditate','Hiperacuzie','Hiperalgezie','Hiperalgie','Hiperbolizare','Hiperboree',
'Hipercalcemie','Hipercaracterizare','Hiperchinezie','Hiperclorhidrie','Hipercorectitudine','Hiperemie','Hiperemotivitate','Hiperestezie','Hiperexcitabilitate','Hiperfoliculinie',
'Hiperfunc?ie','Hiperglicemie','Hipermenoree','Hipermetropie','Hipermnezie','Hiperosmie','Hiperplazie','Hiperprosexie','Hiperproteinemie','Hipersecre?ie',
'Hipersensibilitate','Hipersensibilizare','Hipersomnie','Hipersustenta?ie','Hipertensiune','Hipertermie','Hipertimie','Hipertiroidie','Hipertonie','Iert?ciune',
'Iesle','Ie?ire','Igienizare','Ignifugare','Igni?ie','Ignominie','Ignorare','Igrasie','Ihtiofagie','Ihtiografie',
'Ihtiologie','Ihtiopatologie','Ilaritate','Ilegalitate','Ilegalizare','Ilegitimitate','Ileostomie','Ilicitate','Ilizibilitate','Ilogicitate',
'Iluminare','Ilumina?ie','Ilustrare','Ilustratoare','Ilustra?ie','Iluviere','Iluzie','Iluzionare','Imaginare','Imagina?ie',
'Imagine','Imagologie','Imaterialitate','Imaterializare','Imaturitate','Imbecilitate','Imbecilizare','Imbibi?ie','Imbloca?ie','Imbrica?ie',
'Imediate?e','Imensitate','Imergere','Imersare','Imersiune','Imigrare','Imigra?ie','Imiscibilitate','Imisiune','Imitare',
'Imitatoare','Imita?ie','Imixtiune','Imobilitate','Imobilizare','Imoralitate','Imortalizare','Impacientare','Impactare','Impalpabilitate',
'Impaludare','Imparicopitate','Imparitate','Impar?ialitate','Impasibilitate','Impecabilitate','Impenetrabilitate','Imperceptibilitate','Imperfec?iune','Imperfora?ie',
'Infiltra?ie','Infinitate','Infirmare','Infirmerie','Infirmitate','Inflamabilitate','Inflamare','Inflama?ie','Infla?ie','Inflexibilitate',
'Inflexiune','Inflic?iune','Influen?are','Informare','Informatoare','Informa?ie','Infractoare','Infrac?ionalitate','Infrac?iune','Inframicrobiologie',
'Infuzare','Infuzie','Ingeniozitate','Ingenuitate','Ingerare','Ingestie','Inginerie','Ingratitudine','Ingresiune','Ingurgitare',
'Ingurgita?ie','Inhalare','Inhala?ie','Inhibare','Inhibi?ie','Inhuma?ie','Inicvitate','Inie','Inimici?ie','Inimo?ie',
'Ini?te','Ini?iatoare','Ini?iere','Injectare','Injec?ie','Injonc?iune','Injurie','Injuste?e','Injusti?ie','Inocuitate',
'Inoculare','Inocula?ie','Inofensivitate','Inoportunitate','Inopozabilitate','Inovare','Inovatoare','Inova?ie','Insalubritate','Insanitate',
'Insatisfac?ie','Insa?iabilitate','Insa?ietate','Inscrip?ie','Insculpare','Insecuritate','Insensibilitate','Inserare','Inser?ie','Insesizabilitate',
'Insinuare','Insinua?ie','Insipiditate','Insociabilitate','Insola?ie','Insolubilitate','Insolubilizare','Insolvabilitate','Insomnie','Insondabilitate',
'Insonoritate','Insonorizare','Inspectare','Inspectoare','Inspec?ie','Inspirare','Inspiratoare','Inspira?ie','Instabilitate','Instalare',
'Instalatoare','Instala?ie','Instantaneitate','Instaurare','Instauratoare','Instaura?ie','Instigare','Instigatoare','Instiga?ie','Instilare',
'Instila?ie','Instinctivitate','Instituire','Institutoare','Institu?ie','Institu?ionalizare','Instructoare','Instruc?ie','Instruc?iune','îngrijare',
'îngrijire','îngrijitoare','îngrijorare','îngropare','îngrop?ciune','îngro?are','îngrozire','îngurluire','îngustare','îngustime',
'înh?mare','înh??are','înhumare','înierbare','înjghebare','înjosire','înjugare','înjum?t??ire','înjunghiere','înjurare',
'înl?n?uire','înl?turare','înlemnire','înlesnire','înlocuire','înlocuitoare','înmagazinare','înmatriculare','înm?nunchere','înm?rmurire',
'înmânare','înmiire','înmiresmare','înml?diere','înmormântare','înmugurire','înmuiere','înmul?ire','înnavetare','înn?dire',
'înn?molire','înnebunire','înnegrire','înnegurare','înnemurire','înnisipare','înnobilare','înnodare','înnoire','înnoptare',
'înnorare','înnoroire','înotare','înot?toare','înr?d?cinare','înr?ire','înr?ut??ire','înrâurire','înregimentare','înregistrare',
'înrobire','înrobitoare','înrolare','înro?ire','înrudire','îns?ilare','îns?mân?are','îns?n?to?ire','îns?rcinare','însc?unare',
'înscenare','înscriere','însemnare','însemn?tate','înseninare','înserare','înseriere','însetare','înseto?are','însilozare',
'însingurare','însorire','înso?ire','înso?itoare','însp?imântare','înspicare','înspi?are','înspumare','înstr?inare','înstrunare',
'însufle?ire','însumare','însurare','însur?ciune','însur?toare','însu?ire','în?elare','în?el?ciune','în?el?torie','în?euare',
'în?f?care','în?irare','în?iruire','în?tiin?are','în?urubare','înt?râtare','înt?rire','întâietate','întâlnire','întâmpinare',
'întâmplare','întârziere','întemeiere','întemeietoare','întemni?are','înte?ire','întinare','întindere','întinerire','întinsoare',
'întip?rire','întoarcere','întocmire','întomnare','întortochere','întov?r??ire','întrajutorare','întrebare','întrebuin?are','întrecere',
'întredeschidere','întregime','întregire','întremare','întrep?trundere','întreprindere','întrepunte','întrerupere','întret?iere','între?inere',
'întrevedere','întrevorbire','întrez?rire','întristare','întroienire','întrolocare','întronare','Jenare','Jep?luire','Jerpelire',
'Jertfire','Jeruire','Jicnire','Jiganie','Jig?raie','Jig?rire','Jignire','Jigodie','Jil?vete','Jil?vire',
'Jimbare','Jimbire','Jimbl?rie','Jin?c?lire','Jinduire','Jintuire','Jir?vire','Jirebie','Jiri?te','Jit?rie',
'Jit?rire','Jitie','Jivrare','Jn?p?ire','Jonc?ionare','Jonc?iune','Jonglare','Jonglerie','Jordie','Josnicie',
'Joule','Jovialitate','Jubilare','Jubila?ie','Jucare','Juc?rie','Juc?toare','Jude','Judecare','Judec?toare',
'Judec?torie','Judecire','Judiciozitate','Jug?nire','Juglandacee','Jugulare','Juice','Juisare','Juisoare','Julire',
'Jum?tate','Jum?t??are','Jum?t??ire','Jumelare','Jumulire','June','June?e','Junghiere','Junie','Junime',
'Lactozurie','Laicizare','Laie','Lalopatie','Lamare','Lamaserie','Lamblie','Lambrisare','Lame','Lamelare',
'Lamentare','Lamenta?ie','Laminare','Laminatoare','Lamina?ie','Lamoste','Lampisterie','Lance','Lansare','Lantanide',
'Laparoscopie','Laparotomie','Lapidare','Lapidaritate','Lapte','Largare','Larghe?e','Larice','Laringe','Laringectomie',
'Laringologie','Laringopatie','Laringoscopie','Laringostroboscopie','Laringotomie','Lascivitate','La?itate','Lateritizare','Latinitate','Latinizare',
'Latinizatoare','Latitudine','La?e','Lauracee','Luxare','Luxa?ie','Luxurie','Macabe','Macerare','Macera?ie',
'Machetare','Machetatoare','Machiere','Macrame','Macrobie','Macrocefalie','Macroeconomie','Macrofilmare','Macrofotografie','Macromicete',
'Macropsie','Macroscopie','Macrosporange','Mafie','Magazie','Maghiarizare','Magie','Laude','Magnetizare','Magnetizatoare',
'Magnetiza?ie','Magnetometrie','Magnetostric?iune','Magnetoterapie','Magnezie','Magnitudine','Magnoliacee','Magnolie','M?mul?rie','M?n?stire',
'M?r?cine','M?re?ie','M?rg?rele','M?rginire','M?rie','M?rime','M?rinimie','M?rire','M?ritare','M?rmurire',
'M?r??luire','M?rturie','M?rturisanie','M?rturisire','M?runtaie','M?run?ime','M?run?ire','M?sc?riciune','M?sc?rie','M?sluire',
'M?sluitoare','M?sori?te','M?surare','M?sur?toare','M?tanie','M?tase','M?t?huie','M?t?s?rie','M?tuire','M?turare',
'M?tur?toare','M?z?riche','Mâglisire','Mâhniciune','Mâhnire','Mâlire','Mânare','Mâncare','Mânc?rime','Mânc?toare',
'Mânc?torie','Mândre?e','Mândrie','Mândrire','Mânecare','Mângâiere','Mânie','Mânjire','Mântuire','Mânuire',
'Mânuitoare','Na?iune','Naufragiere','Naupatie','Nautiloide','Navigabilitate','Navigabilizare','Navigare','Navigatoare','Naviga?ie',
'Navlosire','Nazalitate','Nazalizare','Nazificare','N?b?d?ire','N?boire','N?bu?ire','N?c?jire','N?cârc?lire','N?cl?ire',
'N?d?ire','N?d?jduire','N?dejde','N?dejduire','N?dulire','N?durire','N?du?ire','N?imire','N?jire','N?l?ire',
'N?lbire','N?l?are','N?lucire','N?mete','N?metenie','N?me?ire','N?mire','N?molire','N?moloterapie','N?p?dire',
'N?p?stuire','N?p?stuitoare','N?pârlire','N?pi?tire','N?pl?ire','N?prasnicire','N?pr?snicie','N?pr?snicire','N?pruie','N?pustire',
'N?r?vie','N?r?vire','N?r?zire','N?ruire','N?s?dire','N?s?duire','N?s?lie','N?sâlnicire','N?scare','N?sc?toare',
'N?scocire','N?scom?nire','N?silnicie','N?sipire','N?slire','N?sluire','N?st?vire','N?stimire','N?stru?nicie','N?sturare',
'N?stur?rie','N?suire','N??ie','N??ire','N??p?lire','N?t?r?ie','N?tângie','N?tângire','N???luire','N?ucie',
'N?ucire','N?v?dire','N?v?lire','N?v?litoare','N?v?lnicie','N?vârnire','N?vodire','N?vr?pire','N?z?rire','N?zbâtie',
'N?zdr?v?nie','N?zuire','Nepotrivire','Neprecizare','Nepricepere','Neprih?nire','Neproliferare','Ner?bdare','Nerecunosc?toare','Neregularitate',
'Nerozie','Neru?inare','Nerva?ie','Nervozitate','Nervura?ie','Nes?buire','Nescafe','Neseriozitate','Nesfâr?ire','Nesim?ire',
'Nesocotire','Nestabilitate','Nestatornicie','Nesuferire','Nesupunere','Ne?tire','Netemeinicie','Netezare','Netezime','Netezire',
'Netezitoare','Netrebnicie','Netrebnicire','Neunire','Neurastenie','Neurastenizare','Neurochirurgie','Neurologie','Neuropatologie','Neuropsihiatrie',
'Neuropsihologie','Neutralitate','Neutralizare','Neutrodinare','Nev?z?toare','Nevinov??ie','Nevoie','Nevolnicie','Nevralgie','Nevrectomie',
'Nevrednicie','Nevroglie','Nevropatie','Nevrotomie','Nichelare','Nicorete','Nicotinice','Nictaginacee','Nictalfobie','Nictalgie',
'Nictalopie','Nife','Nifoblepsie','Nimfomanie','Nimicie','Nimicire','Nimicnicie','Nimicnicire','Ninsoare','Nisip?rie',
'Nisipi?te','Oaie','Oaspete','Oaste','Ob?dare','Obâr?ie','Obâr?ire','Obezitate','Obicinuire','Obidare',
'Obidire','Obiectare','Obiectivare','Obiectivitate','Obiectivizare','Obiec?ie','Obiec?ionare','Obijduire','Obijduitoare','Obi?nuire',
'Obl?duire','Oblicare','Oblicire','Oblicitate','Obligare','Obligarisire','Obligativitate','Obliga?ie','Oblire','Obliterare',
'Oblitera?ie','Oblojire','Oblonire','Obnubilare','Obnubila?ie','Obosire','Obr??ire','Obr?zire','Obr?znicie','Obr?znicire',
'Obr?zuire','Obrântire','Obrezuire','Obricire','Obrintire','Obrocire','Obscenitate','Obscurare','Obscuritate','Obscurizare',
'Obsecra?ie','Obsecviozitate','Obsedare','Observare','Observatoare','Observa?ie','Obsesie','Obstaculare','Obstinare','Obstina?ie',
'Obstruare','Obstruc?ie','Obstruc?ionare','Paji?te','Paladizare','Palatalizare','Palavragire','Palee','Paleoantropologie','Paleoarheologie',
'Paleobiologie','Paleoclimatologie','Paleoecologie','Paleoetnologie','Paleofitologie','Paleogeografie','Paleografie','Paleontologie','Paleopatologie','Paleopedologie',
'Paleozoologie','Paletizare','Paliditate','Palie','Paliere','Palilalie','Palingenezie','Palinodie','Palinologie','Palisare',
'Palmacee','Paloare','Palotie','Palpabilitate','Palpare','Palpa?ie','Palpitare','Palpita?ie','Paludologie','Paludoterapie',
'Pamare','Panaghie','Panare','Panatenee','Pandajmetrie','Pandalie','Pandemie','Pandosire','Pandurime','Panevghenie',
'Panfobie','Panghire','Pavare','Pavatoare','Pavelare','Paveluire','Pavoazare','Pazie','P?bâire','P?c?lire',
'P?c?nire','P?c?to?enie','P?c?to?ie','P?c?to?ire','P?c?tuire','P?celuire','P?ciuire','P?cur?rie','P?cur?rire','P?curire',
'P?duche','P?ducheare','P?duchere','P?duchire','P?dur?rie','P?dure','P?durice','P?durire','P?duri?te','P?fugare',
'P?gân?tate','P?gânie','P?gânime','P?gânire','P?gubire','P?h?rnicie','P?h?rnicire','P?ienjenire','P?injenire','P?injinire',
'P?ire','P?jurire','P?l?duire','P?l?ire','P?l?laie','P?l?l?ire','P?l?rie','P?l?tuire','P?l?v?c?ire','P?l?vr?gire',
'P?lire','P?lm?luire','P?lm?zuire','P?lmire','P?lmuire','P?lonire','P?luire','P?mântenire','P?mântire','P?n?tare',
'P?nc?nire','P?ntruire','P?pare','P?p?die','P?p?lire','P?p?r?zire','P?purezare','P?purire','P?puri?te','P?pu?are',
'P?pu??rie','P?pu?ire','P?pu?oi?te','P?r?duire','P?r?genire','P?r?ginire','P?r?sire','P?rândare','Ramoli?ie','Randalinare',
'Randare','Randomizare','Ranfluare','Ranforsare','Rantie','Rantoalare','Ranunculacee','Ranversare','Rapacitate','Rapiditate',
'Raportare','Raportoare','Rapsodie','Rapsodiere','Rarefac?ie','Rarefiere','Rarificare','Rari?te','Raritate','Raseologie',
'Rasolire','Ra?chetare','Ra?chetatoare','Ratare','Rata?are','Ratatinare','Ratificare','Ratifica?ie','Ratinare','Ratite',
'Ratrapare','Ra?ie','Ra?iocinare','Ra?ionalitate','Ra?ionalizare','Ra?ionare','Ra?iune','Ravenare','Ravinare','Razachie',
'Razie','R?bdare','R?bl?gire','R?bl?rire','R?bojire','R?bufnire','R?buire','R?c?duire','R?c?lire','R?c?luire',
'R?c?nire','R?cire','R?cluire','R?cnire','R?coare','R?corire','R?coritoare','R?dicare','R?ducere','R?fuire',
'R?gace','R?g?duire','R?g?lie','R?gilare','R?gire','R?gu?ire','R?ire','R?m??ire','R?mânere','R?murire',
'R?nire','R?nt?lire','R?p?ire','R?p?luire','R?pciune','R?pire','R?pitoare','R?posare','R?p?tire','R?puitoare',
'R?punere','R?rire','Riscare','Risipire','Ritmare','Ritmicitate','Ritmoterapie','Ritologie','Ritualizare','Ri?uire',
'Rivalitate','Rivalizare','Rizare','Roadere','Robie','Robinsonare','Robire','Robotire','Robotizare','Robotologie',
'Robuste?e','Roc?rie','Rochie','Roco?ire','Rodare','Rodie','Rodire','Rodnicie','Rodnicire','Rogodele',
'Roire','Roi?te','Rolare','Romanitate','Romanizare','Romanticizare','Romantizare','Roman?are','Roman?iozitate','Românie',
'Românime','Românire','Românizare','Rondare','Ronjare','Röntgenterapie','Ron??ire','Ropotire','Rostire','Rostogolire',
'Rostuire','Ro?ie','Ro?ire','Sabie','Sablare','Sablatoare','Sabordare','Sabotare','Sabotoare','Sacadare',
'Sacovi?te','Sacralitate','Sacralizare','Sacrare','Sacrificare','Sacristie','Safe','Sagacitate','Saiggire','Saigire',
'Sake','Salahorie','Salahorire','Salariere','Salarizare','Salce','Salcie','Salicacee','Salificare','Salifica?ie',
'Salinitate','Salinizare','Salivare','Saliva?ie','Salpingectomie','Salpingografie','Salpingoscopie','Salubritate','Salubrizare','Salutare',
'Salut?rire','Salvare','Salve','Salvgardare','Salvie','Samavolnicie','Suspendare','Suspensie','Suspiciune','Suspinare',
'Sustenta?ie','Sustrac?iune','Sustragere','Sus?in?toare','Sus?inere','Susurare','Sutime','Suveranitate','Suzeranitate','Svilcolire',
'Svingare','Swingare','?ablonare','?ablonizare','?agrinare','?aidare','?aisprezecime','?ait?lire','?ale','?ambrare',
'?amizare','?amotare','?ampanie','?ampanizare','?anfrenare','?antajare','?apirografiere','?arjare','?arlatanie','?armare',
'?arpe','?arpie','?atrange','??guire','??lvirie','??nc?luire','??ng?rire','??n?uire','??ruire','?â?âire',
'?cârc?ire','?ceric?ire','?chiopare','?chiop?tare','?chiopenie','?colaritate','?colarizare','?col?rime','?col?rire','?colire',
'?cord?luire','?edere','?edin?omanie','?efie','?eft?lire','Talasemie','Talasocra?ie','Talasofobie','Talasografie','Talasoterapie',
'Talie','Talkie-walkie','Talonare','Taluzare','Tamburare','Tamburinare','Tamizare','Tamponare','Tanatofobie','Tanatologie',
'Tancare','Tandre?e','Tangare','Tangentare','Tangibilitate','Tanizare','Tapare','Tapetare','Tapiride','Tapisare',
'Tapiserie','Tapi?are','Tapi?erie','Tapotare','Tarapangele','Tarare','Tardivitate','Tarifare','Tarlalizare','Tarodare',
'Tarsalgie','Tarsectomie','Tarsioidee','Tescuire','Tesl?rie','Teslimarisire','Teslimatisire','Testare','Testatoare','Test?luire',
'Te?ire','Te?menire','Tetanie','Tetanizare','Tetrafonie','Tetralogie','Tetrapodie','Tetrarhie','Teurgie','Textile',
'Textologie','Texturare','Tezaurizare','Tic?ire','Tic?lo?enie','Tic?lo?ie','Tic?lo?ire','Tic?zuire','Tichie','Ticluire',
'Ticnire','Ticsire','Ticuire','Tiflografie','Tiflologie','Tiflomegalie','Tigaie','Tighelire','Tigoare','Tih?raie',
'Tih?rie','Tihnire','Tihuire','Tim?rire','Timbrare','Timbrologie','Timburire','Timiditate','Timie','Timonerie',
'Timorare','Timpanoplastie','Timpanotomie','Tinchire','Tincturare','Tindalizare','Tindeche','Tindechire','Tindere','Tinere?e',
'Tinerime','Uluire','Umanitate','Umanizare','Umblare','Umbl?toare','Umbrire','Umectare','Umezire','Umflare',
'Umidificare','Umiditate','Umilire','Umoare','Umplere','Unanimitate','Uncie','Undare','Undire','Undoire',
'Unduire','Undulare','Uneltire','Uneltitoare','Ung?toare','Ungere','Unghie','Unghiula?ie','Ungurime','Unicitate',
'Unidimensionalitate','Unidimensionare','Unificare','Uniformitate','Uniformizare','Unilateralitate','Unime','Unire','Unisexualitate','Unitate',
'Uniune','Universalitate','Universalizare','Universitate','Univocitate','Unsoare','Upercutare','Uperizare','Upov?ire','Urale',
'Uranografie','Uranometrie','Urare','Ur?toare','Urâciune','Urâ?enie','Urâ?ire','Urbanitate','Urbanizare','Urbe',
'Urcare','Urdinare','Urdoare','Urducare','Ureche','Urechere','Uree','Uremie','Ureterografie','Uretroscopie',
'Urgentare','Urgie','Urgisire','Uricemie','Urinare','Urlare','Url?toare','Urluire','Urluitoare','Urmare',
'Urm?rire','Urm?ritoare','Urnire','Urobacterie','Urografie','Urologie','Uroscopie','Urs?rime','Ursire','Ursitoare',
'Ursoaie','Ursuzenie','Urticacee','Urticare','Urticarie','Uruire','Urzicare','Urzire','Urzitoare','Uscare',
'Usc?ciune','Usc?toare','Usc?torie','Usc??ele','Ustilaginale','Usturare','Usturime','U?chire','U?uire','U?urare',
'U?ur?tate','U?urime','Utilare','Utilitate','Utilizare','Utopie','Utrenie','Uvografie','Uvologie','Uzare',
'Uzinare','Uzitare','Uzucapiune','Uzurpare','Uzurpatoare','Uzurpa?iune','Vaccinare','Vaccina?ie','Vaccinoterapie','Vacuitate',
'Velnicire','Velocitate','Velografie','Venalitate','Venectazie','Venepunc?ie','Venerare','Venera?ie','Venereologie','Venesec?ie',
'Veninare','Venire','Venozitate','Ventilare','Ventila?ie','Ventriculografie','Veracitate','Verbalizare','Verbozitate','Verde',
'Veresie','Vergelare','Veridicitate','Verificare','Verificatoare','Veritate','Vermina?ie','Vermutizare','Vernalizare','Vernisare',
'Verosimilitate','Verosimilitudine','Versatilitate','Versificare','Versificatoare','Versifica?ie','Versiune','Versuire','Verticalitate','Verticalizare',
'Verucozitate','Veselie','Veselire','Veste','Vesteg?luire','Vestejire','Vestimenta?ie','Vestire','Vestitoare','Ve?nicie',
'Ve?nicire','Ve?tejire','Ve?tezire','Vetrice','Vetustate','Vetuste?e','Vexare','Vexa?iune','Vezica?ie','Viabilitate',
'Vibrare','Xantinurie','Xantocromie','Xantodermie','Xantogenare','Xantomizare','Xantopsie','Xenie','Xenocra?ie','Xenofilie',
'Xenofobie','Xenomanie','Xenomorfie','Xenopatie','Xerocopie','Xerodermie','Xerofagie','Xeroftalmie','Xerografie','Xeroxare',
'Xilografie','Xilolatrie','Xilolitografie','Xilologie','Xilotipie','Zadie','Zaharicale','Zaharificare','Zaharimetrie','Zaharisire',
'Zapcierie','Zapciire','Zare','Zari?te','Zavergisire','Zavistie','Zavistiire','Zavistnicie','Zavistuire','Z?b?vire',
'Z?bovire','Zdrobire','Zdrobitoare','Zdronc?nire','Zdro?ire','Zdrumicare','Zdruncinare','Zdru?ire','Zdup?ire','Zdupuire',
'Zeberire','Zecime','Zeciuire','Zeflemisire','Zeghe','Zeie','Zeificare','Zeitate','Zelatoare','Zemo?ire',
'Zemuire','Zencuire','Zerire','Zestre','Ze??rie','Ze?uire','Zevzecie','Zg?urare','Zgâire','Zgâl?âire',
'Zgâl?ânare','Zgâm?ire','Zgâmboire','Zgâncilire','Zgând?rire','Zgârcenie','Zgârcire','Zgâriere','Zgâtie','Zgornire',
'Zgrep??nare','Zgribulire','Zgrun?urozitate','Zguduire','Zgurificare','Zic?toare','Zicere','Zid?rie','Zidire','Ziditoare',
'Ziduire','Zigzagare','Zimologie','Zim?are','Zim?uire','Zincare','Zincografie','Zincuire','Zing?nire','Zinghenire',
'Zizanie','Zm?cinare','Zmâng?lire','Zmeoaie');
  lista_substantive varr := varr('Aba','Abac','Abaca','Abac?','Abagiu','Abanos','Abataj','Abates?','Abatiz?','Abc',
'Abces','Aberoscop','Abiogeneza','Abiogenez?','Abioz?','Abis','Abiu','Ablativ','Ablaut','Ablegat',
'Aboli?ionism','Aboli?ionist','Aboli?ionist?','Abolla','Abonament','Abonat','Abonat?','Abordaj','Abortiv','Abracadabra',
'Abraziv','Abrudeanca','Abrupt','Abscis?','Absenteism','Absenteist','Absenteist?','Absen??','Absid?','Absidiol?',
'Absint','Absolut','Absolutism','Absolutist','Absolutoriu','Absolvent','Absolvent?','Absolven??','Absorbant','Absten?ionism',
'Absten?ionist','Absten?ionist?','Abstinent','Abstinent?','Abstinen??','Abstract','Abstrac?ionism','Abstrac?ionist','Abstrac?ionist?','Absurd',
'Ab?ibild','Abulic','Abulic?','Abunden??','Abureal?','Abuz','Ac','Acacia','Acadea','Academician?',
'Academism','Acaju','Acant?','Acantocefal','Acantoz?','Acaret','Acaricid','Acarinat?','Acarioz?','Acarni??',
'Acatalectic','Acatist','Aca?','Acaustobiolit','Ac?ri??','Accelerograf','Accelerometru','Accent','Accept','Acces',
'Accesoriu','Accident','Acciz','Acerateriu','Acer?','Acerola','Acetaldehid?','Acetamid?','Acetat','Acetazolamid?',
'Acetil','Acetilen?','Acetilur?','Acetobutirat','Acetofenon?','Aceton?','Achen?','Achingiu','Achiu','Acicul',
'Acid','Acidamin?','Acidimetru','Acidorezisten??','Acidoz?','Acil','Acioal?','Acipensericultur?','Acipenserid','Aciua?',
'Acolad?','Acolit','Acolit?','Acompaniament','Aconit','Aconitin?','Acont','Acoper?mânt','Acoperi?','Acord',
'Acordaj','Acordant','Acordant?','Acordeonist','Acordeonist?','Acordic?','Acostament','Acraniat','Acreal?','Acreditiv',
'Acresc?mânt','Acridin?','Acrilat','Acri?','Acritur?','Acrobat','Acrobat?','Acrobatic?','Acrocianoz?','Acrofobia',
'Acrolein?','Acrolit','Acromat','Acromatism','Acronim','Acropol?','Acrostih','Acrostol','Acro?aj','Acroter?',
'Acru','Act','Acta','Actant','ACTH','Actiniu','Actinograf','Actinometru','Actinomicoz?','Actinot',
'Activ','Activant','Activist','Activist?','Actora?','Actori??','Actri??','Actualism','Actuariat','Ac?ionar?',
'Acuarel?','Acuarelist','Acuarelist?','Aculeat?','Aculeol','Aculeu','Acumetru','Acuplaj','Acupresur?','Acupunctur?',
'Acupuncturist','Acustic?','Acustician?','Acustomat','Acuzat','Acuzat?','Acuzativ','Acuz?','Acvacultur?','Acvadag',
'Acvafortist','Acvariofil','Aerograf','Aerogram?','Aerolit','Aeromecanic?','Aerometru','Aeromobil','Aeromodel','Aeromodelism',
'Aeromodelist','Aeromodelist?','Aeronaut','Aeronaut?','Aeronautic?','Aeronav?','Aeroport','Aeroscop','Aerosol','Aerostat',
'Aerostatic?','Aerotehnic?','Aerotopograf','Aerotransport','Aerovehicul','Afacerism','Afacerist','Afacerist?','Afazic','Afazic?',
'Afect','Afeliu','Afemeiat','Aferez?','Afet','Afgan?','Afid?','Afinaj','Afinant','Afinat?',
'Afin?','Afinet','Afini?','Afipt','Afi?','Afi?aj','Afix','Afloriment','Afluent','Afluen??',
'Aflux','Afon?','Aforism','African?','Africanist','Africanist?','Africanistic?','Africanolog','Africanolog?','Africantrop',
'Africat','Afrikaans','Afrodiziac','Afront','Aft?','Afum','Afum?tur?','Afund','Afund?tur?','Afundi?',
'Afurc?','Afurisit','Afurisit?','Afuzali','Agap?','Agat','Agatâr?i','Agav?','Ag?','Ag?n?u',
'Ag?rlâc','Agend?','Agent','Agent?','Agentur?','Agest','Agestru','Agheasm?','Aghios','Aghiotant',
'Aghiu??','Agio','Agiotaj','Aglic?','Aglomerant','Aglomerat','Aglutinant','Aglutinin?','Agnat','Agnat?',
'Agne?','Agnostic','Agnostic?','Agnosticism','Agogic?','Agon?','Agoniseal?','Agonisit?','Agora','Agorafobia',
'Agraf?','Agramat','Agramat?','Anrocament','Ansamblu','Ans?','Anseriform','Anseriform?','Ansilaj','An?oa',
'Anta','Antablament','Antagonism','Antal','Antalgic','Antanaclaz?','Antanagog?','Antant?','Ant?','Antebra?',
'Antecalcul','Antecedent','Anteceden??','Antecliz?','Antedat?','Antedeviz','Antefix','Antegard?','Antenat','Anten?',
'Anteport','Anteproiect','Anter?','Anteriu','Anterozoid','Antesoclu','Antestep?','Antet','Antetitlu','Antetrupi??',
'Antiaerian?','Antialcoolism','Antialergic','Antianticorp','Antiart?','Antiartritic','Antiatom','Antibiogram?','Antibiotic','Antibioz?',
'Antibron?itic','Antic','Anticalofil','Anticalofil?','Anticamer?','Anticariat','Anticataliz?','Anticataral','Anticatod','Anticentru',
'Anticlericalism','Anticlinal','Anticoagulant','Anticolesterol','Anticolonialism','Anticomunism','Anticoncep?ional','Anticonformism','Anticonformist','Anticonformist?',
'Anticongelant','Anticonvulsiv','Anticorosiv','Anticriptogamic','Anticristianism','Anticritic?','Anticv?','Antidepresiv','Antidetonant','Antidetonan??',
'Antidiabetic','Antidiuretic','Antidogmatism','Antidot','Antidumping','Antienzim?','Antifascism','Antifascist','Antifascist?','Antifebrin?',
'Antiferment','Antifilistinism','Antiformant','Antifraz?','Antifurt','Antigel','Antihalo','Antihelmintic','Antihemoragic','Antihemoroidal',
'Antihistaminic','Antiholeric','Antihrez?','Antihrist','Antiimperialism','Antiintelectualism','Antiintelectualist','Antiintelectualist?','Antiistorism','Antijunimism',
'Antijunimist','Antijunimist?','Antiliteratur?','Antilocapr?','Antilogaritm','Antilop?','Antiluetic','Antimalaric','Antim?luric','Antimefitic',
'Antimemorii','Antimetabol?','Antimilitarism','Antimitotic','Antimoniat','Antimoniu','Antinefretic','Antineutrino','Antinevralgic','Antinicotinic',
'Antioxidant','Antipap?','Antipapism','Antiparticul?','Antiperistaltism','Antipies?','Antipiretic','Antipirin?','Antipod','Antipoem',
'Antipoluant','Antipruriginos','Antipsoriazis','Antiputrid','Antirabic','Antirealism','Antireclam?','Antiregalist','Antiregalist?','Antireumatismal',
'Antirezonan??','Antischeting','Antisclavagist','Antisclavagist?','Antiscorbutic','Antisemit','Antisemit?','Antisemitism','Antiseptic','Badijonaj',
'Baft?','Bagaj','Bagatel?','Bagea','Bageac?','Baghet?','Bahn?','Bahorni??','Bai','Baiader?',
'Baibarac','Baidera?','Baier?','Baionet?','Bairac','Bairam','Bait','Bai?','Bal','Balabust?',
'Balad?','Balalaic?','Balama','Balamuc','Balang?','Balans','Balansin?','Balan??','Balast','Balastier?',
'Bal?','Balcaniad?','Balcanism','Balcanist','Balcanist?','Balcanistic?','Balcanolog','Balcanolog?','Balcona?','Baleiaj',
'Balena','Balen?','Balenier?','Balerc?','Balercu??','Balerin?','Balet','Baletist','Baletist?','Balic',
'Balic?','Balig?','Balimez','Balist?','Balistic?','Balistician?','Balivern?','Balizaj','Baliz?','Balmo?',
'Balneolog','Balneolog?','Balona?','Balonet','Balonzaid','Balot','Balotaj','Balotat','Balsa','Balsam',
'Balsamin?','Baltag','Balt?','Balustrad?','Balustru','Balzacianism','Bam?','Bambino','Bambus','Banana',
'Split','Banan?','Banat','Banatit','Ban?','Banc','Banc?','Banchet','Banchet?','Banchiz?',
'Bancnot?','Banco','Bancrut?','Bandaj','Band?','Banderil?','Banderol?','Bandier?','Bandit','Banditism',
'Bandotec?','Bandul?','Bandulier?','Bandur?','Bandurist','Bandurist?','Bang','Sonic','Bang?t','Banier?',
'Bani??','Banjo','Bant?','Banteng','Bantu','Baobab','Baptism','Baptist','Baptist?','Baptisteriu',
'Baraboi','Barabul?','Barabu?c?','Baracament','Barac?','Baragladin?','Baraj','Barajist','Bar?','Barbacan?',
'Barbarism','Barb?','Barbet','Barbet?','Barbi??','Barbituric','Barbiturism','Barbotaj','Barbut','Barbut?',
'Barcagiu','Barcan?','Barcarol?','Barcaz','Barc?','Bard','Bard?','B?liu??','B?lm?jeal?','B?los',
'B?lo?el','B?ltac','B?lt?gel','B?lt?re?ul','B?lt?u','B?lti?','B?lti??','B?ltoac?','B?ltoi','B?l??tur?',
'B?lu?c?','B?nat','B?n?rit','B?n??ean?','B?n??eanc?','B?ncu??','B?nduric?','B?neasca','B?net','B?nic?',
'B?nicioar?','B?nuial?','B?nuit','B?nu?','B?nu?el','B?rat','B?rbat','B?rb?tu?','B?rb??el','B?rb??oi',
'B?rbân??','B?rbiereal?','B?rbierit','B?rbieri??','B?rbioar?','B?rbi?oar?','B?rbi??','B?rbiu??','B?rboas?','B?rboi',
'B?rbunc','B?rbu?oar?','B?rbu??','B?rcu??','B?rdac','B?rdac?','B?rda?','B?rd?cu??','B?rdi??','B?rzoi',
'B?sm?lu??','B??ic?','B??icoas?','B??icu??','B??tina?','B??tina??','B?t?ia?','B?t?i??','B?t?torit','B?t?torni??',
'B?t?tur?','B?t?u?','B?t?u??','B?teal?','B?trân?','B?trânet','B?trâni?','B?tut?','B??','B?ut',
'B?utur?','B?uturic?','Bâiguial?','Bâjbâial?','Bâjbâit','Bâjbâitur?','Bâlbâial?','Bâlci','Bântuial?','Bârf?',
'Bârfeal?','Bârfit','Bârfit?','Bârl?deanc?','Bârlog','Bârn?','Bârs?','Bât','Bât?','Bâtl?na?',
'Bâ?âial?','Bâ?âit','Bâz?','Bâzâial?','Bâzâit','Bâzâitur?','Bâzdâc','Bâzoi','Beat','Beatnic',
'Bebelu?','Bec','Beca??','Beca?in?','Bechera?','Bechiu','Beci','Becisnic','Becisnic?','Bedreag',
'Behaviorism','Beh?it','Beh?itur?','Bei','Beilerbei','Beilic','Beizadea','Bej','Beladon?','Belcanto',
'Belciug','Beldi??','Belea','Belemnit','Beletristic?','Belgi','Belgian?','Beligeran??','Belinograf','Belinogram?',
'Belit?','Belot?','Bel?i??','Bel?ug','Beluga','Belzebut','Bemberg','Bemol','Blan?','Blanc',
'Blanchet?','Blastogenez?','Blastul?','Blat','Blau','Blaz?','Bl?n?reas?','Bl?ni??','Blând?','Bleand?',
'Bleau','Blefarit?','Blend?','Bleotoc?real?','Blestem','Bleu','Blid','Blimp','Blindaj','Blindat',
'Bli?','Blizzard','Bloc','Bloc-start','Blocad?','Blocaj','Blochaus','Blocnotes','Blond','Blond?',
'Blues','Bluf','Blugi','Blum','Bluming','Bluz?','Bluzi??','Bluzuli??','Boa','Boab?',
'Boac?','Boait?','Boal?','Boamb?','Boarf?','Boar??','Boa??','Bob','Bobârnac','Bobinaj',
'Bobin?','Bobi??','Boboc','Bobocel','Bobornic','Bobot','Boboteaz?','Bobslei','Bobule?','Bocanc',
'Bocaport','Boc?neal?','Boc?nit','Boc?nitur?','Boccea','Bocceagiu','Boccealâc','Boccelu??','Boceal?','Bocet',
'Bocit','Bocn?','Boc??','Bodârl?u','Bodeg?','Bodicec','Bodog?neal?','Bodog?nit','Bodoni','Bodyguard',
'Boem','Boem?','Bogasiu','Bogat?','Bog?tan?','Bog?ta?','Bog?ta??','Boghiu','Boglari','Bogomil',
'Bogomilism','Bohriu','Boia','Boial?','Boiangiu','Boicot','Boiereas?','Boieresc','Boieri??','Boierna?',
'Boieroaic?','Boit','Bojdeuc?','Bojoc','Bol','Bolard','Bolboroseal?','Bolborosit','Bold','Boldei',
'Boldeic?','Boleazn?','Bolero','Bole?ni??','Bolf?','Bolid','Bolivian?','Bolnav','Bolnav?','Bolni??',
'Bolometru','Bolov?nel','Bolov?ni?','Bol?evic','Bol?evic?','Bol?evism','Bolta?','Bolt?','Bolti?oar?','Boltitur?',
'Bolti??','Bol?','Bombaj','Bombament','Bombardament','Bombard?','Bomb?','Bomb?neal?','Bomb?nit','Bombeu',
'Bombi??','Cebocefal','Cebocefal?','Cec','Cecmegea','Cecograf','Cedent','Cedru','Cefalin?','Cefalit?',
'Cefalocordat','Cefalograf','Cefalometru','Cefalopod','Cefeid?','Ceferist','Ceferist?','Ceg?','Ceh','Ceh?',
'Cehoslovac','Cehoslovac?','Celafibr?','Celaperm','Cel?rel','Celebrant','Celenterat','Celerimetru','Celest?','Celestin?',
'Celibat','Celibatar?','Cella','Cello','Celochit','Celofibr?','Celoidin?','Celolân?','Celom','Celomat',
'Celostat','Celt','Celta','Celt?','Cel?iu','Celuial?','Celul?','Celulit?','Celuloid','Celuloz?',
'Cembalo','Cement','Cementit?','Cenaclist','Cenaclist?','Cenaclu','Cenobism','Cenobit','Cenobiu','Cenogenez?',
'Cenotaf','Cenotip','Cenozoic','Cens','Cent','Centigrad','Centigram','Centil?','Centilitru','Centim?',
'Centimetru','Centraj','Central?','Centralism','Centralist','Centralist?','Centrifug?','Centriol','Centrism','Centrist',
'Centrist?','Centroplasm?','Centrosfer?','Centrosperm?','Centrozom','Centru','Centumvirat','Centur?','Cenuroz?','Cenu??',
'Cenu??reas?','Cenu??rit','Cenu?erni??','Cenu?iu','Cenzur?','Cep','Cep?it','Cepuit','Cepu?oar?','Cerambicid',
'Ceramic?','Ceramist','Ceramist?','Cerargirit','Ceratit','Cer?rit','Cerb','Cerboaic?','Cerc','Cerc?nel',
'Cerc?tur?','Cercel','Cerceloi','Cercelu?','Cerceta?','Cerceta??','Cercevea','Cerchez','Cerchez?','Cerci',
'Cercopitec','Cercopitecid','Cercosporioz?','Cercuial?','Cercuit','Cercule?','Cercurel','Cerdac','Cerd?cel','Chiulangiu',
'Chiup','Chiuretaj','Chiuret?','Chiuvet?','Chiv?r?','Chiverniseal?','Chivot','Chivu??','Chix','Chorus',
'Chulo','Ciabatta','Ciacon?','Cianamid?','Cianat','Cianhidrin?','Cianin?','Cianoz?','Cianur?','Cia?iu',
'Cibernetic?','Cibernetician?','Cicad?','Cicatrizant','Cic?leal?','Cicero','Cichirgiu','Cicisbeu','Ciclam?','Ciclism',
'Ciclist','Ciclist?','Cicloalchen?','Ciclocefal','Ciclocefal?','Ciclocros','Ciclodrom','Ciclomorfoz?','Ciclop','Cicloparafin?',
'Cicloram?','Ciclostom','Ciclotimic','Cicloturism','Cicloturist','Cicloturist?','Cicloz?','Ciclu','Cico','Ciconiid?',
'Ciconiiform?','Cidru','Ciflic','Cifoscolioz?','Cifotic','Cifotic?','Cifoz?','Cifraj','Cifr?','Cifru',
'Cig?','Cil','Ciliat','Cilindroid','Cilindrom','Cilindru','Cimaz?','Cim?','Cimbal','Cimbalist',
'Cimbalist?','Cimbistr?','Cimbri','Cimbru','Ciment','Cimentist','Cimentist?','Cimentometru','Cimerieni','Cimilitur?',
'Cimpanzeu','Cimpoi','Cimpoia?','Cinabru','Cin?','Cinc?rel','Cinci','Cincinal','Cineamatorism','Cineast',
'Cineast?','Cinecenaclu','Cineclub','Cineclubist','Cineclubist?','Cinefil','Cinefil?','Cinegetic?','Cinel','Cinema',
'Cinemascop','Cinematec?','Cinematic?','Cinematograf','Cineram?','Cineraria','Cinerit','Cinescop','Cinetic?','Cinism',
'Cinocefal','Cinovnic','Cinquecentist','Cinquecento','Cinste?','Cintez','Cintez?','Cintezoi','Cintru','Cinzeac?',
'Cioac?','Cioacl?','Cioanc?','Cioand?','Cioar?','Cioareci','Cioars?','Ciob','Ciobac?','Ciob?na?',
'Ciob?nel','Ciob?nit','Ciob?ni??','Comedioar?','Comediograf','Comensualism','Comentariu','Comeraj','Comercialism','Comerciant',
'Comerciant?','Comer?','Comesean?','Comet?','Comic','Comics','Comin?','Comis','Comisariat','Comisur?',
'Comi?el','Comitagiu','Comitat','Comitent','Comitent?','Comitet','Comi?ial','Comi?ial?','Comi?ii','Comoar?',
'Comodat','Comod?','Comornic','Compactometru','Companioan?','Comparatism','Comparatist','Comparatist?','Comparativism','Compars',
'Compartiment','Compartimentaj','Compas','Compatrioat?','Compatriot','Compendiu','Comperaj','Competen??','Complement','Complementarism',
'Complet','Completa?','Complex','Complezen??','Complian??','Compliment','Complot','Complota?','Complota??','Complotism',
'Complotist','Complotist?','Component','Component?','Componen??','Componist','Componist?','Comportament','Comportamentism','Comportamentist',
'Comportamentist?','Compost','Compot','Compotier?','Compound','Compozit?','Compres','Compres?','Comprimat','Compromis',
'Compus','Comput','Comunard','Comunard?','Comun?','Comuneros','Comuniant','Comuniant?','Comunicant','Comunicant?',
'Comunicat','Comunionism','Comunism','Comunist','Comunist?','Conabiu','Conac','Coocupant','Coocupant?','Cool',
'Cooperatism','Cooperativ?','Cooperativism','Cooperativist','Cooperativist?','Cooperit','Coordonat?','Cop','Copac','Copai',
'Copal','Cop?cel','Cop?i??','Cop?rta?','Cop?rta??','Copâr?eu','Copc?','Copeic?','Copepod','Coperi?',
'Coperniciu','Copert?','Copertin?','Copiat','Copil','Copilandr?','Copilandru','Copila?','Copil?','Copile?',
'Copilit','Copili??','Copilot','Copist','Copist?','Copitat','Copit?','Copoi','Copoia?','Copr?',
'Coprin?','Coprocultur?','Coprolit','Coproscleroz?','Coprostaz?','Coprosterol','Cops','Copt','Copt?','Copt?tur?',
'Coptur?','Copul?','Copyright','Coral','Coral?','Coraport','Corasl?','Cor?biasca','Cor?bioar?','Corb',
'Corbule?','Corci','Corcitur?','Corcodel','Corcodu?','Corcodu??','Cord','Cordaj','Cordat','Cordea',
'Cordelu??','Cordenci','Cordit?','Cordona?','Coreclamant','Coreclamant?','Corecliz?','Corectiv','Corectur?','Coreean?',
'Coreferat','Coreferent','Coreferent?','Coregent','Coregraf','Coregraf?','Coreligionar?','Coreometru','Corespondent','Corespondent?',
'Coresponden??','Core?','Coreu','Coreut','Corf?','Corfi??','Corhan?','Corhart','Corh?nit','Cori',
'Coriamb','Coriandru','Coribant','Corid?','Coridora?','Corifeu','Corigent','Corigent?','Corigen??','Corimb',
'Corinteu','Corintian?','Dam?','Dambla','Damblagiu','Damf','Damigean?','Dan?','Danci','Dancing',
'Dandana','Dandi','Dandism','Danez','Danez?','Danga','Dang?t','Dans','Dantel?','Dantelur?',
'Dantelu??','Dantolog','Dantolog?','Dantur?','Dara','Daraban?','Darac','Daraver?','Dard?','Darmstadtiu',
'Darwinism','Darwinist','Darwinist?','Dasc?l','Dat','Dat?','Datin?','Dativ','Datorin??','Datornic',
'Datornic?','Daun?','D?dac?','D?d?ceal?','D?lc?uc','D?lc?u?','D?lti??','D?ltuitur?','D?ltu??','D?nciuc',
'D?ng?nit','D?n?uit','D?rab','D?r?bu?','D?r?cit','D?r?citur?','D?r?p?n?tur?','D?râm?tur?','D?ruial?','D?ruin??',
'D?sc?la?','D?sc?leal?','D?sc?lici','D?sc?litur?','D?sc?li??','D?una?','D?una??','Dâlm?','Dâmb','Dâmbovi?eanc?',
'Dâmbule?','Dânsul','Dâr?','Dârdal?','Dârdâial?','Dârdâit','Dârdor?','Dârloag?','Dârlog','Dârlogel',
'Dârmoz','Dârst?','Dârval?','Deadweight','Deal','Deambulatoriu','Debaclu','Debandad?','Debara','Debit',
'Debitant','Debitant?','Debitez?','Debitmetru','Debleu','Debreiaj','Deburaj','Deburbaj','Debu?eu','Debut',
'Debutant','Debutant?','Decabrist','Decabrist?','Decacord','Decad?','Decadentism','Decaden??','Decadraj','Decaedru',
'Decagram','Decalaj','Decalc','Decalcifiant','Decalitru','Decalog','Decametru','Decanal?','Decanat','Decan?',
'Decapaj','Decapant','Decapod','Decasilab','Decastil','Decatlonist','Decatlonist?','Decembrist','Decembrist?','Decemvirat',
'Deceniu','Decen??','Decep?ionism','Deces','Decibel','Decibelmetru','Decigrad','Decigram','Decilitru','Decima',
'Decimal','Decim?','Decimetru','Deck','Declamativism','Declarant','Declarant?','Declasat','Declasat?','Declic',
'Declinograf','Declinometru','Declivometru','Decoct','Decodaj','Decofraj','Decolmataj','Decolorant','Decolteu','Deconectant',
'Decongestiv','Decont','Decopert?','Decorativism','Decovil','Decozin?','Decrement','Decrescendo','Decret','Decro?aj',
'Decubit','Decupaj','Decupat','Decurs','Decuvaj','Dedal','Dedesubt','Dedi??','Dedi?el','Dedoi',
'Defazaj','Defecant','Defect','Defectolog','Defectolog?','Defectoscop','Defensiv?','Deferen??','Defervescen??','Defetism',
'Defetist','Defetist?','Deficient','Dezinteres','Dezinvoltur?','Dezm??','Dezmiri?tit','Dezmor?eal?','Deznod?mânt','Dezodorizant',
'Dezoxidant','Dezumflat','Dezv??','Diabet','Diabetic','Diabetic?','Diac','Diachen?','Diaclaz?','Diaconic',
'Diadem?','Diadoh','Diafilm','Diafiz?','Diafor?','Diaforetic','Diaforez?','Diafragm?','Diagenez?','Diagnostic',
'Diagnostician?','Diagnoz?','Diagonal?','Diagram?','Dialect','Dialectalism','Dialectic?','Dialectician?','Dialectolog','Dialectolog?',
'Dialel?','Dialingvistic?','Dialipetal?','Dializ?','Dialog','Diamagnetism','Diamant','Diametru','Diapedez?','Diapozitiv',
'Diartroz?','Diascop','Diasistem','Diaspora','Diastaz?','Diastil','Diastol?','Diat?','Diatec?','Diatez?',
'Diatomit','Diatonic?','Diatrib?','Diavol','Diavoli??','Dibl?','Diblu','Dibol','Dibuial?','Dibuit',
'Dicaziu','Dichici','Dichis','Dichiseal?','Dichiu','Dicotiledonat?','Dicroism','Dictando','Dictat','Dictatur?',
'Dicteu','Dic?ion?ra?','Didactic?','Didacticism','Diecel','Diecez?','Dieci??','Diedru','Dielectric','Diencefal',
'Dierez?','Diet?','Dietetic?','Dietetician?','Diez','Diferend','Diferen??','Diferen?ial','Diferen?ial?','Difluen??',
'Difteric','Difteric?','Diftin?','Diftong','Droag?','Drob','Drobi??','Drog','Droghist','Droghist?',
'Drojdioar?','Drojdiu??','Drongo','Dropgol','Dropic?','Dropicoas?','Dropicos','Dropioi','Drops','Drosofil?',
'Dro?c?','Dro?cu??','Drot','Drug','Drug?','Drughinea??','Drugule?','Drum','Druma?','Drumeag',
'Drumea??','Drume?','Drumule?','Drup?','Dru?c?','Druz?','Dual','Dualism','Dualist','Dualist?',
'Dubas','Dub?','Dubeal?','Dubiu','Dublaj','Dubl?','Dublet','Dublur?','Dubniu','Ducat',
'Duc?','Duces?','Ducipal','Duco','Duct','Dud','Dud?','Dud?u','Duduc?','Duducu??',
'Duduit','Duduitur?','Dudui??','Duecento','Duel','Duelgiu','Duelist','Duet','Dughean?','Duglas',
'Dugli?','Dugli??','Dugong','Duh','Duhovnic','Duium','Dulam?','Dulap','Dul?pa?','Dul?u',
'Dulcea??','Dulgherit','Dulu??','Dum-dum','Dum?','Dumbe?','Dumbrav?','Dumbravnic','Dumbr?veanc?','Dumbr?vioar?',
'Dumicat','Duminecea','Duminic?','Dumitri??','Dumping','Dun?','Dunet?','Dung?','Dung??ea','Dunguli??',
'Dungu??','Duo','Duodenit?','Duotriod?','Dup?-amiaz?','Dup?-mas?','Dup?it','Dup?itur?','Duplex','Duplicat',
'Duracid','Duracryl','Duraluminiu','Durat','Durat?','Dur?','Dur?it','Dur?itur?','Durbac?','Durd?',
'Durduit','Durit','Duri??','Durligi','Duro','Duroflex','Duroscop','Duruit','Duruitur?','Durut',
'Dus','Du?','Du?c?','Du?egubin?','Du?man?','Du?manc?','Du?umea','Dutc?','Duumvirat','Duz?',
'Duzin?','Ebenist','Ebenist?','Ebenistic?','Ebonit?','Ebo??','Ebraic?','Ebraist','Ebraist?','Ebuliometru',
'Ebulioscop','Ecarisaj','Ecarlat','Ecartament','Echidistan??','Echidn?','Echilibrist','Echilibrist?','Echilibristic?','Echilibru',
'Echimoz?','Echin?','Echingiu','Echinid?','Echinism','Echinococ','Echinococoz?','Echinoc?iu','Echinoderm','Echipaj',
'Echipament','Echip?','Echipier?','Echipolen??','Echistic?','Echivalent','Echivalen??','Echivoc','Eclectism','Ecleraj',
'Ecleziarh','Ecleziast','Eclimetru','Eclips?','Ecliptic?','Eclis?','Ecluz?','Ecluzist','Ecluzist?','Ecofeedback',
'Ecogram?','Ecolog','Ecolog?','Ecolot','Ecometru','Econoam?','Econom','Economat','Economist','Economist?',
'Ecor?eu','Ecoscop','Ecosez?','Ecosistem','Ecosond?','Ecotip','Ecou','Ecpaia','Ecrazit?','Ecru',
'Ecruisaj','Ecstasy','Ectim?','Ectoderm','Ectoendoparazit?','Ectogenez?','Ectoparazit?','Ectoplasm?','Ecuadorian?','Ecuatorial',
'Ecvideu','Eczematoas?','Eczematos','Eczem?','Edam','Edec','Edecliu','Edelvais','Edem','Edentat',
'Edict','Edicul','Edificiu','Edil','Editorial','Editur?','Edulcorant','Efeb','Efect','Efectiv',
'Efedrin?','Efemer?','Efemerid?','Efendi','Efervescen??','Efet','Efetonin?','Eficien??','Eflorescen??','Efluviu',
'Eflux','Eforat','Efort','Efuziometru','Egalitarism','Egalitarist','Egalitarist?','Eghilet','Egid?','Egiptean?',
'Egipteanc?','Egiptolog','Egip?ian?','Eglog?','Egocentrism','Egoism','Egotism','Egrenat','Egret?','Egumen?',
'Eidetism','Einsteiniu','Elagaj','Elastic','Elastin?','Elastomecanic?','Elaterid','Eldorado','Eleat','Electorat',
'Electret','Electrician?','Electroacupunctur?','Electroacustic?','Electroanaliz?','Electrobuz','Electrocardiograf','Electrocardiogram?','Electrocardioscop','Electrocarist',
'Electrocaustic?','Electroc?ldur?','Electroceramic?','Electrochimograf','Electrochimogram?','Electrocinetic?','Electrocultur?','Electrod','Electrodiagnostic','Electrodiagnoz?',
'Electrodializ?','Electrodinam','Electrodinamic?','Electrodinamism','Electroencefalograf','Electroencefalogram?','Electrofiltru','Electroforegram?','Electroforez?','Electroglotograf',
'Electroglotogram?','Electrograf','Electrogravur?','Electroizolant','Electrolit','Electroliz?','Electroluminescen??','Electromagnet','Electromagnetism','Electromecanic?',
'Electrometru','Electromiograf','Electromiogram?','Electromobil','Electron-volt','Electronarcoz?','Electronic?','Electronist','Electronist?','Electronograf',
'Electronopunctur?','Electrooptic?','Electroosmoz?','Electropunctur?','Electroscop','Electrostatic?','Electro?oc','Electrotehnic?','Electrotonus','Electrotraumatism',
'Electrotropism','Electrovalen??','Electrum','Elefant','Elefantiazis','Elegan??','Element','Elen?','Elenism','Elenist',
'Elenist?','Elev','Elevatorist','Elev?','Elevez?','Elf','Elicoid','Extras','Extrasistol?','Extraterestr?',
'Extraterestru','Extravagan??','Extrem','Extremal?','Extrem?','Extremism','Extremist','Extremist?','Exuberan??','Ezerin?',
'Ezoterism','Factotum','Factur?','Facul?','Fading','Fado','Fag','Fagocit','Fagocitoz?','Fagot',
'Fagotist','Fagotist?','Faian??','Faim?','Fairplay','Falang?','Falangist','Falansterian?','Falansterianism','Fal?',
'Falbala','Falc?','Falconet','Falconiform','Fald','Falet','Falez?','Faliment','Falit','Falit?',
'Fals','Falset','Fal?','Familiarism','Familist','Familist?','Fanal','Fanaragiu','Fanariot','Fanariotism',
'Fanatic','Fanatic?','Fanatism','Fandango','Fandoseal?','Fandosit','Fandosit?','Fanerit','Fanerogam?','Fanfar?',
'Fanfaroan?','Fanfaronad?','Fantasm?','Fantast','Fantast?','Fant?','Fantom?','Fanto??','Fapt','Fapt?',
'Farad','Faradmetru','Farafastâc','Farandol?','Farb?','Fard','Fardat','Faretr?','Farfara','Farfasit',
'Farfasit?','Farfurioar?','Farfuriu??','Faringism','Faringit?','Faringolaringit?','Faringoscop','Fariseism','Fariseu','Farmacist',
'Farmacist?','Farmacolog','Farmacolog?','Farmacovigilen??','Farmazoan?','Farmec','Fars?','Fascicul','Fascicul?','Fascin?',
'Fascism','Fascist','Fascist?','Fasoleal?','Fasolic?','Fasonaj','Fasonat','Fasung','Fa??','Fata',
'Morgana','Fatalism','Fatalist','Fatalist?','Fat?','Fatum','Fa?ad?','Fa??','Fa?etat','Fa?et?',
'Fault','Faun?','Favorit','Favorit?','Favoritism','Favus','Faz?','Fazmetru','F?c?le?','F?c?luit',
'F?c?tur?','F?c?u','F?clioar?','F?cliu??','F?cut','F?ga?','F?g?d?u','F?g?duial?','F?g?duin??','F?g?r??eanc?',
'F?get','F?ge?el','F?in?','F?lcari??','F?lcea','F?l?uit','F?pta?','F?pta??','F?ptur?','F?ra?',
'F?râmat','F?râm?','F?râm?tur?','F?râmic?','F?râmi?at','F?râmi??','F?r?erot','F?t','F?tat','F?t?l?u',
'F?toi','F?tuc?','F?tu??','F??uial?','F??uit','F?z?ni??','Fâlfâit','Fâlfâitur?','Fâna?','Fânea??',
'Fânoas?','Fântân?','Fântânea','Fântânel','Fântânioar?','Fântâni??','Fârnâit','Fârtai','Fârtat','Fâs?',
'Fâsâial?','Fâsâit','Fâsâitur?','Fâstâceal?','Fâ?','Fâ?âial?','Fâ?âit','Fâ?âitur?','Fâ?ioar?','Fâ?nea??',
'Fâ??','Fâ?âial?','Fâ?âit','Fâ?i?oar?','Febr?','Febrifug','Fecalom','Fecioar?','Feciora?','Fecioreasc?',
'Fecioric?','Fecul?','Feculen??','Fecundat','Fedele?','Federalism','Federalist','Federalist?','Federat','Federvais',
'Fiertur?','Fierturic?','Fiest?','Figurant','Figurant?','Figur?','Figurin?','Fiic?','Fiin??','Filacter?',
'Filad?','Filaliu','Filament','Filantroap?','Filantrop','Filantropism','Filaria','Filarioz?','Filarmonic?','Filarmonist',
'Filarmonist?','Filat','Filatelist','Filatelist?','Filatur?','Fil?','Filde?','Filet','Fileu','Filial?',
'Filier?','Filigranist','Filigranolog','Filigranolog?','Filigranoscop','Filimic?','Filipic?','Filipinez','Filipinez?','Filistinism',
'Film','Filmfonograf','Filmotec?','Filodorm?','Filogenez?','Filogenist','Filogenist?','Filolog','Filolog?','Filomel?',
'Filotim','Filoxer?','Filozoaf?','Filozof','Filtraj','Filtrat','Filtru','Fil?','Final','Final?',
'Finalism','Finalist','Finalist?','Financiar?','Fin?','Finet','Finic','Finisaj','Fini?','Finit',
'Finitism','Finlandez','Finlandez?','Fiol?','Fiong','Fiord','Fioritur?','Firesc','Firet','Firfiric',
'Firicel','Firicic?','Firid?','Firimitur?','Firiz','Firmament','Firm?','Firmuli??','Firnis','Firoscoas?',
'Firoscos','Firu?','Fis?','Fisc','Fiscalism','Fistic','Fistul?','Fisur?','Fi??','Fi?c?',
'Fi?ic','Fi?iu','Fi?teic?','Fit','Fitil','Fitilist','Fitilist?','Fiting','Fitocenoz?','Fitocid',
'Fitofag','Fitogenez?','Fitoparazit','Fitopatolog','Fitopatolog?','Fitoterapeut','Fitoterapeut?','Fitotoxic','Fitotoxin?','Fi?uic?',
'Fiu','Fiule?','Fiu?','Fixaj','Fixativ','Fixism','Fixist','Fixist?','Fizic','Fizicalism',
'Fizicalist','Fizicalist?','Fizic?','Fizician?','Fiziocrat','Fiziocratism','Fiziolog','Fiziolog?','Fiziologist','Fiziologist?',
'Fizionomist','Fizionomist?','Fiziopatolog','Fiziopatolog?','Fizioterapeut','Flac?r?','Flacona?','Flagel','Flagelat','Flagran??',
'Flaimoc','Flajolet','Flamand','Flamand?','Flam?','Flambaj','Flamingo','Flamur?','Flanc','Flancgard?',
'Flanel?','Flanelu??','Flan??','Flash','Flashback','Fla?net?','Flaut','Flautist','Flautist?','Flavon?',
'Flax','Fl?c?iandru','Fl?c?ia?','Fl?c?u','Fl?c?u?','Fl?mânzic?','Fl?mânzil?','Fleac','Fleanc?','Fleandur?',
'Flea?c?','Flea??','Flebit?','Flec','Flecar?','Flec?real?','Flecule?','Flecu?te?','Flegmatism','Flegm?',
'Fleic?','Flenderi??','Fle??','Fle?c?ial?','Fle?c?it','Flexibil','Flexur?','Flic-flac','Flicten?','Flint',
'Flint?','Flintuli??','Flirt','Fli?','Flit','Floc','Floco?el','Floco?ic?','Flocul','Flogistic',
'Flogopit','Flor?','Flor?reas?','Floreal','Floret?','Floretist','Floretist?','Floricea','Floricultur?','Florii',
'Florilegiu','Florist','Florist?','Flori?oar?','Floroglucin?','Flotan?i','Flot?','Flotil?','Flox','Flu',
'Fluaj','Flud?','Fluen??','Fluid','Fluidifiant','Fluidizant','Fluiera?','Fluierat','Fluometru','Fluorescein?',
'Fluorescen??','Fluorimetru','Fluorin?','Fluoroscop','Fluoroz?','Fluorur?','Flu?turatic','Flu?turatic?','Flutura?','Fluturat',
'Fluturel','Fluviometru','Fluviu','Galaonul','Gal?','Galb','Galen?','Galenism','Galen?i','Galeopitec',
'Galer?','Galet','Galet?','Galiard','Galiard?','Galican?','Galicanism','Galic?','Galicism','Galiform?',
'Galimatias','Galiot?','Gali??','Gali?ian?','Galiu','Galofob','Galofob?','Galoman?','Galonat','Galop',
'Galopad?','Galoroman?','Galo?','Galvanism','Galvanometru','Galvanonarcoz?','Galvanoscop','Galvanotehnic?','Galvanotropism','Gama',
'Gamaglobulin?','Gam?','Gamb?','Gambet','Gambet?','Gambit','Gamel?','Gamet','Gametangiu','Gametofit',
'Gametogenez?','Gamogenez?','Gamopetal','Gamosepal?','Gana??','Gang','Gang?','Gangsterism','Ganoid','Garaj',
'Garajist','Garant','Garant?','Garan??','Garan?in?','Gar?','Gard','Gard?','Garderob','Garderobier?',
'Gardin?','Gardist','Garf','Gargar?','Gargariseal?','Gargarism','Gargui','Gargus?','Garmond','Garnet?',
'Garnierit','Garnisaj','Garnitur?','Garni??','Garnizoan?','Garoaf?','Garofi??','Garou','Garsonier?','Gasteropod',
'Gastrin?','Gastrit?','Gastroenterit?','Gastroenterolog','Gastroenterolog?','Gastronoam?','Gastronom','Gastroscop','Gastrul?','Ga??',
'Ga?c?','Ga?peri??','Gat','Gaterist','Gaucho','Gaur?','Gauss','Gavaj','Gavanos','Gavot?',
'Gay','Gaz','Gazd?','Gazel','Gazel?','Gazetar?','Gazet?','Gazet?ra?','Gazoduct','Gazolin?',
'Gazometru','Gazorni??','Gazoscop','G?g?u??','G?g?uz','G?g?uz?','G?ina?','G?in?','G?in?reas?','G?in?ri??',
'G?inu??','G?l?moz','G?l??ean?','G?l??eanc?','G?lbeaz?','G?lbejeal?','G?lbena?','G?lbenea','G?lbeneal?','G?lbenu?',
'G?lbenu??','G?lbini??','G?leat?','G?lu?c?','G?oaz?','G?r?fioar?','G?rdule?','G?rdurari??','G?rg?ri??','G?selni??',
'G?sit','G?teal?','G?tej','G?tit','G?uno?itur?','G?urea','G?urit','G?v?no?el','Gâdilat','Gâdil?tur?',
'Gâdilici','Gâfâial?','Gâfâit','Gâgâit','Gâgâitur?','Gâlc?','Gâlceav?','Gâlgâial?','Gâlgâit','Gâlgâitur?',
'Gâlm?','Gând','Gândac','Gând?cel','Gândirism','Gândirist','Gândirist?','Gângav','Gângav?','Gâng?veal?',
'Gângurit','Gânj','Gânsac','Gârbaci','Gârbi??','Gârl?','Gârlici','Gârli??','Gârne?','Gârni??',
'Gârni?et','Gâscari??','Gâsc?','Gâsc?ri??','Gâsculi??','Gât','Gâti??','Gâtlej','Gâtuitur?','Gâz?',
'Gâzuli??','Gâzu??','Geac','Gealat','Geal?','Geal?u','Geam','Geamal?','Geamandur?','Geamant?na?',
'Geam?t','Geamba?','Geamba?lâc','Geamblac','Geamgiu','Geamlâc','Gean?','Geant?','Gecko','Gel',
'Gelatin?','Gelato','Gelep','Gelivur?','Geloz?','Gem','Gem?','Gem?nari??','Gemul?','Gemule?',
'Gemut','Gen?','Genealogist','Genealogist?','General','Generalisim','Generalist','Generalist?','Generativism','Generativist',
'Generativist?','Generic','Genet?','Genetic?','Genetician?','Genetism','Genez?','Genist','Genitiv','Geniu',
'Genocid','Genol','Genom','Genotip','Gentilom','Gentuli??','Gentu??','Gen?ian?','Genulier?','Genunchi',
'Genunchier?','Geobotanic?','Gloab?','Gloat?','Glob','Globigerin?','Globin?','Globul?','Globulin?','Glockenspiel',
'Glod','Gloda?','Glodurari??','Glomerul?','Glon?','Glos?','Glosem','Glosematic?','Glosit?','Glota?',
'Glot?','Glucid?','Gluciniu','Glucocorticoid','Glucometru','Glucoz?','Glucozid?','Glug?','Glum?','Glumel?',
'Glutamin?','Glutein?','Gnais','Gnatostom','Gnom','Gnostic','Gnostic?','Gnosticism','Gnu','Goan?',
'Goang?','Goarn?','Godac','Godânac','Godet?','Godeu','Godevil','Godin?','Goeland','Goelet?',
'Gofraj','Gofrat','Gofreu','Gog','Gogoa??','Gogoloi','Gogonea','Gogori??','Gogo?ea','Gol',
'Golan?','Golanc?','Golaveraj','Gol?nea??','Gol?nel','Gol?ne?','Goldan?','Golf','Goliard','Golicic?',
'Golomoz','Gomaj','Gom?','Gomenol','Gomoas?','Gomos','Gonaci','Gonad?','Gonadotrop','Gona?',
'Gondol?','Gondolet?','Gondolier?','Gonflant','Gong','Gongorism','Gonidii','Goniometru','Goni??','Gonocit',
'Gonococ','Gonogenez?','Gopac','Gorgon?','Gorgonzola','Goril?','Gorjeanc?','Gornic','Gornist','Gorunet',
'Goruni?','Gospod?rioar?','Gospodin?','Gostat','Go?tin?','Got','Gotc?','Goz','Grab?','Grad',
'Gradat','Gradel','Gradient','Gradin?','Gradual','Graf','Grafem','Graffito','Grafic','Grafic?',
'Grafician?','Grafit','Grafolog','Grafolog?','Grafometru','Grafospasm','Graham','Grai','Grajd','Gram',
'Gramaj','Gramatic','Gramatic?','Gramatician?','Gramier?','Gramol?','Grandilocven??','Grandoman?','Granic','Granit',
'Grani??','Granivor?','Granodiorit','Granul?','Granulit','Granulocit','Granulocitoz?','Granulom','Grap?','Grapin?',
'Graptolit','Graset','Gravel?','Gravelit','Gravid?','Gravimetru','Gravur?','Gr?dea','Gr?din?','Gr?din?reas?',
'Gr?din?rit','Gr?dini??','Gr?dinu??','Gr?mad?','Gr?m?deal?','Gr?m?joar?','Gr?m?tic','Gr?pat','Gr?p?tur?','Grâu',
'Grâule?','Greac?','Grea??','Greblat','Grebl?','Grec','Grecism','Greco-catolic','Greco-oriental','Grecoaic?',
'Grecotei','Greement','Gref','Gref?','Gregarism','Greiera?','Greierel','Greieru?','Grej','Grena',
'Grenad?','Grenadin?','Grep','Grepfrut','Gresaj','Gre?','Gre?eal?','Greu','Grev?','Grevist',
'Grevist?','Gri','Griddipmetru','Grif?','Grij?','Grijit','Gril','Grilaj','Gril?','Grimas?',
'Grim?','Grimea','Grimelu??','Grimeur?','Grind','Grind?','Grindei','Grindel','Grindin?','Grindi?',
'Grinduli??','Grindu??','Grip?','Gripc?','Grisai','Gri?','Griv','Grizu','Grizumetru','Grizuscop',
'Grizutin?','Grizzly','Groap?','Groaz?','Grof','Grofi??','Grog','Grogren?','Groh?it','Groh?itur?',
'Grohot','Grohoti?','Grom','Gromovnic','Groom','Grop','Grop?reas?','Gropi?','Gropi??','Gropni??',
'Gropu?oar?','Gros','Grosisment','Gro?','Gro?i??','Grot?','Grotesc','Ground','Grozam?','Grui',
'Gruie?','Grumaz','Grund','Grunz','Grup','Grupaj','Grup?','Grupet','Grupule?','Gruzin?',
'Guaiac','Guanaco','Guanidin?','Guanin?','Guano','Guarana','Guarani','Guard','Gua??','Guatemalez',
'Guatemalez?','Gub?','Gudronaj','Guelf','Gugu?tiuc','Gui?at','Gui??tur?','Gula?','Gulera?','Gulerat',
'Gulerat?','Gulfstream','Gumaj','Gum?','Gumilastic','Gunoi','Gunoier?','Gunoit','Guraliv','Guraliv?',
'Gur?','Gurgui','Guri??','Gurluit','Gurmand','Gurmand?','Gurm?','Gurn?','Guru','Gurut',
'Guseu','Gust','Gust?ric?','Gu?at','Gu?at?','Gu??','Gu?uli??','Gutaperc?','Gut?','Gutoas?',
'Gutos','Gutui','Guturai','Guvernant?','Guvern?mânt','Guvid','Guz','Guzl?','Halen?','Half',
'Halieutic?','Halima','Halit','Halo','Halofit?','Halogenur?','Haloizit','Halometru','Halt?','Halter?',
'Halterofil','Halucinat','Halucinat?','Halucinoz?','Halva','Halvagiu','Ham','Hamac','Hamad?','Hamadriad?',
'Hamal','Hamalâc','Hamamelis','Hamei','Hami?i','Hamut','Hanap','Hanat','Hanâm?','Handbal',
'Handbalist','Handbalist?','Handicap','Handicapat','Handicapat?','Handral?u','Hang','Hangioaic?','Hangi??','Hangiu',
'Hanorac','Hans?','Hantel?','Hantru','Han??','Hanzel?','Haos','Hap','Hapc?','Haplea',
'Haplofaz?','Happening','Happy-end','Hara-para','Haraba','Harababur?','Harabagiu','Harachiri','Haraci','Haram',
'Haramba??','Haranc?','Harapnic','Harbuz','Harchin?','Hard','Hard','Rock','Harem','Hares',
'Haretism','Harghiteanc?','Harh?t','Harna?ament','Harp?','Harpist','Harpist?','Harpsicord','Har?a','Hart?',
'Har??','Har?i','Haruspiciu','Hasc?','Hasma?uchi','Haspel','Hassiu','Hasta?i','Ha?c?','Ha?i?',
'Ha?i?ism','Ha?m?','Ha?ur?','Hat','Hataia','Hati?erif','Ha?egana','Ha?egan?','Havaian?','Havaj',
'Havalea','Havan?','Havez?','Havr?','Havuz','Haz','Hazard','Hazna','Hazn?','H?buc',
'H?ci','H?d?rag','H?d?r?u','H?ini?oar?','H?inu??','H?it','H?ita?','H?ituial?','H?itu?c?','H?l?ciug?',
'H?m?ial?','H?m?it','H?m?itur?','H?meseal?','H?ulit','H?ulitur?','Hân??u','Hâr?','Hâr?u','Hârâial?',
'Hârâit','Hârâitur?','Hârb','Hârbu?','Hârc?','Hârcâial?','Hârcâit','Hârciog','Hârd?ia?','Hârd?u',
'Hârjoan?','Hârjoneal?','Hârle?','Hârlostea','Hâr?âit','Hâr?âitur?','Hârt?u','Hârtioar?','Hârtiu??','Hârtop',
'Hâr?oag?','Hârzob','Hâtr?','Hâtru','Hebefrenic','Hebefrenic?','Hecatomb?','Hecel?','Hecht','Hectograf',
'Hectogram','Hectolitru','Hectometru','Hectowatt','Hedonism','Hedonist','Hedonist?','Hegelian?','Hegelianism','Hegemonism',
'Hegir?','Heimatlos','Heiuri','Helanc?','Helcometru','Helcoz?','Hele?teu','Heliant','Heliantin?','Heliast',
'Heliocentral?','Heliocentrism','Heliofob','Heliofob?','Heliograf','Heliogravur?','Heliometru','Helioscop','Heliostat','Heliotactism',
'Heliotehnic?','Heliotehnician?','Heliotrop','Heliotropin?','Heliotropism','Helioz?','Helipot','Heliu','Heliu-3','Helmint',
'Helmintiaz?','Helmintosporioz?','Helofit?','Helve?i','Hem','Hemangiom','Hemartroz?','Hematemez?','Hematimetru','Hematin?',
'Hematit','Hematocel','Hematocheratoz?','Hematocrit','Hematocrom','Hematofag','Hematofag?','Hematoglobinometru','Hematolog','Hematolog?',
'Hematom','Hematopoiez?','Hematoporfirin?','Hematoscop','Hematoxilin?','Hematoz?','Hemeralop','Hemeralop?','Hemerolog','Hemerolog?',
'Hemerotec?','Hemiceluloz?','Hemiciclu','Hemicriptofit?','Hemielitr?','Hemimel','Hemimel?','Hemin?','Hemiparez?','Hemiplegic',
'Hemiplegic?','Hemocianin?','Hemocit','Hemocitometru','Hemocultur?','Hemodiagnostic','Hemodializ?','Hemodinamic?','Hemodinamometru','Hemogenic',
'Hemogenic?','Hemoglobin?','Hemoglobinometru','Hemogram?','Hemolimf?','Hidrocentral?','Hidrocentru','Hidrochimist','Hidrochimist?','Hidrochinon?',
'Hidrocinematic?','Hidrocor?','Hidrocosmetic?','Hidrocultur?','Hidrodinamic?','Hidrofil?','Hidrofit?','Hidrofob','Hidrofob?','Hidroftalmic',
'Hidroftalmic?','Hidrogel','Hidrogenoliz?','Hidrogeolog','Hidrogeolog?','Hidrograd','Hidrograf','Hidrograf?','Hidroizohips?','Hidrolaz?',
'Hidroliz?','Hidrolog','Hidrolog?','Hidromasaj','Hidromecanic?','Hidromel','Hidrometru','Hidromodul','Hidronefroz?','Hidronim',
'Hidroniu','Hidropedez?','Hidropic','Hidropic?','Hidropicoas?','Hidropicos','Hidropneumatic','Hidropneumotorax','Hidroponic?','Hidrosadenit?',
'Hidroscal?','Hidrosfer?','Hidrosol','Hidrostatic?','Hidrotehnic?','Hidrotehnician?','Hidroterapeut','Hidrotropism','Hidroxid','Hidroxil',
'Hidrur?','Hien?','Hienid?','Hieratism','Hierofant','Hieroglif?','Hif?','Higrofit?','Higrograf','Higrogram?',
'Higrom?','Higrometru','Higroscop','Higrostat','Hil','Hilea','Hilozoism','Hilozoist','Hilozoist?','Himer?',
'Hindi','Hindichi','Hinduism','Hinduist','Hinduist?','Hindus','Hindus?','Hindustan?','Hinterland','Hinteu',
'Hiol?','Hiperalgezic','Hiperalgezic?','Hiperbat?','Hiperbol?','Hiperboloid','Hiperboreu','Hipercheratoz?','Hiperfrecven??','Hiperhidroz?',
'Hiperinsulinism','Hipermetrop','Hipermetrop?','Hipermetropism','Hipermetru','Hipernim','Hiperostoz?','Hiperparatiroidism','Hiperparazit','Hiperparazit?',
'Hipersunet','Hipertensiv','Hipertensiv?','Hipertiroidian?','Hipertiroidism','Hipertricoz?','Iertat','Ierunc?','Ie?eanc?','Ie?ind',
'Ie?it','Ie?itur?','Iet?cel','Iez?tur?','Iezuit','Iezuitism','Ifos','Ifosard','Ifosard?','Igien?',
'Igienist','Igienist?','Igli??','Iglu','Ignam?','Ignat','Ignipunctur?','Ignorant','Ignorant?','Ignoran??',
'Ignoratio','Elenchi','Iguan?','Ihneumonid','Ihtiocol','Ihtiofaun?','Ihtiol','Ihtiolit','Ihtiolog','Ihtiolog?',
'Ihtiornis','Ihtioz?','Ihtiozic','Ihtiozic?','Ii?oar?','Ikebana','Il?u','Ilean?','Ilegalist','Ilegalist?',
'Ileit?','Ileocolit?','Ileus','Ilfoveanc?','Ilic','Ilicel','Ilir?','Ili?','Illium','Ilmenit',
'Ilogism','Ilot','Ilotism','Iluminat','Iluminism','Iluminist','Iluminist?','Ilustrat?','Ilustrativism','Iluzionism',
'Iluzionist','Iluzionist?','Im','Imagism','Imagist','Imagist?','Imagistic?','Imago','Imam','Imamat',
'Imambaialdî','Imamea','Imanentism','Imanentist','Imanentist?','Imanen??','Ima?','Imaterialism','Imaterialist','Imaterialist?',
'Imbecil','Imbecil?','Imbold','Imbroglio','Imigrant','Imigrant?','Iminei','Iminen??','Imobil','Imobilism',
'Imobilist','Imobilist?','Imoralism','Imoralist','Imoralist?','Imortel?','Impacien??','Impact','Impala','Impas',
'Impedan??','Impediment','Impeniten??','Imperativ','Imperial?','Imperialism','Infinit','Infinitism','Infinitiv','Infirm',
'Infirm?','Infirmier?','Infix','Inflorescen??','Influen??','Influx','Inforenergetic?','Informatic?','Informatician?','Inframicrob',
'Inframicrobiolog','Inframicrobiolog?','Infraro?u','Infrastructur?','Infrasunet','Infravirus','Infundibul','Ingambament','Ingenu?','Ingerin??',
'Inginera?','Inginer?','Ingrat','Ingrat?','Ingredient','Ingredien??','Inim?','Inimioar?','Inimoi','Inimuc?',
'Inimu??','Ininteligen??','Ini??','Ini?ial?','Ini?iat','Ini?iat?','Ini?iativ?','Inocen??','Inorog','Inox',
'Input','Ins','Insect?','Insecticid','Insectifug','Insectofungicid','Insert','Insign?','Insignifian??','Insisten??',
'Insolen??','Inspectorat','Instantaneu','Instan??','Instinct','Institut','Institu?ionalism','Instructaj','Instrument','Instrumentalism',
'Instrumentalist','Instrumentalist?','îngropat','îngurzitur?','înh?mat','înjugat','înjunghietur?','înjur?tur?','înmurgit','înn?ditur?',
'înnegreal?','înnod?tur?','înnoptat','înot','înotat','îns?ilat','îns?il?tur?','îns?mân?at','îns?rcinat','înscris',
'însemn?ric?','înserat','înso?it','înstr?inat','însurat','însur??el','înt?ritur?','întâlni?','întâlnitur?','întins',
'întinsur?','întors','întors?tur?','întorsur?','întortochetur?','întredeschiz?tur?','întregol','între?inut','între?inut?','Jen?',
'Jep','Jerb?','Jerseu','Jertf?','Jertfelnic','Jet','Jetel?','Jeteu','Je?','Jgheab',
'Jghebule?','Jiana','Jian?','Jianca','Jianc?','Jidanc?','Jid?ncu??','Jidov','Jigal?','Jig?real?',
'Jighiu??','Jigl?','Jigou','Jil?veal?','Jiletc?','Jilip','Jil?','Jimb?tur?','Jimbl?','Jimbl?reas?',
'Jinduial?','Jinti??','Jintuial?','Jintuit','Jip','Jirovin?','Jitni??','Jiu-jitsu','Jivin?','Jivraj',
'Jlip','Jnepeni?','Joac?','Joant?','Joard?','Job','Joc','Jocheu','Jocot','Jocule?',
'Jocu?','Jofr?','Jogging','Joi','Joiana','Joian?','Joim?ri??','Joj?','Jonc?','Jordi??',
'Josean?','Jot?','Jubart?','Jubileu','Jucat','Juc?rea','Juc?ric?','Juc?rioar?','Judecat?','Judec?tora?',
'Judec?toreas?','Jude?','Judo','Jugastru','Jug?na?','Jug?nel','Jug?rit','Jugendstil','Jujeu','Juke-box',
'Julep','Julf?','Julitur?','Jumar?','Jumel?','Jumping','Jumuleal?','Jumulit','Junc','Juncan?',
'Juncanc?','Junc?','Junc?na?','Junctur?','Juncu?','Juncu??','Junel','Junela?','Junghi','Junghietur?',
'Jungl?','Juni','Junimism','Junimist','Junimist?','Juninc?','Junioar?','Lactobioz?','Lactodensimetru','Lactoduc',
'Lactoferment','Lactofiltru','Lactoflavin?','Lactofruct','Lactogenez?','Lactometru','Lactoz?','Lacun?','Lad?','Ladin?',
'Lady','Laf','Lagun?','Laicism','Lainic','Lainic?','Laitmotiv','Lalea','Lama','Lamaism',
'Lamaist','Lamaist?','Lamarckism','Lamarckist','Lamarckist?','Lamartinist','Lam?','Lamb?','Lambda','Lambert',
'Lamblia','Lambliaz?','Lambriu','Lamel?','Lamelibranhiat?','Lamento','Laminaj','Laminaria','Laminat','Lamin?',
'Laminorist','Laminorist?','Lampagiu','Lampas','Lamp?','Lampist','Lamur?','Lanametru','Lancasterian?','Land',
'Land?','Landgraf','Landgrafiat','Landou','Landras','Land?aft','Landtag','Langust?','Lanital','Lanolin?',
'Lansaj','Lanset?','Lantanid?','Lantern?','Lanternou','Lan?','Lan?et?','Lan?ug','Lanugo','Lao?ian?',
'Lapalisad?','Laparoscop','Lapicid','Lapidariu','Lapiez','Lapili','Lapis','Lapislazuli','Lapon?','Lapovi??',
'Lapsus','Lap?i','Larariu','Lard','Larg','Larghetto','Largo','Lari','Lariform?','Laringit?',
'Laringolog','Laringolog?','Laringoscop','Laringospasm','Laringostroboscop','Larm?','Larv?','Larvicid','Laset?','Lasou',
'Lastex','Lastic','Lastr?','La?','La??','Lat','Laten??','Laterit','Latex','Laticlav?',
'Latifundiar?','Latifundiu','Latin?','Latinism','Latinist','Latinist?','Latrin?','Latur?','La?','Lau',
'Laudanum','Laud?','Lutein?','Luteran?','Luteranism','Lute?iu','Luth','Lutist','Lutist?','Lutr?',
'Lutru','Lux','Luxemburghez','Luxemburghez?','Luxmetru','Luxur?','Luxurian??','Mac','Maca','Macac',
'Macadam','Macagiu','Macairodus','Macam?','Macara','Macaragist','Macaragi??','Macaragiu','Macaroan?','Macaronad?',
'Macaronism','Macat','Macaz','Macedonean?','Macedoneanc?','Macedoromân?','Macedoromânc?','Mach','Machet?','Machetist',
'Machetist?','Machiaj','Machiavelism','Machiaverlâc','Machior?','Machism','Machist','Machist?','Machmetru','Macioal?',
'Macl?','Macrameu','Macrobiotic?','Macroblast','Macrocefal','Macrocefal?','Macrocit','Macroclim?','Macrocosm','Macrocosmos',
'Macroelement','Macroflor?','Macrogamet','Macromolecul?','Macronucleu','Macropod','Macroseism','Macrosistem','Macrostructur?','Macrou',
'Maculatur?','Madam?','Madea','Madlen?','Madmoazel?','Madon?','Madrier?','Madrigal','Madrilen?','Maestr?',
'Maestru','Mafiot','Mafiot?','Mag','Magazinaj','Magaziner?','Magazioar?','Magazioner?','Magenta','Magherni??',
'Maghiar?','Maghiarism','Magician?','Magism','Magistral?','Magistrat','Magistratur?','Magistru','Magmatism','Magm?',
'Magna','Cum','Magnaliu','Magnat','Magnet','Magnetism','Magnetit','Magnetit?','Magnetoflex','Magnetograf',
'Magnetogram?','Magnetohidrodinamic?','Magnetometru','Magnetooptic?','Magnetopauz?','Magnetoscop','Magnetosfer?','Magnetostatic?','Magnetotec?','Magnetotropism',
'Magnetou','Magnezit','Magnezit?','Magneziu','Magnico','Magnificen??','Magniflex','Magno','Magot','Mahala',
'Mahalagioaic?','Mahalagism','Mahalagi??','Mahalagiu','Maharajah','Maharani','Mahdism','M?m?lig?','M?m?ligoi','M?m?ligu??',
'M?m?ru??','M?mic?','M?mi??','M?mi?ic?','M?muc?','M?mucu??','M?mulic?','M?muli??','M?mu?oar?','M?mu??',
'M?n?stioar?','M?ng?l?u','M?nt?lu??','M?nunchi','M?nunchia?','M?nunchiule?','M?nu??','M?raz','M?r?cina?','M?r?cinet',
'M?r?cini?','M?r?mioar?','M?r?mu??','M?r?ra?','M?rfu?oar?','M?rg?rit','M?rg?rit?','M?rg?rit?ra?','M?rg?rit?rel','M?rgea',
'M?rgelu??','M?rgelu??','M?rghil?','M?rgina?','M?rgina??','M?rginu??','M?rgioar?','M?ri','M?rit','M?ritat',
'M?riti?','M?riu??','M?r?ân?','M?runta','M?run?elul','M?run?i?','M?run?it','M?run?u?','M?sai','M?s?ri??',
'M?scar?','M?sc?real?','M?sc?rici','M?sea','M?selari??','M?selu??','M?slag','M?slin?','M?sluial?','M?soi',
'M?surat','M?sur?','M?su??','M?t?cin?','M?t?sic?','M?t?uz','M?tc?l?u','M?tr?gun?','M?trea??','M?tri??',
'M?turat','M?tur?','M?tur?tur?','M?turea','M?turoi','M?tu??','M?tu?ic?','Mâgla?','Mâgl?','Mâgliseal?',
'Mâl','Mâlitur?','Mânaci','Mâna?','Mânat','Mân?','Mân??tergur?','Mân?tarc?','Mân?tur?','Mâncat',
'Mânc?cioas?','Mânc?cios','Mânc?ric?','Mânc?rici','Mânc?tur?','Mânc?u','Mând?lac','Mândr?','Mândri?oar?','Mândrulean?',
'Mândrulic?','Mândruli??','Mânecat','Mânec?','Mânecu??','Mânjeal?','Mânjitur?','Mântuial?','Mântuin??','Mântuitorul',
'Mântu?','Mânuri??','Mânu?i??','Naufragiu','Nauplius','Nautic?','Nautil','Nav?','Navet?','Navetist',
'Navetist?','Navigraf','Navlu','Navomodel','Navomodelism','Navomodelist','Navomodelist?','Nazal?','Nazism','Nazist',
'Nazist?','Nazuri','N?b?daic?','N?b?d?i','N?boi','N?buc','N?bu?eal?','N?cl?ial?','N?drag','N?dr?gel',
'N?duf','N?du?eal?','N?fram?','N?fr?mioar?','N?fr?mi??','N?fr?mu??','N?furic?','N?gar?','N?g?ru?','N?imeal?',
'N?imit','N?imit?','N?jit','N?luc?','N?luceal?','N?mol','N?past?','N?patc?','N?pârc?','N?pârstoac?',
'N?pârstoc','N?prasn?','N?prasnic','N?prasnic?','N?prui','N?rav','N?r?veal?','N?rtil?','N?ruitur?','N?sad?',
'N?s?dit','N?s?il?','N?s?udeanc?','N?scoceal?','N?scocitur?','N?scut','N?scut?','N?soi','N?strap?','N?stura?',
'N?sturel','N?suc','N?su?','N??ea','N??el','N??ic','N??ic?','N??icu??','N??it','N?t?flea??',
'N?t?fle?','N?t?r?u','N?t?roaic?','N?tâng','N?tâng?','N?uceal?','N?ut','N?val?','N?valnic','N?v?dit',
'N?vârlii','N?vod','N?vrap','N?z?real?','N?z?ritur?','N?zuin??','Nea','Nepoat?','Nepot','Nepotism',
'Nepo?ea','Nepo?el','Nepreget','Neprev?zut','Neprofesionist','Neprofesionist?','Neptunism','Neptuniu','Neputin??','Ner?suflat',
'Nerecuno?tin??','Neregul?','Nereid?','Nereu?it?','Neroad?','Nerod','Nerv','Nervatur?','Nervism','Nervist',
'Nervist?','Nervur?','Nes','Nesa?','Nes?buin??','Nes?r?tur?','Nesfâr?it','Nesiguran??','Nesim?it','Nesocotin??',
'Nesp?lat','Ne?ans?','Ne?tiin??','Netezi?','Netoat?','Netot','Ne?','Neum?','Neurastenic','Neurastenic?',
'Neurin?','Neurocit','Neurofibromatoz?','Neuroleptic','Neurolimf?','Neurolog','Neurolog?','Neurom','Neuroplegic','Neurotrop',
'Neutrino','Nev','Nevast?','Nev?stuic?','Nev?zut','Nevertebrat?','Nevestic?','Nevoin??','Nevolnic','Nevolnic?',
'Nevrax','Nevrica','Nevrit?','Nevrom','Nevropat','Nevropat?','Nevrotic','Nevrotic?','Nevroz?','Newtonian?',
'Nex','Nicaraguan?','Nichel','Nichelaj','Nichelin?','Nichipercea','Nicochera','Nicotin?','Nicotinism','Nicoval?',
'Nicrom','Nictalop','Nictalop?','Nigerian?','Nigrozin?','Nihilism','Nihilist','Nihilist?','Nilgau','Nimb',
'Nimbostratus','Nimbus','Nimereal?','Nimf?','Nimfoman?','Nimic','Nimitez','Ning?u','Niobiu','Niplu',
'Nipon?','Nipral?','Nirvana','Nisetru','Nisfia','Nisip','Nisipari??','Nisiparni??','Nisipi?','Nistagmus',
'Ni?angiu','Oal?','Oar?','Oarecic?','Oasp?t?','Oaz?','Obad?','Obcin?','Obedien??','Obel?',
'Obelisc','Oberec','Oberliht','Ober?al','Obial?','Obicei','Obid?','Obiect','Obiectiv','Obiectivism',
'Obielu??','Obi?nuin??','Obi?nuit','Oblanic','Oblânc','Oble?','Oblic?','Obliga','Oblig?','Obligean?',
'Oblojeal?','Oblomovism','Oblona?','Oboi','Oboist','Oboist?','Obol','Oborean?','Oboroc','Oboseal?',
'Obot','Obra?','Obraz','Obr?jel','Obr?znic?tur?','Obrinteal?','Obrintitur?','Obscurantism','Obscurantist?','Obsedat',
'Obsedat?','Obsig?','Obsolescen??','Obstacol','Obstetric?','Obstetrician?','Obstruc?ionism','Obstruc?ionist','Pajur?','Pakistanez',
'Pakistanez?','Pal','Paladiu','Palafit?','Palanc?','Pala?c?','Palat','Palatal?','Palatinat','Palatit?',
'Palatogram?','Palavragioaic?','Palavragiu','Palavr?','Pal?','Palc?','Paleantrop','Paleoantropolog','Paleoantropolog?','Paleoastronaut',
'Paleoastronautic?','Paleobotanic?','Paleobotanist','Paleobotanist?','Paleoclim?','Paleoetnolog','Paleoetnolog?','Paleogeofizic?','Paleograf','Paleograf?',
'Paleolitic','Paleontolog','Paleontolog?','Paleoslav?','Paleosol','Paleoteriu','Paleozoic','Paleozoolog','Paleozoolog?','Palestinian?',
'Palestr?','Palet?','Pali','Paliag','Paliativ','Palici','Palimpsest','Palinc?','Palindrom','Palingenez?',
'Palisad?','Palisaj','Palisandru','Palium','Palm','Palmac','Palmares','Palmatur?','Palm?','Palmet?',
'Palmier?','Palmiped','Palmitat','Palmitin?','Palograf','Palogram?','Palo?','Palp?','Palpit','Palplan??',
'Paltona?','Palud?','Paludic','Paludism','Paludolog','Paludolog?','Paludrin?','Palux','Pambriu','Pamflet',
'Pamfletist','Pamfletist?','Pampas','Panacagiu','Panaceu','Panachid?','Panacod','Panafricanism','Panahid?','Panama',
'Panamericanism','Panamericanist','Panamericanist?','Panamez','Panamez?','Panari?iu','Pana?','Pan?','Pancalism','Pancart?',
'Pancov?','Pancra?iu','Pancreas','Pancreatin?','Pancreatit?','Panda','Pandant','Pandantiv','Pandeism','Pandela?',
'Pandemoniu','Pandit','Pandor?','Panegiric','Panegirist','Panel','Panelenism','Panelenist','Panelenist?','Panera?',
'Pangea','Pangenez?','Pangermanic','Pangermanic?','Pangermanism','Pavat','Pav?z?','Pavea','Pavecerni??','Paviment',
'Pavlichian?','Pavlichianc?','Pavlovism','Pavlovist','Pavlovist?','Pavoaz','Pazarlâc','Pazarnic','Paz?','Paznic',
'Pazvangiu','Pazvant','Pazvantlâu','Pazvantoglu','P?cal?','P?cat','P?c?leal?','P?c?lici','P?c?lit','P?c?litur?',
'P?c?neal?','P?c?nit','P?c?nitur?','P?corni??','P?cuin?','P?cur?','P?cur?ra?','P?cur?rel','P?cur?rit','P?cur?ri??',
'P?ducel','P?ducherni??','P?dur?rit','P?durean?','P?dureanc?','P?duri??','P?ft?lu??','P?gân?','P?gânism','P?guba?',
'P?guba??','P?h?ra?','P?h?rel','P?h?rniceas?','P?h?rnicel','P?h?ru?','P?h?ru?','P?ienjeni?','P?injeni??','P?ioar?',
'P?ioas?','P?i?','P?iu?','P?iu?c?','P?iu?','P?l?mid?','P?l?rioar?','P?l?riu??','P?l?vatic','P?l?vr?geal?',
'P?l?vr?git','P?lincu??','P?litur?','P?lma?','P?lmi??','P?lmu??','P?lo?el','P?ltina?','P?ltinel','P?ltini?',
'P?m?tuf','P?mânt','P?mânteanc?','P?mântiu','P?mân?el','P?mânzalc?','P?nur?','P?nu??','P?nu?i??','P?p?l?u',
'P?p?lud?','P?p?rad?','P?pic?','P?puric?','P?puri?','P?pu??','P?pu?easca','P?pu?ic?','P?pu?oi','P?rangin?',
'P?ra?','P?r?gineal?','P?r?let','P?r?lu??','P?r?situr?','Ramolit?','Ramp?','Ramur?','Ran?','Ranch',
'Ranchiun?','Randalin?','Randament','Rand?','Ranforsaj','Ranfort','Rang','Rang?','Rani??','Rapakiwi',
'Rapanghel','Rapel','Rapid','Rapier?','Rapi??','Raport','Rapsod','Rapt','Raptus','Rar?',
'Rari??','Ras','Ras?','Rascolnic','Rascolnic?','Rasism','Rasist','Rasist?','Rasol','Rasoleal?',
'Rast','Rastel','Rastru','Ra?c?','Ra?chet?','Ra?el','Ra?pel','Ratat','Rat?','Rate?',
'Rateu','Raticid','Ratier?','Rating','Ra??','Ra?c?','Ra?ionalism','Ra?ionalist','Ra?ionalist?','Ra?ionament',
'Ravac','Ravagiu','Raven?','Raz','Razan??','Raz?','Razmot','Razn?','Raznocin?i','R?boj',
'R?bufneal?','R?bufnitur?','R?buial?','R?c?nel','R?ceal?','R?chit?','R?chiti?','R?chi?ic?','R?cil?','R?cit',
'R?citur?','R?cnet','R?coreal?','R?covin?','R?cule?','R?cu?c?','R?da?c?','R?d?cin?','R?d?cini?','R?d?cinoas?',
'R?ftule?','R?fuial?','R?gaz','R?get','R?gilat','R?gu?eal?','R?mas','R?m??ag','R?m??eal?','R?m??i??',
'R?murea','R?muri?','R?p?ial?','R?p?it','R?p?itur?','R?pciug?','R?pitur?','R?posat','Risip?','Risling',
'Ri?c?','Ritidom','Ritm','Ritmic?','Ritornel?','Ritual','Ritualism','Ritualist','Ritualist?','Ri?',
'Ri?uit','Rival','Rival?','Rivalt?','Rivanol','Rivier?','Riz','Rizac?','Rizeafc?','Rizic',
'Rizicultur?','Rizoctonioz?','Rizoderm?','Rizoid','Rizom','Rizopod','Rizosfer?','Rizoto','Roab?','Roat?',
'Rob','Robanc','Rob?','Robinet','Robinsonad?','Robot','Robot?','Roboteal?','Robotehnic?','Robotic?',
'Robotit','Roburit','Roc','Rocad?','Rocarni??','Roc?','Rochioar?','Rochi??','Roco?ea','Rod',
'Rodaj','Rodan??','Rodenticid','Rodeo','Rodin?','Rodioar?','Rodiu','Rodocrozit','Rodonit','Rodopsin?',
'Roentgeniu','Rofii','Rogojin?','Rogoz','Rogozi?','Rohatc?','Roi','Roib','Roib?','Roini??',
'Roit','Rojdanic','Rol','Rol?','Rolfilm','Rolgang','Rom','Roman?','Romancero','Romancier?',
'Romanist','Romanist?','Romanistic?','Romani??','Roman??','Romantic','Romantic?','Romantism','Roman??','Româna?',
'Român?','Românc?','Româncu??','Româneasc?','Românism','Romb','Romboedru','Romboid','Rond','Rondel',
'Rondel?','Rondino','Rondo','Rondou','Rongalit','Ronjant','Ron??ial?','Ron??it','Ropot','Ros?tur?',
'Rosbif','Rosbrat','Rospisc?','Rost','Rostogol','Rostogolit','Rostopasc?','Rostru','Ro???ea','Ro?cat',
'Ro?c?','Ro?cov','Ro?cov?','Ro?eal?','Ro?ea??','Ro?ioar?','Ro?tei','Ro?u','Sabat','Sabin?',
'Sabinism','Sabi??','Sablaj','Sablant','Sablez?','Sabord','Sabordaj','Sabotaj','Sabreta?','Sac',
'Saca','Sacad?','Sacagiu','Sacâz','Sacerdot','Sacerdo?iu','Sacnasiu','Sacos','Saco??','Sacou',
'Sacovi??','Sacrament','Sacrificiu','Sacrilegiu','Sacrum','Sacul?','Sad','Sad?','Sadin?','Sadism',
'Saducheism','Saducheu','Safari','Safeu','Safism','Saftea','Safterea','Saga','Sagn?','Sago',
'Sagum','Saharian?','Sahel','Saiga','Saigiu','Saint-bernard','Sal','Salahorit','Salam','Salamalec',
'Salamandr?','Salariat','Salariat?','Salariu','Salat?','Salatier?','Sal?','Salband?','Salb?','Salc?',
'Salcâm','Salep','Salepgiu','Saleu','Salicilat','Salicilin?','Salieni','Salin?','Salinometru','Salipirin?',
'Salivat','Saliv?','Salmiac','Salmonel?','Salmoneloz?','Salmonid','Salol','Salonard','Salonard?','Salona?',
'Salopet?','Salpetru','Salpingit?','Salpingoovarit?','Salpingoscop','Salt','Saltanat','Saltea','Saltelu??','Saltimbanc',
'Sal??','Salut','Salvamarist','Salvamont','Salvamontist','Salvamontist?','Salv?','Salvconduct','Sama','Samar?',
'Samaritean?','Samariu','Sam?','Samb?','Sambo','Samc?','Same?','Samni?i','Samoan?','Samoed',
'Samoed?','Suspensoid','Suspinat','Su??','Sutan?','Suta?','Sut?','Suti?oar?','Sutur?','Suvac',
'Suveic?','Suveicu??','Suvelni??','Suveran?','Svastic?','Swing','?','?','?','?a',
'?abac?','?abana','?ablonism','?abot?','?acal','?ag?','?ah','?ahin?ah','?ahist','?ahist?',
'?ahzadea','?ai','?aic?','?aidaj','?al','?aland','?alanj','?al?u','?alg?u','?alup?',
'?alupist','?alvaragiu','?alvari','?am','?amanism','?ambran?','?amoa','?amot?','?ampan?','?ancroid',
'?ancru','?andrama','?ans?','?ansonet?','?ansonetist','?ansonetist?','?ansonier?','?antaj','?antajist','?antajist?',
'?antez?','?antierist','?antierist?','?antung','?an?','?ap?','?apcaliu','?apc?','?apirograf','?apou',
'?araban?','?arad?','?arampoi','?aret?','?arg','?ariaj','?arj?','?arlatanism','?arl?','?arlot?',
'?arm','?arnier?','?arpant?','?art','?asiu','?asla','?a?lâc','?atr?','??lu?','??n?ule?',
'??n?urel','??tr?reas?','??tru??','?â?âit','?chioap?','?chiop?tur?','?coal?','?col?ri??','?edin??','?edin?oman?',
'?edit?','?ef','?ef?','?eic','Tahograf','Tahometru','Taht','Taic?','Taifas','Taifet',
'Taiga','Taikonaut','Taim-aut','Tain?','Taini??','Talab?','Talamus','Talang?','Talant','Talasogenez?',
'Tala?','Tala?c?','Talaz','Tal?','Talâm','Talc','Talcioc','Talcoz?','Talc?ist','Talent',
'Talerist','Talerist?','Talgera?','Talhâ?','Talhâ?ciu','Taliu','Talme?-balme?','Talmud','Talmudism','Talmudist',
'Talmudist?','Talofit?','Talonaj','Talonet?','Talp?','Talpin?','Talus','Taluz','Talveg','Tam-tam',
'Tamarisc?','Tamarix','Tamazlâc','Tamâ?','Tambuchi','Tamburin?','Tamponament','Tana','Tanagra','Tanaj',
'Tanana','Tananica','Tanant','Tanat','Tanatogenez?','Tan?t','Tanc','Tanchet?','Tanchist','Tancodrom',
'Tandalu??','Tandem','Tanea','Tangaj','Tangara','Tangent?','Tangen??','Tangou','Tantal','Tantalit',
'Tanti','Tantiem?','Tantrism','Tanzanian?','Taoism','Taol?','Tapaj','Tapangea','Tap?','Tapet',
'Tapeur?','Tapioc?','Tapo?nic','Tapur?','Tarabagiu','Tarab?','Tarabostes','Tarabulus','Tarac','Taraf',
'Taragot','Taragotist','Tarama','Taranc?','Tarantel?','Tarantul?','Tarapana','Tarapangiu','Tarara','Tar?',
'Tardigrad','Targ?','Tarif','Tarisfat','Tarla','Tarni??','Taroc','Tarod','Tars','Tartaj',
'Tartan?','Tart?','Tartin?','Tartori??','Tartraj','Tartrat','Tartru','Tartufism','Tescovin?','Tesla',
'Tesl?','Test','Testaceu','Testament','Testea','Testemel','Testicul','Testimoniu','Te?cherea','Te?itur?',
'Tetanism','Tetanos','Tet?','Tetea','Teterist','Tetier?','Tetin?','Tetra','Tetrachen?','Tetraciclin?',
'Tetraclorur?','Tetracord','Tetradrahm?','Tetraedrit','Tetraedru','Tetraevanghel','Tetragram?','Tetrahidronaftalin?','Tetralin?','Tetrametru',
'Tetraonid?','Tetrapod','Tetrarh','Tetrarhat','Tetrasilab','Tetratlonist','Tetratlonist?','Tetrea','Tetrod?','Teu',
'Teug?','Tevatur?','Tex','Texoprint','Text','Textolit','Textolog','Textolog?','Textur?','Tez?',
'Tezism','Tezist','Tezist?','Thailandez','Thailandez?','Thalidomid?','Tiamin?','Tiar?','Tibet','Tibetan?',
'Tibia','Tic','Tic?ial?','Tic?it','Tic?loas?','Tic?los','Tichet','Tichiu??','Tifdruc','Tific',
'Tific?','Tifl?','Tiflit?','Tiflocolit?','Tiflograf','Tiflotehnic?','Tifobaciloz?','Tifos','Tig?i??','Tighel',
'Tighelit','Tignafes','Tigres?','Tigroaic?','Tigru','Tigv?','Tihn?','Tihneal?','Tij?','Tild?',
'Tiliaceu','Tilinc?','Tilincu??','Tili?c?','Timariot','Timbru','Timf','Timin?','Timi?eanc?','Timi?oreanc?',
'Timleac','Timoftic?','Timol','Timon?','Timp','Timpanism','Timpanist','Timpanist?','Timpanit?','Timus',
'Tin?','Tinctur?','Tind?','Tindu??','Tineret','Ultrastructur?','Ultrasunet','Ultravirus','Uluc','Uluc?',
'Uluial?','Umanism','Umanist','Umanist?','Umanitarism','Umanitarist','Umanitarist?','Umanoid','Umanoid?','Umbel?',
'Umbelifer?','Umblat','Umbl?tur?','Umblet','Umbral','Umbr?','Umbrel?','Umbrelu??','Umbri?','Umbri?oar?',
'Umbri??','Umera?','Umezeal?','Umfl?tur?','Umidometru','Umilin??','Umilit','Umlaut','Umorist','Umorist?',
'Umplut','Umplutur?','Unchi','Unchia?','Uncrop','Uncropeal?','Uncropel','Undametru','Und?','Undit',
'Undi??','Undrea','Unealt?','Unghi','Unghioar?','Unghi?oar?','Unghiu??','Unguent','Ungulat','Unguligrad',
'Unguligrad?','Ungura?','Ungureanc?','Ungureasc?','Ungurism','Unguroaic?','Unicat','Uniform?','Unionism','Unisonan??',
'Unit','Unitarianism','Univalent','Univers','Universal','Universalii','Universalism','Universiad?','Uns','Unt',
'Untier?','Untur?','Ununbiu','Ununhexiu','Ununoctiu','Ununpentiu','Ununquadiu','Ununseptiu','Ununtriu','Upercut',
'Uracil','Uralit','Uranin?','Uraninit','Uranism','Uranit','Uraniu','Uraniu-238','Uranotil','Urat',
'Ur?','Ur?tur?','Urât','Urbanism','Urbanist','Urbanistic?','Urbariu','Urcat','Urceol','Urciora?',
'Urcioru?','Urcu?','Urd?','Urdini?','Urdu','Urecheal?','Urecheat','Urecheat?','Urechea?i','Urechelni??',
'Urechiu??','Uredinal?','Uremic','Uremic?','Uretrit?','Uretroscop','Uretru','Urgen??','Uria?','Uria??',
'Uric','Urinal','Urin?','Urlat','Urla?i','Urlet','Urloi','Urluial?','Urm','Urma?',
'Urma??','Urm?','Urm?rit','Urm?rit?','Urmuli??','Urmu?oar?','Urmu??','Urn?','Urobilin?','Urocordat',
'Urocultur?','Urodel','Urolog','Urolog?','Urometru','Urotropin?','Urs','Urs?','Urs?ri??','Ursid?',
'Ursit','Ursit?','Ursoaic?','Ursule?','Ursulin?','Ursuzlâc','Ur?inic','Uruioc','Urzeal?','Urzic?',
'Urzic?tur?','Urzicu??','Urzit','Uscat','Uscatul','Usc?tur?','Usc?turea','Usc??ea','Usn?','Usta?',
'Ustensil?','Ustur?tur?','Usturoi','Usturoi??','Usuc','U?arnic','U?arnic?','U??','U?cheal?','U?cioar?',
'U?i??','U?uli??','U?urin??','U?u??','Ut','Util','Utilaj','Utilitarism','Utilitarist','Utilitarist?',
'Utopism','Utopist','Utopist?','Uvertur?','Uviol','Uvraj','Uvrier?','Uvul?','Uz','Uzaj',
'Uzan??','Uzbec','Uzbec?','Uzi','Uzinaj','Uzin?','Uzufruct','Uzufructuar?','Uzur?','Vacan??',
'Vacarm','Vacat','Vac?','Vaccin?','Vacs','Vacuol?','Velist','Velist?','Velni?','Velni??',
'Velociped','Velocipedist','Velocipedist?','Velodrom','Ven?','Vendet?','Venerolog','Venerolog?','Venet','Venetic',
'Venetic?','Vene?ian?','Venezuelan?','Vengherc?','Veninari??','Venit','Venit?','Ventil','Ventricea','Ventricul',
'Ventrilic?','Ventriloc','Ventriloc?','Ventru','Venturimetru','Ventuz?','Venusian?','Verand?','Verb','Verbalism',
'Verbiaj','Verbin?','Verdea??','Verdict','Verg?','Vergea','Vergel','Vergelu??','Vergelu??','Vergen??',
'Vergetur?','Veric','Verif','Verig?','Verigea','Verigel','Verighet?','Verigu??','Verin?','Verism',
'Verist','Verist?','Veri?can?','Veri?oar?','Veri?oric?','Vermicid','Vermifug','Vermin?','Verminoz?','Vermis',
'Vermorel','Vermut','Vernis','Vernisaj','Veronal','Veronic?','Vers','Versant','Verset','Verslibrism',
'Verslibrist','Verslibrist?','Verso','Verst?','Versurel','Vertebrat','Vertebr?','Vertex','Vertical','Vertical?',
'Verticil','Vertij','Veruc?','Verv?','Verven?','Verzi?','Verzi?oar?','Verzitur?','Vesel?','Vespasian?',
'Vest','Vestal?','Vest?','Vestibul','Vestigiu','Ve?c?','Ve?mânt','Veteran?','Veto','Vetrel?',
'Vetri?oar?','Vetri??','Veveri??','Vexil','Vezic?','Vezicul?','Via','Viaduct','Via??','Vibrato',
'Wiki','Willemit','Willy-willy','Windsurf','Wolfram','Wolframat','Wolframit','Wombat','Wulfenit','Wurtzit',
'Xantelasma','Xantelasm?','Xantin?','Xantocit','Xantofil?','Xantom','Xantomatoz?','Xenism','Xenobioz?','Xenodiagnostic',
'Xenofil','Xenofil?','Xenofob','Xenofob?','Xenogenez?','Xenolit','Xenoman?','Xenotropism','Xeres','Xerofit?',
'Xeroform','Xerogel','Xerograf','Xeromorfism','Xerox','Xeroz?','Xifoid','Xilem','Xilidin?','Xilofonist',
'Xilofonist?','Xilograf','Xilograf?','Xilogram?','Xilogravur?','Xilolit','Xiloz?','Yal?','Yankeu','Yard',
'Yearling','Yemenit','Yemenit?','Yoga','Yoghin?','Yoghist','Yoghist?','Yohimbin?','York','Yterbin?',
'Yterbiu','Ytriu','Yucca','Yuki','Yuri','Zabet','Zabrac','Zabr?','Zacherlin?','Zacusc?',
'Zad?','Zagara','Zaharat','Zaharaz?','Zaharica','Zaharimetru','Zaharin?','Zaharni??','Zaharometru','Zaharoz?',
'Zaharuri','Zaherea','Zaiafet','Zaic?','Zaicoi','Zaiflâc','Zaimf','Zairez','Zairez?','Zalhana',
'Zambian?','Zambil?','Zambilic?','Zambol','Zamc?','Zamfir?','Zamparagiu','Zamparalâc','Zapat','Zapateado',
'Zapcial?','Zapcilâc','Zapciu','Zapis','Zapisc?','Zapt','Zaraf','Zarafi??','Zaratit','Zar?',
'Zarf','Zarnacadea','Zarpa','Zarv?','Zarzavagioaic?','Zarzavagiu','Zarzavat','Zarz?r?','Zastup','Za?',
'Zaver?','Zavergiu','Zavesc?','Zavragioaic?','Zavragiu','Z?bal?','Z?bav?','Z?b?lu??','Z?bl?u','Z?branic',
'Z?brea','Zdrobitur?','Zdrumic?tur?','Zdruncin?tur?','Zdup','Zdup?ial?','Zeam?','Zeamil','Zebereal?','Zebr?',
'Zebu','Zecic?','Zecimal?','Zeciuial?','Zeciuit','Zeciuri','Zeflemea','Zeflemism','Zegras','Zein?',
'Zei??','Zel','Zemnic','Zemos','Zenana','Zend?','Zenit','Zeolit','Zerdiceaf','Zermacup',
'Zero','Zestra?','Zestri?oar?','Ze?aj','Ze??ri??','Ze?uit','Zeu','Zeugm?','Zgaib?','Zganc?',
'Zgard?','Zg?ibuli??','Zg?rdi??','Zg?rdu??','Zg?u','Zgâit','Zgâl?âial?','Zgâl?âit','Zgâl?âitur?','Zgâmboi',
'Zgârci','Zgârcioab?','Zgârciob','Zgârcitur?','Zgârieci','Zgârietur?','Zgl?voac?','Zgl?voc','Zgomot','Zgr?bun??',
'Zgr?bun?ic?','Zgrip?ora?','Zgrip?uroaic?','Zgrip?uroi','Zguduial?','Zguduitur?','Zgur?','Zi','Ziarist','Ziarist?',
'Ziaristic?','Zibelin?','Zibet?','Zical?','Zica?','Zic?la?','Zic?tur?','Zid','Zid?reas?','Zid?rit',
'Zid?ri??','Ziditorul','Zidurel','Zigogeneza','Zigogenez?','Zigom?','Zigot','Zigurat','Zigzag','Zila?',
'Ziler?','Zili?oar?','Zimaz?','Zimberec','Zimbil','Zimbru','Zim?','Zinc','Zincograf','Zincograf?',
'Zincogravur?','Zinnwaldit','Zirconiu','Zis?','Ziulic?','Ziuli??','Ziu?oar?','Zl?t?reas?','Zloat?','Zlot',
'Zlota?','Zmeoaic?','Zmeoi','Zmeu','Zmeule?');
  
  lista_substantive_rn varr := varr('Aalenian','Abager','Abajur','Abandon','Abator','Abdomen','Abecedar','Abientin','Aborigen','Abrazor',
'Abreviator','Abrudean','Absorbitor','Abur','Academician','Acadian','Acaparator','Acar','Acarian','Accelerator',
'Acheuleean','Achizitor','Acin','Acompaniator','Acordeon','Acordor','Acromion','Acrospor','Actinon','Actinopterigian',
'Activator','Actor','Actuar','Ac?ionar','Acumulator','Acupunctor','Acustician','Acu?or','Acuzator','Acvamarin',
'Acvaplan','Aeromotor','Aeroplan','Aeroplancton','Aeroreactor','Afân?tor','Afgan','Afin','Afinor','Afion',
'Afi?ier','Afi?or','Afl?tor','Afon','African','Afrikaander','Afrikander','Agar-agar','Agarean','Agheasmatar',
'Agitator','Aglomerator','Aglutinogen','Agnomen','Antecesor','Antediluvian','Antetren','Antevorbitor','Anticar','Anticiclon',
'Anticipator','Anticlor','Antielectron','Antifon','Antifonar','Antigen','Antihormon','Antiinflamator','Antineutron','Antioxigen',
'Antiparazitar','Antiproton','Antiroman','Antiser','Badian','Badminton','Baedeker','Baian','Baider','Bajoaier',
'Balador','Balafon','Balansier','Balansoar','Balansor','Balastor','Balaur','Balcon','Baldachin','Balerin',
'Balistician','Balizor','Balon','Ban','Banan','Bananier','Bancaiz?n','Bancher','Bancrutar','Bandurar',
'Banian','Bantustan','Bar','Barbar','Barbi?on','Barbun','B?ligar','B?l?ean','B?n??ean','B?nicer',
'B?ni?or','B?r?gan','B?rbier','B?rz?un','B?snar','B?t?tor','B?trân','B?utor','Bârdan','Bârfitor',
'Bârl?dean','Bâtlan','Becar','Becer','Becher','Beduin','Belfer','Belgian','Blan?ir','Blasfemator',
'Blastomer','Blazer','Blazon','Bl?nar','Blidar','Blogger','Bluzon','Boar','Bobinator','Bogasier',
'Bogatâr','Bog?tan','Boier','Boiler','Boi?tean','Boitar','Bojogar','Boldi?or','Bolivian','Bolovan',
'Bol?ar','Bombardier','Bombardon','Cefar','Celar','Celebrator','Celestin','Celibatar','Celofan','Celuitor',
'Celular','Cenomanian','Centaur','Centenar','Centiar','Centiron','Centralizator','Centromer','Centumvir','Centurion',
'Cenur','Cenu?ar','Cenzor','Cepchen','Cepu?or','Cer','Cerber','Cercar','Cerc?tor','Cercet?tor',
'Cercuitor','Cercu?or','Chivernisitor','Christadelfian','Cian','Cianogen','Cibernetician','Cicar','Ciclamen','Ciclan',
'Cicloalcan','Ciclohexan','Ciclon','Ciclopentan','Ciclopropan','Ciclotron','Cimbri?or','Cimen','Cimi?ir','Cimitir',
'Cimpoier','Cin','Cincantin','Cincar','Cincin','Cineamator','Cineroman','Cioban','Comedon','Comentator',
'Comesean','Comis-voiajor','Comisar','Comision','Comisionar','Comodor','Comor','Como?tenitor','Compactor','Companion',
'Comparator','Compendiator','Compensator','Comper','Competitor','Compilator','Compostor','Compozitor','Compresor','Computer',
'Comun','Comutator','Con','Cooperator','Coordonator','Copaier','Copan','Copier','Copolimer','Coproprietar',
'Copywriter','Cor','Coralier','Coran','Coraportor','Cor?bier','Corbi?or','Corbu?or','Cordar','Cordelier',
'Cordon','Cordovan','Corector','Coredactor','Coreean','Coregizor','Coregon','Coreligionar','Corepetitor','Corhan',
'Coridor','Corindon','Corintian','Danian','Dansator','Dar','D?bilar','D?ltuitor','D?n?uitor','D?r?citor',
'D?râm?tor','D?ruitor','D?un?tor','Dâmbovi?ean','Dâmbu?or','Dârmon','Dealer','Debarasor','Debarcader','Debitor',
'Debre?in','Decagon','Decameron','Decan','Decantor','Decapator','Decapsulator','Decar','Decaster','Decatlon',
'Decatron','Decemvir','Decister','Declan?ator','Declan?or','Declin','Declinator','Decor','Decorator','Decorticator',
'Decupator','Decurion','Decuscutator','Defazor','Defecator','Defendor','Defensor','Defibrator','Defibrilator','Dezleg?tor',
'Dezmiri?titor','Dezodorizator','Dezorganizator','Diacon','Diagnostician','Dialectician','Dializor','Diapazon','Diaproiector','Diblar',
'Dictafon','Dictator','Dicton','Dic?ionar','Dietetician','Difuzor','Driver','Drobu?or','Dromader','Dro?car',
'Drumar','Drumlin','Drummer','Drumu?or','Dub?lar','Dublon','Duhan','Dul?pior','Dulci?or','Dulgher',
'Dumper','Dun?rean','Duoden','Dup?cinar','Duramater','Duramen','Durian','Durilon','Du?man','Duumvir',
'Eastmancolor','Eben','Ebo?oar','Echer','Echilibror','Echipier','Eclator','Ecler','Ecleror','Eclozionator',
'Economizator','Economizor','Ecran','Ectropion','Ecuadorian','Ecuator','Ecuson','Edafon','Edecar','Edelschwein',
'Eden','Editor','Educator','Efector','Efor','Efractor','Efuzor','Egalizator','Egalizor','Egiptean',
'Egumen','Egutor','Eider','Eidofor','Ejector','Elan','Elastomer','Elebor','Elector','Electrician',
'Electrocar','Electrocauter','Electrofon','Electrofor','Electrolizor','Electromotor','Electron','Electropor?elan','Electrosomn','Elektron',
'Elen','Eleron','Elevator','Elicopter','Extrasezon','Facturier','Faeton','Faian?ar','Faian?ator','Falaitar',
'Falanster','Falansterian','Falern','Falsificator','Falun','Famen','Fan','Fanar','Fanfaron','Fanion',
'Fanon','Far','Faraon','Farmazon','Farsor','Fason','Fasonator','Faun','Faur','Faurmaur',
'Fazan','Fazitron','Fazotron','F?c?tor','F?clier','F?g?r??ean','F?litor','F?l?uitor','F?ptuitor','F?râm?tor',
'F??uitor','F?urar','F?uritor','Fân','Fâni?or','Fântânar','Fecior','Feder','Filator','Filer',
'Filfizon','Filigran','Filistean','Filistin','Filodendron','Filon','Fin','Financiar','Finan?ator','Finisor',
'Fior','Fiorin','Fir','Firezar','Firi?or','Firman','Fi?ier','Fitohormon','Fitopatogen','Fitoplancton',
'Fitotron','Fixator','Fizician','Flacon','Flaier','Flamin','Flan','Flanger','Fla?netar','Fl?c?uan',
'Flecar','Flegmon','Fler','Fleuron','Fligorn','Flocu?or','Florar','Florean','Floricultor','Florin',
'Flotor','Fludor','Fluidizor','Fluier','Fluierar','Fluor','Fluorfosgen','Flutter','Flutur','Galben',
'Galican','Galion','Gali?ian','Galoman','Galon','Galoroman','Galvanocauter','Gambir','Ganglion','Gangster',
'Gaolean','Garderobier','Gardian','Garlin','Ga?per','Gater','Gauleiter','Gaur','Gazbeton','Gazetar',
'Gazoanalizator','Gazogen','Gazon','Gazotron','G?inar','G?itan','G?it?nar','G?l??ean','G?lbior','G?ligan',
'G?man','G?rdinar','G?rg?un','G?sitor','G?van','G?zar','Gâlcevitor','Gânditor','Gârgâr','Gâscan',
'Gâscar','Gâtar','Gâti?or','Gâtlan','Geamantan','Gear','Gen','Generator','Genetician','Genitor',
'Gentleman','Genuncher','Globe-trotter','Globu?or','Glosar','Glosator','Gluten','Gluton','Gnomon','Goblen',
'Godin','Godron','Gogoman','Gogo?ar','Golan','Goldan','Golgheter','Gologan','Gondolier','Gonfalon',
'Gonfalonier','Gonitor','Gordin','Gorgan','Gorjean','Gorun','Gospodar','Go?tinar','Gotcan','Graben',
'Graden','Gradier','Graf-plotter','Grafician','Grafofon','Grafoman','Graifer','Gramatician','Gramofon','Grandoman',
'Grangur','Granivor','Granulator','Graten','Graur','Graviton','Gravor','Gr?dinar','Gr?jdar','Gr?nicer',
'Gr?sun','Gr?tar','Gr?uncior','Grânar','Grâu?or','Greab?n','Greb?nar','Grecoman','Grecu?or','Greder',
'Green','Grefier','Grefon','Greghetin','Greier','Gren','Gresor','Grifon','Grimeur','Grivan',
'Groh?itor','Gropan','Gropar','Gros-plan','Groscior','Grosoman','Grosular','Grum?jer','Grupu?or','Gruzin',
'Guardaman','Gudron','Gudronator','Gugiuman','Gujon','Gulden','Guler','Gunoier','Gustar','Gust?tor',
'Gu?ter','Guvern','Guvernator','Guvernor','Guzgan','Guzlar','Halebardier','Halogen','Halon','Haloplancton',
'Halor','Halucinogen','Hambar','Hamburger','Hamster','Han','Han-t?tar','Hangan','Hangar','Hanger',
'Har','Haraiman','Haramin','Hardpan','Harghitean','Harman','Harpagon','Harpon','Harponier','Hartan',
'Ha?urator','Hatâr','Hatman','Ha?egan','Haustor','Havator','H?inar','H?itar','Hânsar','Hebdomadar',
'Hectar','Heder','Hegelian','Hegemon','Helicon','Heliodor','Heliogravor','Helion','Heliotehnician','Hematogen',
'Hematozoar','Hemion','Hemipter','Hemodializor','Hidrociclon','Hidrocortizon','Hidroelevator','Hidrofon','Hidrofor','Hidrogen',
'Hidrogenerator','Hidroglisor','Hidrolocator','Hidrometeor','Hidromonitor','Hidroseparator','Hidrotehnician','Hidrozoar','Himen','Himenopter',
'Hingher','Hiparion','Hiperon','Hipertiroidian','Ie?ean','Iezer','Iezi?or','Iezu?or','Ighemonicon','Ignitor',
'Ignitron','Iguanodon','Ihneumon','Ihtiozaur','Ileon','Ilfovean','Ilion','Ilir','Iluminator','Ilustrator',
'Imbrohor','Imitator','Imn','Impactor','Infirmier','Informatician','Informator','Infractor','Infuzor','Inginer',
'Inhalator','Inhibitor','Inion','Ini?or','Ini?iator','Injector','Inovator','Insectar','Insectivor','Insecutor',
'Inspector','Inspirator','Instalator','Instaurator','Instigator','Instilator','Institutor','Instructor','Instrumentar','îngrijitor',
'înjunghietor','înlocuitor','înmuietor','înmul?itor','înot?tor','înregistrator','înrobitor','însemn','înso?itor','întemeietor',
'întinz?tor','întorc?tor','întrefier','întrerup?tor','Jeton','Jian','Jiclor','Jidan','Jigher','Jimblar',
'Jipan','Jir','Jitar','Jitnicer','Jneap?n','Joag?r','Jobber','Joben','Jocu?or','Joimir',
'Joker','Jonctor','Josean','Juc?tor','Judec?tor','Judocan','Jugan','Jug?nar','Juisor','Juncan',
'Juncu?or','Jungher','Junior','Lacto-vegetarian','Lactobar','Lactofermentator','Lactogen','Lactoser','Ladin','Lag?r',
'Laib?r','Lainer','Lamantin','Lambrechin','Laminator','Laminor','Lampadar','Lampion','Lamprofir','Lan',
'Lancasterian','Landler','Lansator','Lantan','Lao?ian','Lapon','Laringofon','Laser','Laticifer','Latifundiar',
'Latin','Latinizator','Latir','Laur','Lute?ian','Lutier','Luti?or','Macaronar','Macedonean','Macedoromân',
'Macerator','Macferlan','Machetator','Machior','Macmahon','Macropor','Macrospor','Maculator','Madipolon','Madrepor',
'Madrilen','Magazin','Magaziner','Magazioner','Maghiar','Maghiran','Magician','Magiun','Magnadur','Magnetizator',
'Magnetofon','Magnetomotor','Magneton','Magnetron','Mah?r','M?mular','M?nu?ar','M?r','M?rar','M?r?cinar',
'M?rfar','M?rg?ritar','M?rgean','M?rmurar','M?r??luitor','M?rturisitor','M?r?i?or','M?run?i?ar','M?sar','M?s?lar',
'M?selar','M?slin','M?slinar','M?sluitor','M?sur?tor','M?t?sar','M?turar','M?tur?tor','M??ar','M??i?or',
'M?z?rar','Mânc?tor','Mândri?or','Mânecar','Mâner','Mânuitor','Navigator','Navlositor','Nazar','Nazâr',
'N?dr?gar','N?ier','N?imitor','N?lbar','N?p?stuitor','N?s?udean','N?scior','N?sturar','N?su?or','N?v?litor',
'N?vodar','Neprieten','Nerecunosc?tor','Neseser','Nesomn','Netezitor','Neuron','Neutron','Nev?z?tor','Nevropter',
'Newton','Newtonian','Nicaraguan','Nichelator','Nictemer','Nigerian','Nipon','Nisipar','Ob?dar','Ober',
'Oberchelner','Obijduitor','Oblon','Obor','Oborean','Obr?jor','Obr?zar','Observator','Obsidian','Obstetrician',
'Paladin','Palan','Palanchin','Palatin','Paleocen','Paleogen','Palestinian','Palicar','Palier','Palmer',
'Palmier','Palonier','Palpator','Paltin','Palton','Pamfletar','Panacodar','Panaghiar','Pandi?pan','Pandur',
'Paner','Pangar','Panglicar','Pavator','Pavian','Pavilion','Pavlichian','Pavor','Pazarghidean','P?curar',
'P?durar','P?durean','P?gân','P?ianjen','P?ier','P?injinar','P?i?or','P?l?mar','P?l?rier','P?limar',
'P?liur','P?lmar','P?ltior','P?mântean','P?nu?er','P?pu?ar','P?r','Rap?n','Raportor','Raster',
'Ra?chetator','Raton','R?can','R?car','R?chitan','R?chitar','R?citor','R?cu?or','R?dvan','R?puitor',
'Ri?car','Rodan','Rodier','Rododendron','Rodor','Rodozahar','Rogojinar','Rolan','Roli?or','Roller',
'Roman','Romancier','Român','Romergan','Röntgen','Roshar','Rostogolitor','Rostuitor','Ro?ior','Sabin',
'Sabir','Sablator','Sabotor','Sabrer','Sabur','Sachelar','Sacrificator','Sacristan','Safir','Safran',
'Saftian','Sagitar','Sagotier','Sahan','Saidecar','Saivan','Salahor','Salon','Saloon','Salvamar',
'Salvarsan','Samar','Samaritean','Samoan','Suspensor','Suspin','Sus?in?tor','Susur','Sutar','Sutien',
'Suvenir','Suveran','Suzeran','Sveter','?ab?r','?ablon','?ablonar','?afar','?agrin','?ah?r-mah?r',
'?alander','?alanger','?alazion','?alt?r','?alupar','?alvir','?aman','?ambelan','?amotar','?amotier',
'?ampon','?an','?anfren','?ansonier','?antan','?antier','?aran','?arlatan','??n?i?or','??trar',
'?colar','?edin?oman','?eitan','Tahmin','Tahogenerator','Taier','Taifun','Tain','Taior','Talan',
'Talar','Taler','Talger','Talian','Talion','Talisman','Talon','Taloner','Tamar','Tamarin',
'Tambur','Tampon','Tandur','Tanghir','Tangon','Tanin','Tanzanian','Tapetar','Tapeur','Tapir',
'Tapi?er','Tar','Taracan','Tarar','Tarhan','Tarhon','Tarlatan','Tarpan','Tartan','Tartar',
'Tartor','Teslar','Testator','Tester','Testosteron','Te?itor','Tetraclormetan','Tetragon','Tetrahidrobenzen','Tetratlon',
'Teuton','Textier','Tezaur','Tezaurar','Tezaurizator','Thriller','Tibetan','Tibi?ir','Tifan','Tifon',
'Timar','Timi?ean','Timi?orean','Timonier','Timpan','Timpanon','Um?r','Umbl?tor','Umbrar','Umerar',
'Umezitor','Umor','Unchi?or','Undi?ar','Uneltitor','Ung?tor','Unghenean','Ungher','Ungur','Ungurean',
'Unicorn','Unison','Unitarian','Universitar','Untar','Untdelemn','Unti?or','Uragan','Urangutan','Uranofan',
'Ur?tor','Urcior','Urdar','Uretan','Ureter','Uricar','Urm?ritor','Urm?tor','Urobilinogen','Ursar',
'Ursitor','Urson','Urzitor','Usc?tor','U?er','U?ier','U?or','Uter','Utilizator','Uvrier',
'Uzufructuar','Uzurar','Uzurpator','Vaccin','Velnicer','Velur','Vene?ian','Venezuelan','Venin','Ventilator',
'Venusian','Verfafor','Verificator','Verigar','Veri?can','Veri?or','Vermillon','Vernier','Versificator','Versor',
'Versuitor','Verzi?or','Vestiar','Vestitor','Veston','Veteran','Vezuvian','Vibrafon','Woofer','Xenoman',
'Xenon','Xilan','Xilen','Xilofon','Yen','Yoghin','YouTuber','Yuan','Zabaion','Zadar',
'Zaharificator','Zah?r','Zaib?r','Zambian','Zamfir','Zaporojean','Zar','Zarafir','Zarz?r','Zdrobitor',
'Zdruncin','Zecer','Zefir','Zelar','Zelator','Zeonifer','Zeppelin','Ze?ar','Zgrip?or','Zgrun?ur',
'Ziar','Zidar','Ziditor','Zigospor','Ziler','Zimnicean','Zimogen','Zim?i?or','Zircon','Zl?tar',
'Zmeur','Zmeurar','Zmeurar');
  
  lista_nume varr := varr('Ababei','Acasandrei','Adascalitei','Afanasie','Agafitei','Agape','Aioanei','Alexandrescu','Alexandru','Alexe',
  'Alexii','Amarghioalei','Ambroci','Andonesei','Andrei','Andrian','Andrici','Andronic','Andros','Anghelina','Anita','Antochi','Antonie',
  'Apetrei','Apostol','Arhip','Arhire','Arteni','Arvinte','Asaftei','Asofiei','Aungurenci','Avadanei','Avram','Babei','Baciu','Baetu',
  'Balan','Balica','Banu','Barbieru','Barzu','Bazgan','Bejan','Bejenaru','Belcescu','Belciuganu','Benchea','Bilan','Birsanu','Bivol',
  'Bizu','Boca','Bodnar','Boistean','Borcan','Bordeianu','Botezatu','Bradea','Braescu','Budaca','Bulai','Bulbuc-aioanei','Burlacu',
  'Burloiu','Bursuc','Butacu','Bute','Buza','Calancea','Calinescu','Capusneanu','Caraiman','Carbune','Carp','Catana','Catiru','Catonoiu',
  'Cazacu','Cazamir','Cebere','Cehan','Cernescu','Chelaru','Chelmu','Chelmus','Chibici','Chicos','Chilaboc','Chile','Chiriac','Chirila',
  'Chistol','Chitic','Chmilevski','Cimpoesu','Ciobanu','Ciobotaru','Ciocoiu','Ciofu','Ciornei','Citea','Ciucanu','Clatinici','Clim','Cobuz',
  'Coca','Cojocariu','Cojocaru','Condurache','Corciu','Corduneanu','Corfu','Corneanu','Corodescu','Coseru','Cosnita','Costan','Covatariu',
  'Cozma','Cozmiuc','Craciunas','Crainiceanu','Creanga','Cretu','Cristea','Crucerescu','Cumpata','Curca','Cusmuliuc','Damian','Damoc',
  'Daneliuc','Daniel','Danila','Darie','Dascalescu','Dascalu','Diaconu','Dima','Dimache','Dinu','Dobos','Dochitei','Dochitoiu','Dodan',
  'Dogaru','Domnaru','Dorneanu','Dragan','Dragoman','Dragomir','Dragomirescu','Duceac','Dudau','Durnea','Edu','Eduard','Eusebiu','Fedeles',
  'Ferestraoaru','Filibiu','Filimon','Filip','Florescu','Folvaiter','Frumosu','Frunza','Galatanu','Gavrilita','Gavriliuc','Gavrilovici',
  'Gherase','Gherca','Ghergu','Gherman','Ghibirdic','Giosanu','Gitlan','Giurgila','Glodeanu','Goldan','Gorgan','Grama','Grigore','Grigoriu',
  'Grosu','Grozavu','Gurau','Haba','Harabula','Hardon','Harpa','Herdes','Herscovici','Hociung','Hodoreanu','Hostiuc','Huma','Hutanu','Huzum',
  'Iacob','Iacobuta','Iancu','Ichim','Iftimesei','Ilie','Insuratelu','Ionesei','Ionesi','Ionita','Iordache','Iordache-tiroiu','Iordan','Iosub',
  'Iovu','Irimia','Ivascu','Jecu','Jitariuc','Jitca','Joldescu','Juravle','Larion','Lates','Latu','Lazar','Leleu','Leon','Leonte','Leuciuc',
  'Leustean','Luca','Lucaci','Lucasi','Luncasu','Lungeanu','Lungu','Lupascu','Lupu','Macariu','Macoveschi','Maftei','Maganu','Mangalagiu',
  'Manolache','Manole','Marcu','Marinov','Martinas','Marton','Mataca','Matcovici','Matei','Maties','Matrana','Maxim','Mazareanu','Mazilu',
  'Mazur','Melniciuc-puica','Micu','Mihaela','Mihai','Mihaila','Mihailescu','Mihalachi','Mihalcea','Mihociu','Milut','Minea','Minghel',
  'Minuti','Miron','Mitan','Moisa','Moniry-abyaneh','Morarescu','Morosanu','Moscu','Motrescu','Motroi','Munteanu','Murarasu','Musca',
  'Mutescu','Nastaca','Nechita','Neghina','Negrus','Negruser','Negrutu','Nemtoc','Netedu','Nica','Nicu','Oana','Olanuta','Olarasu',
  'Olariu','Olaru','Onu','Opariuc','Oprea','Ostafe','Otrocol','Palihovici','Pantiru','Pantiruc','Paparuz','Pascaru','Patachi','Patras',
  'Patriche','Perciun','Perju','Petcu','Pila','Pintilie','Piriu','Platon','Plugariu','Podaru','Poenariu','Pojar','Popa','Popescu',
  'Popovici','Poputoaia','Postolache','Predoaia','Prisecaru','Procop','Prodan','Puiu','Purice','Rachieru','Razvan','Reut','Riscanu',
  'Riza','Robu','Roman','Romanescu','Romaniuc','Rosca','Rusu','Samson','Sandu','Sandulache','Sava','Savescu','Schifirnet','Scortanu',
  'Scurtu','Sfarghiu','Silitra','Simiganoschi','Simion','Simionescu','Simionesei','Simon','Sitaru','Sleghel','Sofian','Soficu','Sparhat',
  'Spiridon','Stan','Stavarache','Stefan','Stefanita','Stingaciu','Stiufliuc','Stoian','Stoica','Stoleru','Stolniceanu','Stolnicu','Strainu',
  'Strimtu','Suhani','Tabusca','Talif','Tanasa','Teclici','Teodorescu','Tesu','Tifrea','Timofte','Tincu','Tirpescu','Toader','Tofan','Toma',
  'Toncu','Trifan','Tudosa','Tudose','Tuduri','Tuiu','Turcu','Ulinici','Unghianu','Ungureanu','Ursache','Ursachi','Urse','Ursu','Varlan',
  'Varteniuc','Varvaroi','Vasilache','Vasiliu','Ventaniuc','Vicol','Vidru','Vinatoru','Vlad','Voaides','Vrabie','Vulpescu','Zamosteanu','Zazuleac');
  
  lista_prenume_fete varr := varr('Adina','Alexandra','Alina','Ana','Anca','Anda','Andra','Andreea','Andreia','Antonia','Bianca','Camelia',
  'Claudia','Codrina','Cristina','Daniela','Daria','Delia','Denisa','Diana','Ecaterina','Elena','Eleonora','Elisa','Ema','Emanuela','Emma',
  'Gabriela','Georgiana','Ileana','Ilona','Ioana','Iolanda','Irina','Iulia','Iuliana','Larisa','Laura','Loredana','Madalina','Malina','Manuela',
  'Maria','Mihaela','Mirela','Monica','Oana','Paula','Petruta','Raluca','Sabina','Sanziana','Simina','Simona','Stefana','Stefania','Tamara',
  'Teodora','Theodora','Vasilica','Xena');
  
  lista_prenume_baieti varr := varr('Adrian','Alex','Alexandru','Alin','Andreas','Andrei','Aurelian','Beniamin','Bogdan','Camil','Catalin',
  'Cezar','Ciprian','Claudiu','Codrin','Constantin','Corneliu','Cosmin','Costel','Cristian','Damian','Dan','Daniel','Danut','Darius','Denise',
  'Dimitrie','Dorian','Dorin','Dragos','Dumitru','Eduard','Elvis','Emil','Ervin','Eugen','Eusebiu','Fabian','Filip','Florian','Florin',
  'Gabriel','George','Gheorghe','Giani','Giulio','Iaroslav','Ilie','Ioan','Ion','Ionel','Ionut','Iosif','Irinel','Iulian','Iustin','Laurentiu',
  'Liviu','Lucian','Marian','Marius','Matei','Mihai','Mihail','Nicolae','Nicu','Nicusor','Octavian','Ovidiu','Paul','Petru','Petrut','Radu',
  'Rares','Razvan','Richard','Robert','Roland','Rolland','Romanescu','Sabin','Samuel','Sebastian','Sergiu','Silviu','Stefan','Teodor','Teofil',
  'Theodor','Tudor','Vadim','Valentin','Valeriu','Vasile','Victor','Vlad','Vladimir','Vladut');
        
  lista_tari varr := varr('Rusia','Romania','Germania','Grecia','Turcia','Spania','Anglia','Suedia','Albania','Bulgaria'); 
  lista_gen varr := varr('Drama','Fiction','Razboi','Poetry','Romance','Horror','Jurnal','Atlas','Carte de colorat','Povesti pentru copii','Istorie'); 
  
   
  v_nume VARCHAR2(255);
  v_prenume VARCHAR2(255);
  v_prenume1 VARCHAR2(255);
  v_prenume2 VARCHAR2(255);
  v_matr VARCHAR2(6);
  v_matr_aux VARCHAR2(6);
  v_temp int;
  v_temp1 int;
  v_temp2 int;
  v_temp3 int;
  v_temp_date date;
  v_data_nastere date;  
  v_nationalitate VARCHAR2(255);
  v_salariu int;
  v_an_publicatie date;
  v_nr_totale int;
  v_nr_disponibile int;
  v_gen_carte VARCHAR2(255);
  v_titlu_carte VARCHAR2(255);
  v_titlu1 VARCHAR2(255);
  v_titlu2 VARCHAR2(255);
  tipA int;
  tipB int;
  v_data_tranzactie date;
  v_data_limita date;
  v_username VARCHAR2(255);
  v_pass VARCHAR2(255);

  v_gen VARCHAR2(255);
  v_valoare_platita int;
  v_tip int;

BEGIN
  
   DBMS_OUTPUT.PUT_LINE('Inserarea a 5000 autori...');
   FOR v_i IN 1..5000 LOOP
    
        v_nume := lista_nume(TRUNC(DBMS_RANDOM.VALUE(0,lista_nume.count))+1);
      IF (DBMS_RANDOM.VALUE(0,100)<50) THEN      
         v_prenume1 := lista_prenume_fete(TRUNC(DBMS_RANDOM.VALUE(0,lista_prenume_fete.count))+1);
         LOOP
            v_prenume2 := lista_prenume_fete(TRUNC(DBMS_RANDOM.VALUE(0,lista_prenume_fete.count))+1);
            exit when v_prenume1<>v_prenume2;
         END LOOP;
       ELSE
         v_prenume1 := lista_prenume_baieti(TRUNC(DBMS_RANDOM.VALUE(0,lista_prenume_baieti.count))+1);
         LOOP
            v_prenume2 := lista_prenume_baieti(TRUNC(DBMS_RANDOM.VALUE(0,lista_prenume_baieti.count))+1);
            exit when v_prenume1<>v_prenume2;
         END LOOP;       
       END IF;
     
     IF (DBMS_RANDOM.VALUE(0,100)<60) THEN  
        IF LENGTH(v_prenume1 || ' ' || v_prenume2) <= 20 THEN
          v_prenume := v_prenume1 || ' ' || v_prenume2;
        END IF;
        else 
           v_prenume:=v_prenume1;
      END IF;       
       
  
    
     v_nationalitate := lista_tari(TRUNC(DBMS_RANDOM.VALUE(0,lista_tari.count))+1);
      
      v_temp:='';
    
                      
        insert into autori values(v_i, v_nume, v_prenume,v_nationalitate, sysdate, sysdate);
   END LOOP;
   DBMS_OUTPUT.PUT_LINE('Inserarea a 5000 autori... GATA !');
   
  --------------------------
  --------------------------
  -------------------------
  ---------------------------
  ---angajati-------------
   DBMS_OUTPUT.PUT_LINE('Inserarea a 30 angajati...');
   
   FOR v_i IN 1..30 LOOP
      v_nume := lista_nume(TRUNC(DBMS_RANDOM.VALUE(0,lista_nume.count))+1);
      IF (DBMS_RANDOM.VALUE(0,100)<50) THEN      
         v_prenume1 := lista_prenume_fete(TRUNC(DBMS_RANDOM.VALUE(0,lista_prenume_fete.count))+1);
         LOOP
            v_prenume2 := lista_prenume_fete(TRUNC(DBMS_RANDOM.VALUE(0,lista_prenume_fete.count))+1);
            exit when v_prenume1<>v_prenume2;
         END LOOP;
       ELSE
         v_prenume1 := lista_prenume_baieti(TRUNC(DBMS_RANDOM.VALUE(0,lista_prenume_baieti.count))+1);
         LOOP
            v_prenume2 := lista_prenume_baieti(TRUNC(DBMS_RANDOM.VALUE(0,lista_prenume_baieti.count))+1);
            exit when v_prenume1<>v_prenume2;
         END LOOP;       
       END IF;
       
       IF (DBMS_RANDOM.VALUE(0,100)<60) THEN  
          IF LENGTH(v_prenume1 || ' ' || v_prenume2) <= 20 THEN
            v_prenume := v_prenume1 || ' ' || v_prenume2;
          END IF;
          else 
             v_prenume:=v_prenume1;
        END IF;               
    
         v_salariu := '';
         v_salariu := DBMS_RANDOM.VALUE(8,20)*100;
      v_data_nastere := TO_DATE('01-01-1960','MM-DD-YYYY')+TRUNC(DBMS_RANDOM.VALUE(0,365))+TRUNC(DBMS_RANDOM.VALUE(0,40))*365;
      v_temp:='';
                        
    insert into angajati values(v_i, v_nume, v_prenume, v_data_nastere, v_salariu, sysdate, sysdate);
   END LOOP;
   DBMS_OUTPUT.PUT_LINE('Inserarea a 30 angajati... GATA !');
   
  ---------------------------- 
    --------------------------
  --------------------------
  -------------------------
  ---------------------------
  ---carti-------------
    DBMS_OUTPUT.PUT_LINE('Inserarea a 10000 de carti...');
   
   FOR v_i2 IN 1..10000 LOOP
    
   IF (DBMS_RANDOM.VALUE(0,100)<50) THEN  
      v_titlu1 := lista_substantive(TRUNC(DBMS_RANDOM.VALUE(0,lista_substantive.count))+1);
      tipA:=1;
       ELSE
      v_titlu1 := lista_substantive_rn(TRUNC(DBMS_RANDOM.VALUE(0,lista_substantive_rn.count))+1);
       tipA:=2;
   END IF;
   
   IF (DBMS_RANDOM.VALUE(0,100)<50) THEN  
         v_titlu2 := lista_substantive_e(TRUNC(DBMS_RANDOM.VALUE(0,lista_substantive_e.count))+1);
          tipB:=1;
        ELSE
         v_titlu2 := lista_adjective(TRUNC(DBMS_RANDOM.VALUE(0,lista_adjective.count))+1);
          tipB:=2;
   END IF;
   
          IF(tipA!=2)THEN
          IF(tipB!=2)THEN
           IF LENGTH(v_titlu1 || ' si '|| v_titlu2) <= 25 THEN
             v_titlu_carte:=v_titlu1 || ' si '|| v_titlu2;
          END IF;
          else 
             v_titlu_carte:=v_titlu1;
          END IF;
          END IF;
          
          IF(tipA!=2)THEN
          IF(tipB!=1)THEN
           IF LENGTH(v_titlu1 || ' regele '|| v_titlu2||'ilor') <= 25 THEN
             v_titlu_carte:=v_titlu1 || ' regele '|| v_titlu2||'ilor';
          END IF;
          else 
             v_titlu_carte:=v_titlu1;
          END IF;
          END IF;
          
          IF(tipA!=1)THEN
          IF(tipB!=1)THEN
           IF LENGTH(v_titlu1 || ' cel '|| v_titlu2) <= 25 THEN
             v_titlu_carte:=v_titlu1 || ' cel '|| v_titlu2;
          END IF;
          else 
             v_titlu_carte:=v_titlu1;
          END IF;
          END IF;
          
          IF(tipA!=1)THEN
          IF(tipB!=2)THEN
           IF LENGTH(v_titlu1 || ' zis si '|| v_titlu2) <= 25 THEN
             v_titlu_carte:=v_titlu2 || ' zis si '|| v_titlu1;
          END IF;
          else 
             v_titlu_carte:=v_titlu1;
          END IF;
          END IF;
       
     --1470
       v_gen_carte:= lista_gen(TRUNC(DBMS_RANDOM.VALUE(0,lista_gen.count))+1);
        
         v_nr_totale := DBMS_RANDOM.VALUE(1,20);
          v_nr_disponibile := DBMS_RANDOM.VALUE(1,v_nr_totale);
      v_data_nastere := TO_DATE('01-01-1960','MM-DD-YYYY')+TRUNC(DBMS_RANDOM.VALUE(0,365))+TRUNC(DBMS_RANDOM.VALUE(0,40))*365;
      v_an_publicatie := TO_DATE('01-01-1960','MM-DD-YYYY')+TRUNC(DBMS_RANDOM.VALUE(0,365))+TRUNC(DBMS_RANDOM.VALUE(0,40))*365;
            
    insert into carti values(v_i2,(DBMS_RANDOM.VALUE(1,5000)), v_titlu_carte,  v_an_publicatie, v_gen_carte,v_nr_disponibile,v_nr_totale,DBMS_RANDOM.VALUE(10,500), sysdate, sysdate);
   END LOOP;
   DBMS_OUTPUT.PUT_LINE('Inserarea a 10000 carti... GATA !');
  
  -----------------------------
  ---------------------------
  ---------------------------- 
    --------------------------
  --------------------------
  -------------------------
  ---------------------------
    DBMS_OUTPUT.PUT_LINE('Inserarea a 10000 useri...');
   
   FOR v_i IN 1..10000 LOOP
      v_nume := lista_nume(TRUNC(DBMS_RANDOM.VALUE(0,lista_nume.count))+1);
      IF (DBMS_RANDOM.VALUE(0,100)<50) THEN     
      v_gen:='fata';
         v_prenume1 := lista_prenume_fete(TRUNC(DBMS_RANDOM.VALUE(0,lista_prenume_fete.count))+1);
         LOOP
            v_prenume2 := lista_prenume_fete(TRUNC(DBMS_RANDOM.VALUE(0,lista_prenume_fete.count))+1);
            exit when v_prenume1<>v_prenume2;
         END LOOP;
       ELSE
       v_gen:='baiat';
         v_prenume1 := lista_prenume_baieti(TRUNC(DBMS_RANDOM.VALUE(0,lista_prenume_baieti.count))+1);
         LOOP
            v_prenume2 := lista_prenume_baieti(TRUNC(DBMS_RANDOM.VALUE(0,lista_prenume_baieti.count))+1);
            exit when v_prenume1<>v_prenume2;
         END LOOP;       
       END IF;
       
       IF (DBMS_RANDOM.VALUE(0,100)<60) THEN  
          IF LENGTH(v_prenume1 || ' ' || v_prenume2) <= 20 THEN
            v_prenume := v_prenume1 || ' ' || v_prenume2;
          END IF;
          else 
             v_prenume:=v_prenume1;
        END IF;    
        
      v_pass:=v_nume||TRUNC(DBMS_RANDOM.VALUE(0,40));
      v_username:=v_nume||TRUNC(DBMS_RANDOM.VALUE(0,40));
      v_data_nastere := TO_DATE('01-01-1960','MM-DD-YYYY')+TRUNC(DBMS_RANDOM.VALUE(0,365))+TRUNC(DBMS_RANDOM.VALUE(0,40))*365;
      v_temp:='';
                        
    insert into useri values(v_i,v_username,v_pass, v_nume, v_prenume, v_gen, sysdate, sysdate);
   END LOOP;
   DBMS_OUTPUT.PUT_LINE('Inserarea a 10000 useri... GATA !');
  -----------------------------------------
  ---------------------------
  -------------------
   DBMS_OUTPUT.PUT_LINE('Inserarea a 2000 imprumuturi...');
   
   FOR v_i IN 1..2000 LOOP
     
        
        
      v_data_tranzactie := TO_DATE('01-01-2019','MM-DD-YYYY')+TRUNC(DBMS_RANDOM.VALUE(0,365));
      v_data_limita := v_data_tranzactie + 30;

      v_temp:='';
                        
    insert into imprumuturi values(v_i,TRUNC(DBMS_RANDOM.VALUE(0,10000)+1), TRUNC(DBMS_RANDOM.VALUE(0,10000)+1), v_data_tranzactie, v_data_limita, sysdate, sysdate);
   END LOOP;
   DBMS_OUTPUT.PUT_LINE('Inserarea a 2000 imprumuturi... GATA !');
    
    
    ------------
    ----------
    ---------
    ----membership
     DBMS_OUTPUT.PUT_LINE('Inserarea a 600 membership...');
   
   FOR v_i IN 1..600 LOOP
     
        
        v_valoare_platita:=TRUNC(DBMS_RANDOM.VALUE(100,465));
      v_tip := TRUNC(DBMS_RANDOM.VALUE(0,3));
    
    
                        
    insert into membership values((DBMS_RANDOM.VALUE(0,10000)+1),v_valoare_platita,v_tip, sysdate, sysdate);
   END LOOP;
   DBMS_OUTPUT.PUT_LINE('Inserarea a 600 membership... GATA !');
   
   
   
   -------------------
   ---------------------
   ----tranzactii----
    DBMS_OUTPUT.PUT_LINE('Inserarea a 500 tranzactii...');
   
   FOR v_i IN 1..500 LOOP
     
        
      v_tip := TRUNC(DBMS_RANDOM.VALUE(0,3));
    
    
                        
    insert into tranzactii values(v_i,(DBMS_RANDOM.VALUE(0,10000)+1),(DBMS_RANDOM.VALUE(0,10000)+1),v_tip, sysdate, sysdate);
   END LOOP;
   DBMS_OUTPUT.PUT_LINE('Inserarea a 600 tranzactii... GATA !');
    
END;
/


select count(*)|| ' angajati inserati' from angajati;
select count(*)|| ' autori inserati' from autori;
select count(*)|| ' carti inserate' from carti;
select count(*)|| ' useri inserati' from useri;
select count(*)|| ' imprumuturi inserate' from imprumuturi;
select count(*)|| ' membership inserat' from membership;
select count(*)|| ' tranzactii inserate' from tranzactii;



