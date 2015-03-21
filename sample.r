source("file_ops.r")

people_age <- "InputFiles/people_age.txt"
people_nationalities <- "InputFiles/people_nationalities.txt"
people_merged <- "InputFiles/people_merged.txt"
people_merged2 <- "InputFiles/people_merged2.txt"

rearrange_columns(people_age,c("Age","FirstName","LastName","Occupation"),",")
#Rearranges the columns by taking the Age column to the beginning

rearrange_columns(people_nationalities,c("ID","FirstName","LastName"),",")
#Rearranges the data by dropping the last column

change_column_names(people_age,c("Age","FirstName","LastName","Job"),",")
#Changes the column names (only the Occupation column in this example)

change_seperation(people_age,",","\t")
change_seperation(people_nationalities,",","\t")
#These will change the seperation string from , to tab delimited

join_files(people_age,people_nationalities,people_merged,"All","\t","inner",0)
#Inner joins the two files, and uses all of the columns in the output file people_merged

join_files(people_age,people_nationalities,people_merged2,"All","\t","outer",0)
#Inner joins the two files, and uses all of the columns in the output file people_merged