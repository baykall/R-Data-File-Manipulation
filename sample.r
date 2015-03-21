source("file_ops.r")

people_age <- "InputFiles/people_age.txt"
people_nationalities <- "InputFiles/people_nationalities.txt"
#First I define two files with their directories

rearrange_columns(people_age,c("Age","FirstName","LastName","Occupation"),",")
#Rearranges the columns by taking the Age column to the beginning

rearrange_columns(people_nationalities,c("ID","FirstName","LastName"),",")
#Rearranges the data by dropping the last column

change_column_names(people_age,c("Age","FirstName","LastName","Job"),",")
#Changes the column names (only the Occupation column in this example)

change_seperation(people_age,",","\t")
change_seperation(people_nationalities,",","\t")
#These will change the seperation string from , to tab delimited

people_merged <- "InputFiles/people_merged.txt"
people_merged2 <- "InputFiles/people_merged2.txt"
#Now I define two more files that I will create my merging files

join_files(people_age,people_nationalities,people_merged,"All","\t","inner",0)
#Inner joins the two files, and uses all of the columns in the output file people_merged

join_files(people_age,people_nationalities,people_merged2,c("FirstName","LastName","Age","ID"),"\t","outer",0)
#Outer joins the two files, and uses only the specified columns in the output file people_merged. It also puts 0 for the fields that have value NA
#There is also left and right join options suported. You can see the difference between them here http://stackoverflow.com/questions/1299871/how-to-join-data-frames-in-r-inner-outer-left-right

add_new_column(people_merged,"Gender","Male","\t")
#add a new column to people_merged with header and value Male

people_merged_copied <- "InputFiles/people_merged_copied.txt"
#Now I will copy people_merged so I define the new file.

copy_paste_file(people_merged,people_merged_copied);
#This will copy and paste people_merged to people_merged_copied

people_merged_copied_twice <- "InputFiles/people_merged_copied_twice.txt"
#I will merge the previous two miles into people_merged_copied_twice so I define it.

merge_files(people_merged,people_merged_copied,people_merged_copied_twice,"\t")