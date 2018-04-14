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
#Tech
tech=(datafest$normTitleCategory=='tech')
tech=which(tech, tech==TRUE)
tech=datafest[tech]
#Mednurse
mednurse=(datafest$normTitleCategory=='mednurse')
mednurse=which(mednurse, mednurse==TRUE)
mednurse=datafest[mednurse]
#Science
science=(datafest$normTitleCategory=='science')
scinece=which(science, science==TRUE)
science=datafest[science]
#Retail
retail=(datafest$normTitleCategory=='retail')
retail=which(retail, retail==TRUE)
retail=datafest[retail]
#Management
management=(datafest$normTitleCategory=='management')
management=which(management, management==TRUE)
management=datafest[management]

#Legal
legal=(datafest$normTitleCategory=='legal')
legal=which(legal, legal==TRUE)
legal=datafest[legal]

#Education
education=(datafest$normTitleCategory=='education')
education=which(education, education==TRUE)
education=datafest[education]

#Agriculture
agriculture=(datafest$normTitleCategory=='agriculture')
agriculture=which(agriculture, agriculture==TRUE)
agriculture=datafest[agriculture]

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
updated_df=rbind(tech, marketing,mednurse, science, retail, management, legal, education,agriculture,engchem)
updated_df=updated_df[,..vec]
