extern void func_0209448c(int,void *,int);
extern void func_02094504(int,void *,int);
extern void func_020944a4(const void *,void *,int);
extern int func_020a3380(const unsigned short *);
extern int func_020a342c(void *,char *,int);
typedef struct { int f0; unsigned short *f4; void *f8,*fc,*f10; int f14; unsigned char f18; } Input;
void func_020a34e0(char *p,Input *in,void *extra) {
 int a,b;
 func_0209448c(0,p,0x4c0); p[0x4b2]=0;
 a=func_020a342c(in->fc,p,1)==0;
 b=func_020a342c(in->f10,p,0)==0;
 if(a|b) { p[0x4b2]=1; func_02094504(0,p,0x220); }
 *(int *)(p+0x4b8)=in->f14;
 if(extra) func_020944a4(extra,p+0x220,0x16);
 p[0x236]=in->f18;
 func_020944a4(in->f4,p+0x238,(unsigned short)(func_020a3380(in->f4)*2));
 func_020944a4(in->f8,p+0x298,0xc0);
 p[0x358]=1; *(unsigned short *)(p+0x35a)=1; *(unsigned short *)(p+0x4b0)=1;
}
