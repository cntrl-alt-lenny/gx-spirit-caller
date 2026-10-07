extern unsigned short *data_021a98f8;
unsigned char func_020a3654(void) {
 int a,b,c,d;
 a=data_021a98f8[9]?2:0; b=data_021a98f8[7]?1:0;
 c=data_021a98f8[10]?4:0; d=data_021a98f8[11]?8:0;
 return d|(c|(b|a));
}
