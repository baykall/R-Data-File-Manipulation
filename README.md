# R-Data-File-Manipulation

This is collection of some R functions that will help you to automate data file handling. All of the functions are provided in file_ops.r. 

To use it

- Create an r file that will execute your script, say for example "sample.r"
- Import the file_ops.r by the command 

<code>source("file_ops.r")<code> 

in the beginning. Now you can use any of the functions in the file_ops.
- To see an example with explanations refer to sample.r I provided in the repository.

Some functions you can use:

<code>copy_paste_file(file_name,new_file_name)<code> 

Copies and pastes the file with a new name to a new location

<code>rearrange_columns(file,new_columns,seperation)<code> 

Rearranges columns of the data file

<code>change_column_names(file,new_columns,seperation)<code>

Changes column names of the data file

<code>change_seperation(file,seperation,new_seperation)<code>

Changes seperation string of the data file

<code>remove_duplicates(file,new_file,seperation)<code>

Removes the duplicate rows of the data file

<code>join_files(file1,file2,new_file,columns,seperation,type,missing_values)<code>

Joins two files and creates a third file as a result. There are four options of join: inner, outer, left, right. And the missing values at the end of the join are replaced by missing_values string. 

<code>merge_files(file1,file2,new_file,seperation)<code>

Merges two files by adding the rows.

<code>add_new_column(file,new_column_name,new_column_content,seperation)<code>

Adds a new column to the data file with the same value
