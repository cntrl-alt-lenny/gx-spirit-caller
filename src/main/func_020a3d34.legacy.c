extern unsigned char *data_021a98f8,*data_021a98fc;
extern unsigned short data_021a98f0; extern int data_021a98f4;
extern int func_0209f070(int,int,int);
extern void *func_0209e8d0(void *); extern void func_020a3830(unsigned int); extern void func_020a53e4(void);
int func_020a3d34(void) {
 int r;
 *(unsigned short *)(data_021a98f8+0x528)=0;
 *(unsigned short *)(data_021a98f8+0x52a)=0;
 *(unsigned short *)(data_021a98f8+0x526)=0;
 *(unsigned short *)(data_021a98f8+0x548)=0;
 func_020a3830(10);
 if(*(int *)(data_021a98fc+0x1320)==0) {
  do { r=func_0209f070(data_021a98f4,*(int *)(data_021a98f8+0x508),data_021a98f0); } while(r==4);
  if(r!=2) return 8;
  func_0209e8d0(*(void **)(data_021a98f8+0x508)); data_021a98f8[0x50d]=1; return 0;
 }
 func_0209e8d0(*(void **)(data_021a98f8+0x508)); data_021a98f8[0x50d]=1; func_020a53e4(); return 0;
}
