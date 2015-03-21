copy_paste_file <- function(file_name,source_dir,dest_dir,new_file_name = ""){
	old_file<-paste(source_dir,file_name,sep="")
	if(new_file_name == "")
		new_file<-paste(dest_dir,file_name,sep="")	
	else
		new_file<-paste(dest_dir,new_file_name,sep="")
	file.copy(old_file,new_file,overwrite = TRUE)
}

rearrange_columns <- function(file,new_columns,seperation){
	new_data <- read.table(file, header=TRUE, sep=seperation, fill = TRUE)
	new_data <- new_data[new_columns]
	write.table(new_data, file=file, sep=seperation, quote=FALSE, row.names = FALSE)
}

change_column_names <- function(file,new_columns,seperation){
	new_data <- read.table(file, header=TRUE, sep=seperation, fill = TRUE)
	colnames(new_data) <- new_columns
	write.table(new_data, file=file, sep=seperation, quote=FALSE, row.names = FALSE)
}

change_seperation <- function(file,seperation,new_seperation){
	new_data <- read.table(file, header=TRUE, sep=seperation, fill = TRUE)
	write.table(new_data, file=file, sep=new_seperation, quote=FALSE, row.names = FALSE)
}

remove_duplicates <- function(file,new_file,seperation){
	new_data <- read.table(file, header=TRUE, sep=seperation, fill = TRUE)
	new_data <- unique(new_data)
	write.table(new_data, file=new_file, sep=seperation, quote=FALSE, row.names = FALSE)
}
#remove_duplicates("Facility_Product_Orders.csv","Facility_Product_Orders.csv","|")

join_files <- function(file1,file2,new_file,columns,seperation,type,missing_values){
	data1 <- read.table(file1, header=TRUE, sep=seperation, fill = TRUE,quote="")
	data2 <- read.table(file2, header=TRUE, sep=seperation, fill = TRUE,quote="")
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
	data3[is.NA(data3)] <- missing_values
	write.table(data3, file=new_file, sep=seperation, quote=FALSE, row.names = FALSE)
}
#join_files(file1,file2,file3,"All","|","inner",0)

add_new_column <- function(file,new_column_name,new_column_content,seperation){
	new_data <- read.table(file, header=TRUE, sep=seperation)
	new_data$temp_column_name <- new_column_content
	colnames(new_data)[which(names(new_data) == "temp_column_name")] <- new_column_name
	write.table(new_data, file=file, sep=seperation, quote=FALSE, row.names = FALSE)
}
#add_new_column(file10,"InitialPrice","2.95","|")

merge_files <- function(file1,file2,new_file,seperation){
	join_files(file1,file2,new_file,"All",seperation,"outer",0)
}
#merge_files(file1,file4,file7)

#pivot_file <- function(file,new_file,seperation){
#	new_data <- read.table(file, header=TRUE, sep=seperation)
#	new_data <- aggregate(ReceiptQty~Facilityto+Product+Period, data=new_data, FUN=sum)
#	write.table(new_data, file=file, sep=seperation, quote=FALSE, row.names = FALSE)
#}



