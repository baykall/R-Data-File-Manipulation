copy_paste_file <- function(file_name,new_file_name){
	old_file <- file_name
	file.copy(old_file,new_file_name,overwrite = TRUE)
}

rearrange_columns <- function(file,new_columns,separation){
	new_data <- read.table(file, header=TRUE, sep=separation, fill = TRUE)
	new_data <- new_data[new_columns]
	write.table(new_data, file=file, sep=separation, quote=FALSE, row.names = FALSE)
}

change_column_names <- function(file,new_columns,separation){
	new_data <- read.table(file, header=TRUE, sep=separation, fill = TRUE)
	colnames(new_data) <- new_columns
	write.table(new_data, file=file, sep=separation, quote=FALSE, row.names = FALSE)
}

change_separation <- function(file,separation,new_separation){
	new_data <- read.table(file, header=TRUE, sep=separation, fill = TRUE)
	write.table(new_data, file=file, sep=new_separation, quote=FALSE, row.names = FALSE)
}

remove_duplicates <- function(file,new_file,separation){
	new_data <- read.table(file, header=TRUE, sep=separation, fill = TRUE)
	new_data <- unique(new_data)
	write.table(new_data, file=new_file, sep=separation, quote=FALSE, row.names = FALSE)
}

join_files <- function(file1,file2,new_file,columns,separation,type,missing_values){
	data1 <- read.table(file1, header=TRUE, sep=separation, fill = TRUE,quote="")
	data2 <- read.table(file2, header=TRUE, sep=separation, fill = TRUE,quote="")
	if(type == "inner")
        	data3 <- merge(data1, data2)
	else if(type == "outer")
        	data3 <- merge(data1, data2, all=TRUE)
	else if(type == "left")
        	data3 <- merge(data1, data2, all.x=TRUE)
	else if(type == "right")
        	data3 <- merge(data1, data2, all.y=TRUE)
	if(columns != "All")
		data3 <- data3[columns]
	data3[is.na(data3)] <- missing_values
	write.table(data3, file=new_file, sep=separation, quote=FALSE, row.names = FALSE)
}

merge_files <- function(file1,file2,new_file,separation){
	join_files(file1,file2,new_file,"All",separation,"outer",0)
}

add_new_column <- function(file,new_column_name,new_column_content,separation){
	new_data <- read.table(file, header=TRUE, sep=separation)
	new_data$temp_column_name <- new_column_content
	colnames(new_data)[which(names(new_data) == "temp_column_name")] <- new_column_name
	write.table(new_data, file=file, sep=separation, quote=FALSE, row.names = FALSE)
}
