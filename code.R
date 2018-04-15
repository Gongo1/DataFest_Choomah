#Reading in data
setwd("~/Desktop/Data_Fest")
library(data.table)
datafest=fread("datafest.csv") 

#head(datafest)
#anyNA(datafest) 
#False, there isn't any missing values 
#names(datafest)
#str(datafest)

job=c(9,10,11)
jobs=datafest[,..job]

#Average Salary by City

x=which(datafest$city== 'Augusta') 
cost=datafest$estimatedSalary[x]
cost=as.numeric(cost)

x=unique(datafest$normTitleCategory)
unique(datafest$industry)

occup=read.csv("occupations.csv", header = TRUE)


#Categories to work with 
#Techsoftware
tech=(datafest$normTitleCategory=='techsoftware')
tech=which(tech, tech==TRUE)
tech=datafest[tech]
#Mednurse
mednurse=(datafest$normTitleCategory=='mednurse')
mednurse=which(mednurse, mednurse==TRUE)
mednurse=datafest[mednurse]
#Science
math=(datafest$normTitleCategory=='math')
math=which(math, math==TRUE)
math=datafest[math]
#HR
hr=(datafest$normTitleCategory=='hr')
hr=which(hr, hr==TRUE)
hr=datafest[hr]
#pharmacy
pharmacy=(datafest$normTitleCategory=='pharmacy')
pharmacy=which(pharmacy, pharmacy==TRUE)
pharmacy=datafest[pharmacy]

#Legal
legal=(datafest$normTitleCategory=='legal')
legal=which(legal, legal==TRUE)
legal=datafest[legal]

#Accounting
accounting=(datafest$normTitleCategory=='accounting')
accounting=which(accounting, accounting==TRUE)
accounting=datafest[accounting]

#engmech
engmech=(datafest$normTitleCategory=='engmech')
engmech=which(engmech, engmech==TRUE)
engmech=datafest[engmech]

#EngineeringChem
engchem=(datafest$normTitleCategory=='engchem')
engchem=which(engchem, engchem==TRUE)
engchem=datafest[engchem]

#Marketing
marketing=(datafest$normTitleCategory=='marketing')
marketing=which(marketing, marketing==TRUE)
marketing=datafest[marketing]

#categories with 11 working category variables
vec=c(6,7,22,11,10,9,14,20,19,15,16)
new_df=datafest[,..vec]

#DF w/ each category and only important Indeed indicators
updated_df=rbind(tech, marketing,mednurse, math, hr, pharmacy, legal, accounting,engmech,engchem)
updated_df=updated_df[,..vec]

#Getting 10% of our total data w/out replacement 
size1=length(updated_df$city)
updated_df_10percent=updated_df[sample(nrow(updated_df), size1), ]

tech_d="Software developers are the creative minds behind computer programs. Some develop the applications that allow people to do specific tasks on a computer or another device. Others develop the underlying systems that run the devices or that control networks"
mkt_d="Advertising, promotions, and marketing managers plan programs to generate interest in products or services. They work with art directors, sales agents, and financial staff members."
law_d="Lawyers advise and represent individuals, businesses, and government agencies on legal issues and disputes. Lawyers must have a law degree and must also typically pass a state’s written bar examination."
acct_d="Bookkeeping, accounting, and auditing clerks produce financial records for organizations. They record financial transactions, update statements, and check financial records for accuracy.They must have basic math and computer skills, including knowledge of spreadsheets and bookkeeping software. Education Employers generally require bookkeeping, accounting, and auditing clerks to have some postsecondary education, particularly coursework in accounting"
mech_d="Mechanical engineers design, develop, build, and test mechanical and thermal sensors and devices, including tools, engines, and machines.Mechanical engineering programs usually include courses in mathematics and life and physical sciences, as well as engineering and design. Mechanical engineering technology programs focus less on theory and more on the practical application of engineering principles"
nurse_d="Nurse anesthetists, nurse midwives, and nurse practitioners, also referred to as advanced practice registered nurses (APRNs), coordinate patient care and may provide primary and specialty healthcare. The scope of practice varies from state to state."
math_d="Mathematicians and statisticians analyze data and apply mathematical and statistical techniques to help solve real-world problems in business, engineering, healthcare, or other fields."
hr_d="Human resources managers plan, direct, and coordinate the administrative functions of an organization. They oversee the recruiting, interviewing, and hiring of new staff; consult with top executives on strategic planning; and serve as a link between an organization’s management and its employees"
pharm_d="Pharmacists dispense prescription medications to patients and offer expertise in the safe use of prescriptions. They also may conduct health and wellness screenings, provide immunizations, oversee the medications given to patients, and provide advice on healthy lifestyles."
chem_d="Chemical engineers apply the principles of chemistry, biology, physics, and math to solve problems that involve the production or use of chemicals, fuel, drugs, food, and many other products. They design processes and equipment for large-scale manufacturing, plan and test production methods and byproducts treatment, and direct facility operations."
description= c(tech_d,mkt_d,nurse_d,math_d,hr_d,pharm_d,law_d, acct_d,mech_d,chem_d)


