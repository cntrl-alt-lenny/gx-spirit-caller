#include <nitro/fx_mtx.h>
#include <nitro/types.h>
typedef struct {
 void *task; int f4,f8,fc; short f10,f12;
 unsigned short bg:4,enable:1,unused:11;
 unsigned short f16;
 unsigned int low:14,bank:3,high:15;
 unsigned int a:8,b:8; char pad[8];
} Obj;
extern int func_0201d47c(Obj *);
extern int func_0201e5b8(Obj *);
extern void *func_02006c0c(void *,int,int);
extern void Task_Invoke(void *);
extern int func_02037208(int,int,int,int);
extern int func_0208cf58(void);
extern int func_0208cf44(void);
extern void func_0208da2c(int);
extern void func_0208c8cc(u32,u32,u32);
extern void func_0208c8b0(unsigned int);
extern int func_0208e120(void);
extern int func_0208de94(void);
extern int func_0208e0a0(void);
extern int func_0208de4c(void);
extern void func_02094504(int,int,unsigned int);
extern void func_0208b0f0(int,int,int);
extern void G2x_SetBGyAffine_(u32,const struct Mtx22 *,fx32,fx32,fx32,fx32);
extern void func_0208e318(int *,int,int,int,int);
extern void func_ov002_022b303c(char *,int);
extern char data_ov002_022cbf84[],data_ov002_022cbfa0[],data_ov002_022cbfbc[],data_ov002_022cbfd4[];
extern char data_ov002_022d0fb4[],data_ov002_022d0fd4[],data_ov002_022d1af8[];
#define H(a) (*(volatile unsigned short *)(a))
#define W(a) (*(volatile unsigned int *)(a))
void func_ov002_022a51e0(int *p) {
 void *file;
 int height=0;
 int sub=0;
 struct Mtx22 m;
 Obj o;
 int n,remaining,half,y,scale;
 unsigned int planes;
 file=0;
 switch(p[0]) {
 case 6: file=data_ov002_022cbf84; height=48; break;
 case 7: file=data_ov002_022cbfa0; height=40; break;
 case 8: file=data_ov002_022cbfbc; sub=1; height=40; break;
 case 9: file=data_ov002_022cbfd4; sub=1; height=40; break;
 }
 switch(p[2]) {
 case 0:
  if (++p[3]<4) return;
  p[2]++; p[3]=0; break;
 case 1:
  func_0208cf58(); func_0208cf44(); func_0208da2c(0x60);
  func_0208c8cc(1,5,1);
  H(0x0400000c)&=~3;
  H(0x0400000c)=(H(0x0400000c)&0x43)|0x4700;
  func_02094504(0,func_0208e120(),0x800);
  func_02094504(0,func_0208de94(),0x40);
  if(sub) {
   func_0208c8b0(5);
   H(0x0400100c)&=~3;
   H(0x0400100c)=(H(0x0400100c)&0x43)|0x5e10;
   func_02094504(0,func_0208e0a0(),0x800);
   func_02094504(0,func_0208de4c(),0x40);
  }
  func_0201d47c(&o);
  o.task=func_02006c0c(file,4,0);
  o.bg=2; o.f8=0; o.fc=0x40; o.enable=0; o.f10=0;
  func_0201e5b8(&o);
  if(sub) {o.bg=7; o.enable=1; o.bank=7; o.f10=0x200; func_0201e5b8(&o);}
  Task_Invoke(o.task);
  func_0208b0f0((int)&m,0xc00,0xc00);
  half=height/2; y=-(0x60-half);
  G2x_SetBGyAffine_((u32)data_ov002_022d0fb4,&m,0x80,half,0,y);
  H(0x04000050)=0;
  if(sub) {G2x_SetBGyAffine_((u32)data_ov002_022d0fd4,&m,0x80,half,0,y); H(0x04001050)=0;}
  p[2]++; p[3]=0;
  switch(p[0]) {
  case 7: func_02037208(0x8b,-1,0,1); break;
  case 6: func_02037208(0x8d,-1,0,1); break;
  case 8: case 9: func_02037208(0x8c,-1,0,1); break;
  }
  break;
 case 2:
  n=p[3]+1; remaining=16-n; scale=0x1000-(remaining<<11)/16;
  p[3]=n;
  func_0208b0f0((int)&m,scale,scale);
  half=height/2; y=-(0x60-half);
  G2x_SetBGyAffine_((u32)data_ov002_022d0fb4,&m,0x80,half,0,y);
  func_0208e318((int *)0x04000050,4,0x3f,n,remaining);
  planes=(W(0x04000000)&0x1f00)>>8;
  W(0x04000000)=(W(0x04000000)&~0x1f00)|((planes|4)<<8);
  if(sub) {
   G2x_SetBGyAffine_((u32)data_ov002_022d0fd4,&m,0x80,half,0,y);
   func_0208e318((int *)0x04001050,4,0x3f,n,remaining);
   planes=(W(0x04001000)&0x1f00)>>8;
   W(0x04001000)=(W(0x04001000)&~0x1f00)|((planes|4)<<8);
  }
  if(p[3]<16) return;
  p[2]++; p[3]=0; break;
 case 3:
  if(++p[3]<100) return;
  p[2]++; p[3]=0; break;
 case 4:
  p[3]++; n=16-p[3]; remaining=16-n;
  func_0208e318((int *)0x04000050,4,0x3f,n,remaining);
  if(sub) func_0208e318((int *)0x04001050,4,0x3f,n,remaining);
  if(p[3]<16) return;
  p[2]++; p[3]=0; break;
 case 5:
  planes=(W(0x04000000)&0x1f00)>>8;
  W(0x04000000)=(W(0x04000000)&~0x1f00)|((planes&~4)<<8);
  H(0x04000050)=0;
  if(sub) {
   planes=(W(0x04001000)&0x1f00)>>8;
   W(0x04001000)=(W(0x04001000)&~0x1f00)|((planes&~4)<<8);
   H(0x04001050)=0;
  }
  func_ov002_022b303c(data_ov002_022d1af8,1);
  p[0]=0;
  break;
 }
}


