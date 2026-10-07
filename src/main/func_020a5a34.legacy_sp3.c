extern unsigned char *data_021a9924;
extern struct { int stride,count; } data_021a9928;
int func_020a5a34(int id) {
 unsigned short i=0;
 while((int)i<data_021a9928.count) {
  if(!( *(unsigned int *)(data_021a9924+(id-1)*4+0x1e0) & (1<<i))) return 0;
  i++;
 }
 return 1;
}
