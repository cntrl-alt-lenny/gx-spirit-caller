typedef struct { char pad[0x1c]; unsigned int a:8; unsigned int b:8; } Obj;
typedef struct {
 void *task; int f4; void *src; int dst;
 short size; unsigned short f12; unsigned short flags; unsigned short f16;
 unsigned int mode; char tail[0xc];
} Desc;
typedef struct { unsigned int pad; unsigned int x:3; unsigned int page:2; } State;
extern unsigned char data_021040ac[];
extern State data_02104f4c;
extern int data_ov002_022cc154[];
extern signed char data_ov002_022cc37c[],data_ov002_022cc39c[],data_ov002_022cc3bc[];
extern unsigned char data_ov002_022d016c[];
extern void *func_02006c0c(void *, int, int);
extern void Task_Invoke(void *);
extern int func_0201d47c(Obj *o);
extern int func_0201e5b8(Desc *);
extern void *func_0208e1ac(void);
extern void *func_0208e200(void);
extern int OS_SPrintf(signed char *, const signed char *, ...);
extern void func_02094688(const void *, void *, unsigned int);
extern void func_ov002_022aab4c(void *, int);
void func_ov002_022aa7b8(void *self) {
 unsigned short buf[0x303];
 Desc a; signed char nameA[0x20];
 Desc b; signed char nameB[0x20];
 signed char nameC[0x20]; Desc c;
 int value; unsigned short *pixels; int page; void *task; unsigned int enables;
 value=data_ov002_022cc154[*(unsigned int *)(data_021040ac+0xb84)%49];
 *(volatile unsigned int *)0x04001014=0;
 *(volatile unsigned short *)0x0400100a=(*(volatile unsigned short *)0x0400100a & ~3)|3;
 *(volatile unsigned short *)0x0400100a=(*(volatile unsigned short *)0x0400100a & 0x43)|0x1d80;
 func_0201d47c((Obj *)&a);
 OS_SPrintf(nameA,data_ov002_022cc37c,value);
 a.task=func_02006c0c(nameA,4,0);
 pixels=buf;
 a.flags=(a.flags & ~15)|6;
 a.src=pixels;
 a.flags|=0x10;
 a.mode=(a.mode & ~0x1c000)|0x4000;
 a.dst=0x27c0;
 a.size=0xa00;
 func_0201e5b8(&a); Task_Invoke(a.task);
 if (data_02104f4c.page & 2) {
 func_02094688(buf+0x40,func_0208e1ac(),0x580);
 func_02094688(pixels,(char *)func_0208e1ac()+0x580,0x80);
 } else { func_02094688(pixels,func_0208e1ac(),0x600); }
 *(volatile unsigned int *)0x04001010=0;
 *(volatile unsigned short *)0x04001008=(*(volatile unsigned short *)0x04001008 & ~3)|3;
 *(volatile unsigned short *)0x04001008=(*(volatile unsigned short *)0x04001008 & 0x43)|0x1c80;
 func_0208e200();
 func_0201d47c((Obj *)&b);
 OS_SPrintf(nameB,data_ov002_022cc39c,value);
 task=func_02006c0c(nameB,4,0);
 b.flags=(b.flags & ~15)|5;
 b.src=pixels;
 b.dst=0x77c0;
 b.task=task;
 b.flags|=0x10;
 b.mode &= ~0x1c000;
 b.size=0xc00;
 func_0201e5b8(&b); Task_Invoke(b.task);
 buf[0x302]=0; buf[0x301]=0; buf[0x300]=0;
 page=data_02104f4c.page;
 if (page&2) {
 func_02094688(buf+((page%2)*3+0x40),func_0208e200(),0x580);
 page=data_02104f4c.page;
 func_02094688(buf+(page%2)*3,(char *)func_0208e200()+0x580,0x80);
 } else {func_02094688(buf+(page%2)*3,func_0208e200(),0x600);}
 func_ov002_022aab4c(self,*(int *)(data_ov002_022d016c+0xdc));
 enables=(*(volatile unsigned int *)0x04001000 & 0x1f00)>>8;
 *(volatile unsigned int *)0x04001000=(*(volatile unsigned int *)0x04001000 & ~0x1f00)|((enables|3)<<8);
 OS_SPrintf(nameC,data_ov002_022cc3bc,(int)data_02104f4c.page%2);
 task=func_02006c0c(nameC,4,0);
 func_0201d47c((Obj *)&c);
 c.task=task;
 c.flags=(c.flags & ~15)|9; c.dst=0x8780; c.size=0x180;
 func_0201e5b8(&c); Task_Invoke(task);
}






