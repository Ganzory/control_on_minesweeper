function reading_data
 z=serial('com1','BaudRate',9600,'DataBits',8);
 fopen(z);
source =fscanf(z);
fclose(z);
ch1=source;
reciver(ch1);
end