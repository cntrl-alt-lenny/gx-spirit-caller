extern int func_0209dc30(void);
extern void func_0209de5c(int,int);
extern int func_0209dd30(int,unsigned short,...);
int func_020a071c(int a,int b) {
 int r=func_0209dc30();
 if(r!=0) return r;
 if(b!=0 && b!=1) return 6;
 func_0209de5c(0x19,a);
 r=func_0209dd30(0x19,1,b);
 return r==0?2:r;
}
