extern unsigned char *data_021a98fc;
extern void func_020a5c80(unsigned char *,void *);
extern int func_020a2cbc(int,int,int);
int func_020a10e8(int a,int b) {
 unsigned char value=a;
 func_020a5c80(&value,data_021a98fc);
 return func_020a2cbc(6,b,(int)data_021a98fc);
}
