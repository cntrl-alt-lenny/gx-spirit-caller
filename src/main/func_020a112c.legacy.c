extern unsigned char *data_021a98fc;
extern unsigned int data_021a9840;
extern unsigned short *func_0209e524(int,int);
extern void func_020a11e4(unsigned short *,int);
void func_020a112c(int arg) {
 unsigned short i; unsigned char *p;
 for(i=0;i<16;i++) {
  p=data_021a98fc+i*0x5d4;
  if(p[0x1d52]) *(unsigned short *)(p+0x1d4a)=0;
 }
 data_021a9840=0;
 for(i=1;i<=15;i++) {
  unsigned short *r=func_0209e524(arg,i);
  if(r && *r!=0xffff && *r!=0) func_020a11e4(r,i);
 }
}
