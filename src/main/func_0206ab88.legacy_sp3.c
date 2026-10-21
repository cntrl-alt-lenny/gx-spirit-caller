typedef unsigned int u32;
struct S {
 int state; char pad4[8]; char name[0x24]; char name2[0x44]; char key[8]; volatile int mem; int pos;
 char pad84[0x420]; int f4a4; char pad4a8[8]; int socket; int f4b4; int f4b8;
 char pad4bc[0x108]; u32 flags; int f5c8;
};
struct P { unsigned char *cur; };
struct Two { unsigned char a,b; };
extern char data_02101db0[], data_02101dd8[], data_02101df8[];
extern void func_020a6d54(int a,int b,int c,int d);
extern int func_020aaddc(const char *s);
extern int func_0206b0c4(struct S *p);
extern void func_0206aea0(struct S *p);
extern void func_0206aa68(struct S *p);
extern void func_0206b048(struct P *p,int ch,int *counter);
extern void func_0206afec(unsigned char **a0,int a1,int *a2);
extern void func_0206b06c(char **pdst,char *src,int *padv);
extern void func_0206afb8(int *a0,int a1,int a2,int *a3);
extern int func_02054cf8(int unused0,int unused1,int unused2,int unused3);
extern int func_020453e8(int a);
extern void *__memcpy(void *dst,const void *src,unsigned long n);
int func_0206ab88(struct S *p,char *a,char *b,u32 flags,int extra) {
 unsigned char buffer[0x300];
 int size;
 unsigned char *cur;
 unsigned short len;
 int result;
 if(p->state != 1) func_020a6d54((int)data_02101dd8,(int)data_02101db0,0,0x20a);
 if(a == 0) a = data_02101df8;
 if(b == 0) b = data_02101df8;
 if((u32)func_020aaddc(a) > 0x100) return 6;
 if((u32)func_020aaddc(b) > 0x100) return 6;
 result = func_0206b0c4(p);
 if(result != 0) return result;
 p->flags = flags;
 func_0206aea0(p);
 size = 2;
 cur = buffer+2;
 func_0206b048((struct P *)&cur,0,&size);
 func_0206b048((struct P *)&cur,1,&size);
 func_0206b048((struct P *)&cur,3,&size);
 func_0206afec(&cur,p->f4b8,&size);
 func_0206b06c((char **)&cur,p->name,&size);
 func_0206b06c((char **)&cur,p->name2,&size);
 func_0206afb8((int *)&cur,(int)p->key,8,&size);
 func_0206b06c((char **)&cur,b,&size);
 func_0206b06c((char **)&cur,a,&size);
 func_0206afec(&cur, ((flags >> 24)&0xff) | ((flags >> 8)&0xff00) | ((flags << 8)&0xff0000) | ((flags << 24)&0xff000000), &size);
 if(p->flags & 8) func_0206afec(&cur,p->f4a4,&size);
 if(p->flags & 0x80) func_0206afec(&cur,extra,&size);
 len = (((unsigned short)size >> 8)&0xff) | (((unsigned short)size << 8)&0xff00);
 __memcpy(buffer,&len,2);
 if(func_02054cf8(p->socket,(int)buffer,size,0) <= 0) { func_0206aa68(p); return 3; }
 p->state = 3;
 p->f5c8 = 0;
 if(p->mem == 0) {
 p->mem = func_020453e8(0x1000);
 if(p->mem == 0) return 5;
 p->pos = 0;
 }
 return 0;
}



