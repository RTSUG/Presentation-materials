data catyums.CatLovers2;
  infile datalines dsd truncover;
  input Name:$50. Address:$30. City:$20. State:$20. Zip:32. Country:$2.;
  format Zip Z5.;
  label Zip="Zip Code";
datalines4;
BEAUTIFUL KITTY,3005 BROOKSIDE DR,GUIN,ALABAMA,35563,US
"VON NEUMANN, JOHN",4026 MAPLE LN,HUNTSVILLE,ALABAMA,35802,US
SAM CHARLES,3750 MULBERRY AVE,GROTON,CT,6340,US
"CURRY, CHRISTY",399 MASONIC HILL RD,LITTLE ROCK,ARKANSAS,72212,US
TIGER MAN,2190 CEDAR ST,PINE BLUFF,ARKANSAS,71601,US
JIM FRANCÊS,4981 DAVIS AVE,GROTON,CT,6340,US
CALVIN WENZEL,1007 THOMPSON DR,DUBLIN,CALIFORNIA,94568,US
JENNIFER RYAN,4974 WATER ST,FREMONT,CALIFORNIA,94539,US
RICARDO INDICADO,3764 KERRY WAY,GROTON,CT,6340,US
JERSEY CAT,3238 HERITAGE RD,SAN JOAQUIN,CALIFORNIA,93660,US
ECHO KAYE,3215 THOMPSON DR,SAN LEANDRO,CALIFORNIA,94578,US
CHRISTIAN LIMÃO,4573 MORGAN ST,GROTON,CT,6340,US
LINDA CHEEKS,3385 RINEHART RD,MIAMI,FL,33128,US
AGNES YATES,4334 CHESTNUT ST,POLK CITY,FL,33868,US
TRIBBLE,4474 RINEHART RD,GROTON,CT,6340,US
NICHOLE ROBINSON,622 CHESTNUT ST,TAMPA,FL,33610,US
KEVIN RAMIREZ,1813 FLINT ST,ATLANTA,GEORGIA,30303,US
KRIS RENASCIMENTO,2841 LAKELAND PARK DR,GROTON,CT,6340,US
THOMAS JENKINS,2565 PIN OAK DR,DAVENPORT,IOWA,52803,US
MICHAEL TILLMAN,4854 POPLAR ST,CALUMET CITY,ILLINOIS,60409,US
;;;;

data catyums.Customers2;
  infile datalines dsd truncover;
  input CustomerID:32. Name:$100. Gender:$1. Street1:$40. City:$20. State:$3. Zip:32. Country:$2. Email:$50. Phone:$15. Birthday:32. Occupation:$60. Company:$30.;
  format CustomerID Z12. Zip 5. Birthday YYMMDD10.;
  label Street1="Street Address" Zip="Zip Code";
datalines4;
100000001,Catherine M. Thomas,F,3005 Brookside Drive,Guin,AL,35563,US,KatherineMThomas@mailinator.co,205-412-9602,-12053,Heating air-conditioning and refrigeration mec,House of Gas
100000002,János L. von Neumann,M,4026 Maple Lane,Huntsville,AL,35802,US,jlvonn@mailinator.co,256-522-5585,-12053,Farm equipment mechanic,Tower Records
100000003,Sam C. Tennyson,M,2715 Mulberry Avenue,Donaldson,AR,71941,US,SamCTennyson@dodgit.com,501-384-1324,-12053,Land agent,AM/PM Camp
100000004,Kristi R. Curry,F,399 Masonic Hill Road,Little Rock,AR,72212,US,KristiRCurry@dodgit.com,501-529-6712,-12053,Industrial property manager,Giant
100000005,Wanda R. Smith,F,2190 Cedar Street,Pine Bluff,AR,71601,US,WandaRSmith@dodgit.com,870-814-4444,-12053,Insurance sales agent,Quality Merchant Servic
100000006,James R.R. Hoadley,M,1078 Davis Ave,Concord,CA,94520,US,Jim.Hoadley@mailinator.com,707-738-1378,-12053,Marine electronics technician,Packer
100000007,Calvin B. Wenzel,M,1007 Thompson Drive,Dublin,CA,94568,US,CalWenzel@mailinator.com,510-453-8297,-12053,Medical social worker,Harvest Foods
100000008,Jennifer R. Ryan,F,4974 Water Street,Fremont,CA,94539,US,JennyRyan@dodgit.com,925-259-5665,-12053,Diabetes management nurse,Tape World
100000009,Richard T. Reyes,M,4819 Kerry Way,Los Angeles,CA,90017,US,RickReyes@pookmail.com,562-738-9044,-12053,Forest fire inspector,Gold Medal
100000010,James Attwood,M,3238 Heritage Road,San Joaquin,CA,93660,US,JamesSAttwood@spambob.com,559-693-5324,-12053,Information systems manager,Thom McAn Store
100000011,Echo P. Kaye,F,3215 Thompson Drive,San Leandro,CA,94578,US,EchoKaye@dodgit.com,510-347-2876,-12053,Navy,Canal Villere
100000012,Anna R. Christian,F,3323 Morgan Street,Fort Walton beach,FL,32548,US,AnnaChristi@dodgit.com,850-467-1006,-12053,Mixing and blending machine tender,Sambo's
100000013,Linda R. Cheeks,F,3385 Rinehart Road,Miami,FL,33128,US,LindaRCheeks@trashymail.com,786-499-2016,-12053,Delivery service driver,Home Centers
100000014,Agnes R. Yates,F,4334 Chestnut Street,Polk City,FL,33868,US,AgnesRYates@pookmail.com,727-460-5745,-12053,Floor installer,Pro-Care Garden Mainten
100000015,Regina C. Snider,F,3697 Rinehart Road,Sunrise,FL,33323,US,ReginaCSnider@mailinator.com,786-356-4455,-12053,Automotive glass installer,Fradkin Brothers Furnit
100000016,Nichole W. Robinson,F,622 Chestnut Street,Tampa,FL,33610,US,NicholeWRobinson@trashymail.co,727-410-7274,-12053,Architectural drafter,A Plus Lawn Care
100000017,Kevin D. Ramirez,M,1813 Flint Street,Atlanta,GA,30303,US,KevinDRamirez@trashymail.com,678-241-0197,-12053,ABE teacher,Mr. D's IGA
100000018,Kris J. Carolan,M,3935 Lakeland Park Drive,Duluth,GA,30097,US,KrisJCarolan@spambob.com,770-584-8429,-12053,Real property appraiser,Dun Rite Lawn Maintenan
100000019,Thomas E. Jenkins,M,2565 Pin Oak Drive,Davenport,IA,52803,US,ThomasEJenkins@dodgit.com,563-333-4706,-12053,Certified pest control applicator,Gemco
100000020,Michael B. Tillman,M,4854 Poplar Street,Calumet City,IL,60409,US,MichealBTillman@pookmail.com,708-730-8200,-12053,Computer training specialist,Belle Lady
100000021,Wayne S. Gibbs,M,1302 Lucy Lane,Guilford,IN,47022,US,WayneSGibbs@dodgit.com,812-487-5255,-12053,Asset property manager,The Fox and Hound
100000022,Ronald C. Profit,M,2950 Kennedy Court,Charlestown,MA,2129,US,RonaldCProfit@dodgit.com,774-348-4872,-12053,Civil engineering technician,Linens 'n Things
100000023,Suzanna L. Morrell,F,2376 Bloomfield Way,Portland,ME,4101,US,SuzannaLMorrell@dodgit.com,207-552-5029,-12053,Training and development manager,Custom Sound
100000024,Miguel D. Snelling,M,1169 Echo Lane,Wayland,MI,49348,US,MiguelDSnelling@dodgit.com,269-792-3754,-12053,Agricultural and food scientist,Prospa-Pal
100000025,Randall D. Hutching,M,1934 Maple Court,Saint Louis,MO,63108,US,RandallDHutchings@dodgit.com,573-375-5682,-12053,Forging machine setter,One-Up Realtors
100000026,Veronica G. Schweitzer,F,4393 Twin House Lane,Springfield,MO,65802,US,VeronicaGSchweitzer@mailinator.com,417-523-1336,-12053,Compensation and benefits technician,Cavages
100000027,Nathan K. McDonald,M,2009 Bruce Street,St Louis,MO,63101,US,NathanKMcDonald@pookmail.com,314-303-4295,-12053,Front-end mechanic,Little Tavern
100000028,Robert B. Kelley,M,3032 Mcwhorter Road,Belmont,MS,38827,US,RobertBKelley@trashymail.com,662-454-0983,-12053,Building consultant,Builders Square
100000029,John L. Carroll,M,1449 Rafe Lane,Booneville,MS,38829,US,JohnLCarroll@trashymail.com,662-728-2695,-12053,Housekeeping cleaner,A Plus Lawn Care
100000030,Lewis M. Shipley,M,3799 Lake Road,Trenton,NJ,8608,US,LewisMShipley@trashymail.com,609-392-0832,-12053,Hanger,Flipside Records
100000031,Charlott A. Post,F,3570 Hornor Avenue,Kiefer,OK,74041,US,CharlotteAPost@mailinator.com,918-321-9745,-12053,Industrial truck and tractor operator,La Petite Boulangerie
100000032,James M. Carpente,M,4043 Pine Street,Pittsburgh,PA,15222,US,JamesMCarpenter@spambob.com,724-262-2722,-12053,Diesel service technician,Purity Supreme
100000033,Yolanda W. Hersh,F,597 Jacobs Street,Pittsburgh,PA,15222,US,YolandaWHersh@pookmail.com,412-307-9956,-12053,Cruise ship worker,Wise Appraisals
100000034,Christa B. Palma,F,3027 Spadafore Drive,Strattanville,PA,16258,US,ChristaBPalma@mailinator.com,814-764-2645,-12053,Land agent,Creative Wealth
100000035,Nguyễn Trãi,M,3504 Still Pastures Drive,Bishopville,SC,29010,US,TrinhThangNhuan@spambob.com,803-484-1603,-12053,Social worker,Home Quarters Warehouse
100000036,Michael C. Kaufman,M,4021 Kessla Way,Florence,SC,29501,US,MichaelCKaufman@mailinator.com,843-372-9880,-12053,Clergy,Price Club
100000037,David H. Marez,M,1998 Berkshire Circle,Knoxville,TN,37917,US,DavidHMarez@trashymail.com,865-705-6974,-12053,Biographer,Chase Pitkin
100000038,Carlos L. Carswell,M,3970 Swick Hill Street,Dime Box,TX,77853,US,CarlosLCarswell@pookmail.com,979-884-1935,-12053,Medical scientist,The Original House of P
100000039,Christop R. Mabie,M,4067 Birch  Street,El Paso,TX,79915,US,ChristopherRMabie@trashymail.c,915-621-7440,-12053,Recruiting manager,Purity
100000040,Marjorie S. Okeefe,F,3800 Lynn Ogden Lane,Texas City,TX,77592,US,MarjorieSOkeefe@mailinator.com,409-935-3547,-12053,Electrologist,Yardbirds Home Center
100000041,Nellie A. Sexton,F,2003 White Pine Lane,Dahlgren,VA,22448,US,NellieASexton@spambob.com,540-644-8122,-12053,Criminal lawyer,Little Folk Shops
100000042,James K. Bryson,M,3334 Horizon Circle,Tacoma,WA,98499,US,JamesKBryson@pookmail.com,253-512-8629,-12053,Embossing machine operator,System Star
100000043,Ronald S. Babcock,M,3718 Edgewood Road,Little Rock,AR,72201,US,RonaldSBabcock@spambob.com,870-902-9689,-12052,Patient educator,Farrell's Ice Cream Par
100000044,Tabitha C. Weiss,F,641 Beech Street,Antioch,CA,94509,US,TabithaCWeiss@trashymail.com,925-755-3172,-12052,Railcar repairer,Pearl Architectural Des
100000045,Eric E. Rose,M,2299 Poplar Avenue,Coronado,CA,92118,US,EricERose@dodgit.com,619-545-4467,-12052,Mail carrier,Martin's
100000046,Jennifer R. Vick,F,2780 Elk Street,Newport Beach,CA,92660,US,JenniferRVick@mailinator.com,949-719-3888,-12052,Management consultant,Platinum Interior Desig
100000047,Noel S. Jones,M,1813 Pike Street,San Diego,CA,92111,US,NoelSJones@dodgit.com,858-573-7976,-12052,Extruding forming pressing and compacting mach,J. Brannam
100000048,Raymond P. Simon,M,4600 Freed Drive,Stockton,CA,95219,US,RaymondPSimon@trashymail.com,209-777-7453,-12052,Personnel recruiter,Choices
100000049,William M. Mannino,M,2011 American Drive,Pace,FL,32571,US,WilliamMMannino@dodgit.com,850-995-6904,-12052,Semiconductor assembler,Northern Reflections
100000050,Abraham M. Short,M,4390 Medical Center Drive,Tampa,FL,33607,US,AbrahamMShort@pookmail.com,941-506-5546,-12052,Insurance claims and policy processing clerk,Exact Solutions
100000051,Rosemary A. Ammons,F,2931 White Lane,Perry,GA,31069,US,RosemaryAAmmons@pookmail.com,478-987-7156,-12052,Jailer,Harmony House
100000052,Michael N. Coyle,M,4587 Oakmound Drive,Chicago,IL,60603,US,MichaelNCoyle@pookmail.com,773-335-5056,-12052,General maintenance and repair worker,Tweeter
100000053,Christy D. Reavis,F,1862 Kembery Drive,Hickory Hills,IL,60457,US,ChristyDReavis@spambob.com,630-531-8455,-12052,Checker,Budget Power
100000054,Shannon S. Stickler,F,832 Capitol Avenue,Indianapolis,IN,46214,US,ShannonSStickler@pookmail.com,765-621-9892,-12052,Public works inspector,Al's Auto Parts
100000055,Fannie M. Mason,F,620 N Bend River Road,Lexington,KY,40507,US,FannieMMason@mailinator.com,606-722-6572,-12052,Dining room and cafeteria attendant,Twin Food Stores
100000056,Juanita D. Doyle,F,1140 Russell Street,Cambridge,MA,2141,US,JuanitaDDoyle@pookmail.com,978-964-2888,-12052,Medical technologist,Price's Electronics
100000057,Karrie R. Autrey,F,4355 Bartlett Avenue,Farmington Hills,MI,48331,US,KarrieRAutrey@pookmail.com,248-592-7696,-12052,Interior designer,Multicerv
100000058,Steven T. Hart,M,4430 Howard Street,Grand Rapids,MI,49503,US,StevenTHart@pookmail.com,616-560-8341,-12052,Shipping-and-receiving supervisor,Tweeter
100000059,Joseph V. Bartlett,M,2906 Haven Lane,Lansing,MI,48933,US,JosephVBartlett@trashymail.com,517-643-4375,-12052,Teaching assistant,Millenia Life
100000060,Michael L. Carlson,M,3018 Lighthouse Drive,Polk,MO,65727,US,MichaelLCarlson@trashymail.com,417-253-5745,-12052,General superintendent,Bresler's Ice Cream
100000061,Robert L. Green,M,2430 Gorby Lane,Jackson,MS,39201,US,RobertLGreen@mailinator.com,601-272-6011,-12052,Hairstylist,Superior Appraisals
100000062,Eric G. Perez,M,2916 Twin Willow Lane,Mount Gilead,NC,27306,US,EricGPerez@trashymail.com,910-439-9459,-12052,Optometry doctor,Eagle Food Centers
100000063,Joyce C. Fackler,F,1540 Johnson Street,Raleigh,NC,27615,US,JoyceCFackler@mailinator.com,919-866-4549,-12052,Chiropractic physician,Environ Architectural D
100000064,Mark S. Fletcher,M,392 Bird Street,Las Cruces,NM,88005,US,MarkSFletcher@mailinator.com,505-639-8861,-12052,Fitness worker,Garden Guru
100000065,Helen R. Riggs,F,3050 Martha Ellen Drive,Reno,NV,89501,US,HelenRRiggs@mailinator.com,775-655-9589,-12052,Corporate accountant,Buehler Foods
100000066,Keith L. Easterly,M,3621 Settlers Lane,Brooklyn,NY,11206,US,KeithLEasterly@spambob.com,917-764-6429,-12052,Court reporter,Del Farm
100000067,Betty S. Kelly,F,4767 Alfred Drive,Brooklyn,NY,11212,US,BettySKelly@dodgit.com,718-257-4702,-12052,Commodities trader,Exact Solutions
100000068,Kimberly B. Bobadill,F,2318 Browning Lane,Groton,NY,13073,US,KimberlyBBobadilla@mailinator.,607-898-2678,-12052,Tree pruner,Tee Town
100000069,Alicia F. Miller,F,4872 Taylor Street,Mount Kisco,NY,10549,US,AliciaFMiller@mailinator.com,914-666-8465,-12052,Limousine driver,Price's Electronics
100000070,Maxine W. Durfee,F,3039 Small Street,New York,NY,10017,US,MaxineWDurfee@spambob.com,212-845-5775,-12052,Termite control technician,Atlas Architectural Des
100000071,Rosa M. Knapp,F,1212 James Martin Circle,Columbus,OH,43209,US,RosaMKnapp@mailinator.com,614-388-0151,-12052,Dairy farmer,Solution Bridge
100000072,Teresita E. Castaned,F,4977 Boggess Street,Fairborn,OH,45324,US,TeresitaECastaneda@pookmail.co,937-873-8954,-12052,Employment service specialist,Scotty's Builders Suppl
100000073,Michael K. Peterson,M,1917 Cedarstone Drive,Toledo,OH,43613,US,MichaelKPeterson@mailinator.co,419-474-0772,-12052,Prepress technician,Jitney Jungle
100000074,Jesus K. Hall,M,4474 Irving Road,Westerville,OH,43081,US,JesusKHall@pookmail.com,740-475-6560,-12052,Assistant property manager,Ulbrich's
100000075,Joyce A. Adams,F,4736 Frank Avenue,Pittsburgh,PA,15215,US,JoyceAAdams@pookmail.com,412-968-1204,-12052,Administrative office manager,Nobil
100000076,Willie A. Mart,M,1069 Lyndon Street,Slatington,PA,18080,US,WillieAMart@trashymail.com,610-760-7328,-12052,State trooper,Cal Stereo
100000077,Jo R. Copeland,F,2113 Jerry Dove Drive,Florence,SC,29501,US,JoRCopeland@dodgit.com,843-439-4264,-12052,Recreational therapist,Ideal Garden Maintenanc
100000078,Irene G. Fye,F,1990 Wexford Way,Newberry,SC,29108,US,IreneGFye@spambob.com,803-321-0728,-12052,Termite control technician,Packer
100000079,Stephen C. Burkhart,M,4036 Jerome Avenue,Dallas,TX,75252,US,StephenCBurkhart@mailinator.co,956-202-8022,-12052,Substance abuse social worker,Prestigabiz
100000080,Joshua D. Hill,M,4434 Carolyns Circle,Dallas,TX,75248,US,JoshuaDHill@trashymail.com,214-725-1893,-12052,Agricultural and food scientist,Karl's Shoes
100000081,James C. Terry,M,827 Hemlock Lane,Harlingen,TX,78550,US,JamesCTerry@mailinator.com,956-513-2353,-12052,Tax assessor,Thompson
100000082,John L. Yuen,M,1065 Grant Street,Longview,TX,75601,US,JohnLYuen@spambob.com,903-901-2046,-12052,Diesel engine specialist,Food Fair
100000083,John D. Heil,M,3586 Stoney Lane,Richardson,TX,75081,US,JohnDHeil@pookmail.com,972-918-5372,-12052,Grill cook,MegaSolutions
100000084,Jack A. Cummings,M,3706 Hill Haven Drive,Tacoma,WA,98402,US,JackACummings@spambob.com,253-934-2026,-12052,Dance captain,Strategic Profit
100000085,Ana K. Hart,F,4832 Comfort Court,Madison,WI,53703,US,AnaKHart@pookmail.com,608-294-6533,-12052,Biological technician,Alexander's
100000086,Elda J. Horton,F,4496 Lynn Avenue,Merrill,WI,54452,US,EldaJHorton@dodgit.com,715-539-4800,-12052,Loan underwriter,Desert Garden Help
100000087,Homer D. Clay,M,4491 Wright Court,Carbon Hill,AL,35549,US,HomerDClay@mailinator.com,205-924-8292,-12051,Behavioral disorder counselor,Childrens Bargain Town
100000088,Richard L. Manske,M,3030 Pretty View Lane,Arcata,CA,95521,US,RichardLManske@dodgit.com,707-826-9052,-12051,Realtor,Endicott Shoes
100000089,William D. Moran,M,3150 Thompson Street,Irvine,CA,92614,US,WilliamDMoran@trashymail.com,562-582-2006,-12051,Marine biologist,Universal Design Partne
100000090,Shirley R. Butler,F,4984 Oakwood Circle,Long Beach,CA,90802,US,ShirleyRButler@dodgit.com,949-315-3673,-12051,Foreign language translator,Video Concepts
100000091,Sara R. Jones,F,1451 Aviation Way,Los Angeles,CA,90017,US,SaraRJones@mailinator.com,213-863-6084,-12051,Real estate asset manager,Nedick's
100000092,Jacob S. Kelley,M,2504 Ella Street,Mountain View,CA,94041,US,JacobSKelley@mailinator.com,650-254-0508,-12051,Executive,Good Times
100000093,Antonia D. Roger,F,418 Beech Street,Oakland,CA,94612,US,AntoniaDRoger@mailinator.com,925-887-5732,-12051,Process pipeline drafter,Metro
100000094,Beatrice J. Lopez,F,3623 Maxwell Farm Road,Sacramento,CA,95814,US,BeatriceJLopez@mailinator.com,530-998-1970,-12051,Journalist,Omni Superstore
100000095,Misty H. Hudson,F,1589 Ten Mile Road,San Diego,CA,92117,US,MistyHHudson@mailinator.com,760-213-2504,-12051,Aircraft electronics specialist,Sportmart
100000096,Jeannie C. Borkhold,F,3153 Middleville Road,San Gabriel,CA,91775,US,JeannieCBorkholder@mailinator.,626-309-4734,-12051,Rough carpenter,DGS HomeSource
100000097,Shandra D. Brown,F,1323 Ford Street,San Jose,CA,95113,US,ShandraDBrown@pookmail.com,408-494-8890,-12051,Audio control engineer,Asian Plan
100000098,Jake R. Garris,M,631 Thunder Road,San Jose,CA,95110,US,JakeRGarris@trashymail.com,650-491-0430,-12051,Lobby attendant,Enviro Architectural De
100000099,Dee J. Bible,M,4540 River Road,Pueblo,CO,81004,US,DeeJBible@trashymail.com,719-560-6903,-12051,PBX repairer,Earthworks Garden Kare
100000100,Nancy E. Lane,F,3598 Terry Lane,Orlando,FL,32801,US,NancyELane@spambob.com,321-283-5005,-12051,Interpreter,Borders Books
100000101,John A. Patel,M,2855 Lunetta Street,Sarasota,FL,34232,US,JohnAPatel@spambob.com,941-342-1356,-12051,Police dispatcher,Macroserve
100000102,Nancy R. Woods,F,4643 Davis Street,Athens,GA,30601,US,NancyRWoods@pookmail.com,706-362-0266,-12051,Reservation agent,Flexus
100000103,Jean-Claude N. deVille,M,995 Junior Avenue,Atlanta,GA,30329,US,ChristopherNPeek@mailinator.co,404-634-8294,-12051,Pipelayer,Rite Solution
100000104,Donna D. Austin,F,727 Post Farm Road,Decatur,GA,30030,US,DonnaDAustin@mailinator.com,404-285-4279,-12051,Dividend clerk,Source Club
100000105,Mariah T. von Grubb,F,2224 College View,Bible Grove,IL,62858,US,MariahTGrubb@trashymail.com,618-686-8505,-12051,Bicycle repairer,Ulbrich's
100000106,Long M. Holmes,M,4867 Spinnaker Lane,Dekalb,IL,60115,US,LongMHolmes@pookmail.com,815-758-7489,-12051,First responder,Belle Lady
100000107,Teresita R. de Castro,F,4026 James Avenue,Wichita,KS,67202,US,TeresitaRDecastro@pookmail.com,316-260-8555,-12051,Technician,Parade of Shoes
100000108,Amanda Z. Lander,F,4651 Karen Lane,Louisville,KY,40202,US,AmandaZLander@dodgit.com,502-940-4349,-12051,Air-conditioning mechanic,Ellman's Catalog Showro
100000109,Essie W. Goddard,F,980 Woodhill Ave,Easton,MD,21601,US,EssieWGoddard@spambob.com,410-763-8744,-12051,Camera repairer,Henry's
100000110,Jack L. Torres,M,4010 Robinson Court,Saginaw,MI,48607,US,JackLTorres@dodgit.com,989-485-0449,-12051,Technician,Magik Gray
100000111,Drew A. Stewart,M,3986 Tennessee Avenue,Southfield,MI,48034,US,DrewAStewart@mailinator.com,248-304-1648,-12051,Lens polisher,Circus World
100000112,Willa D. McKenzie,F,993 Ashmor Drive,Wadena,MN,56482,US,WillaDMcKenzie@trashymail.com,218-257-6578,-12051,Zoologist,ManCharm
100000113,Nga T. Board,F,3410 Mandan Road,Saint Louis,MO,63101,US,NgaTBoard@trashymail.com,573-837-6216,-12051,EEO representative,Playworld
100000114,Antoine L. White,M,4042 Pinnickinnick Street,Piscataway,NJ,8854,US,AntoineLWhite@dodgit.com,732-878-2247,-12051,Physician,Landskip Yard Care
100000115,Richard C. Cummings,M,1005 Grove Street,Bethpage,NY,11714,US,RichardCCummings@mailinator.co,631-779-9916,-12051,Tire repairer,Sherman's
100000116,Elisha J. Vierra,F,3235 Deans Lane,Manhattan,NY,10016,US,ElishaJVierra@spambob.com,914-746-2622,-12051,Hospital attendant,Borders Books
100000117,Barbara C. Mauro,F,4279 James Avenue,Utica,NY,13502,US,BarbaraCMauro@pookmail.com,315-948-6426,-12051,Homeowner association manager,The Network Chef
100000118,Nicole T. Eckstein,F,2500 Little Street,Niles,OH,44446,US,NicoleTEckstein@dodgit.com,330-544-0634,-12051,Lather,AM/PM Camp
100000119,Margaret Z. Beyer,F,3515 Aaron Smith Drive,Mechanicsburg,PA,17055,US,MargaretZBeyer@trashymail.com,717-691-7224,-12051,Bindery machine tender,Sound Advice
100000120,Gwendoly J. Miles,F,2096 Tree Top Lane,West Brunswick T,PA,19549,US,GwendolynJMiles@pookmail.com,610-281-6634,-12051,Machinist,Custom Sound
100000121,Katherin P. Bond,F,3451 Brown Avenue,Pelzer,SC,29669,US,KatherinePBond@dodgit.com,864-947-8634,-12051,Shipping-and-receiving supervisor,Peaches
100000122,Patricia D. Sheldon,F,4035 Andell Road,Nashville,TN,37209,US,PatriciaDSheldon@spambob.com,615-210-2650,-12051,Director,Cherry & Webb
100000123,Ernest N. Unzueta,M,3934 McDowell Street,Nashville,TN,37201,US,ErnestNUnzueta@pookmail.com,931-371-9205,-12051,Wildlife biologist,Strawberries
100000124,Andrew G. Grant,M,2241 Valley Lane,Austin,TX,78701,US,AndrewGGrant@pookmail.com,512-688-3232,-12051,Material dispatching,Sounds Great Inc
100000125,David R. Mills,M,692 Waldeck Street,Cleburne,TX,76031,US,DavidRMills@trashymail.com,817-386-7934,-12051,Structural metal fabricator,Independent Investors
100000126,Diane R. Hill,F,2267 Glenview Drive,Corpus Christi,TX,78476,US,DianeRHill@dodgit.com,361-489-9136,-12051,Chief operating officer,Handy Andy
100000127,Sau E. Brown,F,166 Gore Street,Houston,TX,77056,US,SauEBrown@mailinator.com,713-554-7110,-12051,Collector,Muirhead's
100000128,Tyrone S. Jefferso,M,3229 Poe Road,Houston,TX,77032,US,TyroneSJefferson@spambob.com,832-876-7873,-12051,Physical meteorologist,Lawn N' Order Garden Ca
100000129,Jeanette R. Wolcott-Davis,F,2441 Thrush Trail,Neches,TX,12345,US,JeanetteRWolcott@pookmail.com,903-584-4803,-12051,Babysitter,Lafayette Radio
100000130,Christop J. Washingt,M,3046 Burnside Avenue,Montezuma Creek,UT,84534,US,ChristopherJWashington@pookmai,435-651-6025,-12051,Risk and insurance manager,KB Toys
100000131,Jason H. Wilcox,M,366 Fleming Way,Richmond,VA,23228,US,JasonHWilcox@pookmail.com,804-719-8686,-12051,Reinforcing iron and rebar worker,Chandlers
100000132,Lonnie C. Johnson,F,1833 Boone Crockett Lane,Seattle,WA,98109,US,LonnieCJohnson@spambob.com,360-464-1421,-12051,Locksmith,Nan Duskin
100000133,Mike K. Wise,M,2426 Broad Street,Birmingham,AL,35222,US,MikeKWise@dodgit.com,205-451-3272,-12050,Semiconductor assembler,Century House
100000134,Jack N. Angle,M,45 New Creek Road,Huntsville,AL,35810,US,JackNAngle@dodgit.com,256-852-9113,-12050,Garment presser,Reliable Guidance
100000135,William G. Warrick,M,2478 Thompson Street,Anaheim,CA,92805,US,WilliamGWarrick@mailinator.com,562-552-9079,-12050,Public relations manager,The Flying Bear
100000136,Robert M. Dunnam,M,4949 Peck Court,Los Angeles,CA,90017,US,RobertMDunnam@dodgit.com,949-502-7404,-12050,Administrator,Childrens Bargain Town
100000137,Ida I. Carter,F,682 Haul Road,Menlo Park,CA,94025,US,IdaICarter@dodgit.com,650-926-1134,-12050,Medical coder,Standard Food
100000138,Brent E. Clayton,M,2009 Carriage Court,Palm Springs,CA,92262,US,BrentEClayton@mailinator.com,760-418-4852,-12050,Shuttle car operator,Gene Walter's Marketpla
100000139,Abrielle S. Yves,F,4121 Nickel Road,Pomona,CA,91766,US,LeighSMarchant@mailinator.com,626-618-7732,-12050,Multiple machine tool setter,Rainbow Bay Crafts
100000140,Jose E. Jackson,M,682 Wolf Pen Road,Redwood City,CA,94063,US,JoseEJackson@mailinator.com,650-366-0309,-12050,University professor,Linens 'n Things
100000141,Matthew G. Davis,M,2945 Sycamore Street,San Jose,CA,95127,US,MatthewGDavis@dodgit.com,408-923-4057,-12050,Passenger service agent,Incluesiv
100000142,Cathy J. Field,F,140 Providence Lane,South Pasadena,CA,91030,US,CathyJField@spambob.com,626-799-9997,-12050,Milling and planing machine setter,Trak Auto
100000143,Janice M. Landry,F,4104 Leo Street,Denver,CO,80202,US,JaniceMLandry@spambob.com,720-975-1933,-12050,Automated systems librarian,Strength Gurus
100000144,James E. Tafolla,M,3751 Rhapsody Street,Eustis,FL,32726,US,JamesETafolla@trashymail.com,352-357-0830,-12050,Business management consultant,Reliable Investments
100000145,Adam J. Tindale,M,3064 Lunetta Street,Myakka City,FL,34251,US,AdamTindale@mailinator.com,941-322-6233,-12050,Amusement machine repairer,Netobill
100000146,Gloria T. Shifflet,F,967 Woodside Circle,Tallahassee,FL,32303,US,GloriaTShifflett@dodgit.com,850-709-9051,-12050,Disc jockey,The Warner Brothers Sto
100000147,Roberto M. Coddingt,M,3402 Oakridge Lane,Macon,GA,31206,US,RobertoMCoddington@dodgit.com,478-256-0401,-12050,Electrophysiologist,Asian Junction
100000148,Jamaal T. Spaulding,M,4011 Stratford Drive,Honolulu,HI,96821,US,JamaalTSpaulding@spambob.com,808-373-2020,-12050,Pediatric dentist,Honest Air Group
100000149,Edith H. Nguyen,F,2443 Kembery Drive,Chicago,IL,60605,US,EdithHNguyen@spambob.com,630-631-9217,-12050,Engineering geologist,Harold's
100000150,Hattie T. Barker,F,3116 Butternut Lane,Granite City,IL,62040,US,HattieTBarker@pookmail.com,618-452-7635,-12050,Excavating operator,Gino's Hamburgers
;;;;
