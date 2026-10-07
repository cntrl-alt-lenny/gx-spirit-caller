extern int func_0209db88(int,...);
extern void func_020944a4(const void *,void *,int);
extern void func_020928e8(void *,int);
extern void func_0209de5c(int,int);
extern int func_0209dd30(int,unsigned short,int,int,...);
extern unsigned char data_021a97c0[];
int func_020a078c(int a,void *b,unsigned int c,int d,unsigned short e,unsigned char f) {
 int r=func_0209db88(2,7,9);
 if(r!=0) return r;
 if(b==0) return 6;
 if(c>0x70) return 6;
 func_020944a4(b,data_021a97c0,c);
 func_020928e8(data_021a97c0,c);
 func_0209de5c(0x18,a);
 r=func_0209dd30(0x18,5,(int)data_021a97c0,c,d,e,f);
 return r==0?2:r;
}
