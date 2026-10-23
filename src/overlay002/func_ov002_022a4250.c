typedef unsigned int u32;
typedef unsigned short u16;
struct Mtx22 { int _[4]; };
struct F022b3020 { void *p0; int f4; };
extern int func_02037208(int,int,int,int);
extern void func_0208b0f0(int,int,int);
extern void func_0208b0fc(int,int,int);
extern void func_0208b108(int *,int *,int,int);
extern int func_020b3870(int,int);
extern void func_0208e2f4(volatile u16 *,int,int);
extern void func_0208e318(int *,int,int,int,int);
extern void G2x_SetBGyAffine_(u32,const struct Mtx22 *,int,int,int,int);
extern void func_ov002_022b3020(struct F022b3020 *,void *);
extern char data_ov002_022d0fb4[],data_ov002_022d0fc4[],data_ov002_022d0fd4[],data_ov002_022d0fe4[];
extern struct F022b3020 data_ov002_022d1af8;
extern short data_020bef80[];
static inline void Init(int *m,int a,int b) { func_0208b0f0((int)m,a,b); }
static inline void Rot(int *m,int a,int b) { func_0208b0fc((int)m,a,b); }
#define AFF(d,y) G2x_SetBGyAffine_((u32)(d), (const struct Mtx22 *)m,128,28,0,(y))
#define DISP(a,b) { u32 bits = (*(volatile u32 *)(a) & 0x1f00) >> 8; *(volatile u32 *)(a) = (*(volatile u32 *)(a) & ~0x1f00) | ((bits | (b)) << 8); }
#define HIDE(a) { u32 bits = (*(volatile u32 *)(a) & 0x1f00) >> 8; *(volatile u32 *)(a) = (*(volatile u32 *)(a) & ~0x1f00) | ((bits & ~12) << 8); }
void func_ov002_022a4250(int *p) {
 int m[4];
 int t;
 ++p[2];
 Init(m,4096,4096);
 if(p[2] == 13) func_02037208(136,-1,0,1);
 t=p[2];
 if(t<=1) {
  AFF(data_ov002_022d0fe4,192);
 } else if(t<16) {
  int a=(unsigned short)((t<<16)/16)>>4;
  int scale;
  func_0208b0fc((u32)m,data_020bef80[a*2],data_020bef80[a*2+1]);
  scale=func_020b3870(65536,32-t);
  func_0208b108(m,m,scale,scale);
  AFF(data_ov002_022d0fb4,-68);
  AFF(data_ov002_022d0fe4,-68);
  DISP(0x04000000,4);
  DISP(0x04001000,8);
 } else if(t<40) {
  int b;
  AFF(data_ov002_022d0fb4,-68);
  AFF(data_ov002_022d0fc4,-192);
  DISP(0x04000000,4);
  AFF(data_ov002_022d0fd4,-192);
  AFF(data_ov002_022d0fe4,-68);
  DISP(0x04001000,8);
  b=(t-16)/2-16;
  func_0208e2f4((volatile u16 *)0x04000050,51,b);
  func_0208e2f4((volatile u16 *)0x04001050,51,b);
 } else if(t<=56) {
  int a=(t-40)*2;
  int b=32-a;
  int y3=(a*96+b*324)/32;
  int y1=(a*40+b*-188)/32;
  int y0=(a*40+b*68)/32;
  int y2=(a*96+b*68)/32;
  AFF(data_ov002_022d0fb4,-y0);
  if(y1+256<192) {
   *(volatile u16 *)0x0400000e=(*(volatile u16 *)0x0400000e&0x43)|0x4700;
   AFF(data_ov002_022d0fc4,-(y1+256));
  } else if(y3<192) {
   *(volatile u16 *)0x0400000e=(*(volatile u16 *)0x0400000e&0x43)|0x4f04;
   AFF(data_ov002_022d0fc4,-y3);
  } else { AFF(data_ov002_022d0fc4,-192); }
  if(y3-256>=-56) {
   *(volatile u16 *)0x0400100c=(*(volatile u16 *)0x0400100c&0x43)|0x5f18;
   AFF(data_ov002_022d0fd4,-(y3-256));
  } else if(y1>=-56) {
   *(volatile u16 *)0x0400100c=(*(volatile u16 *)0x0400100c&0x43)|0x5e10;
   AFF(data_ov002_022d0fd4,-y1);
  } else { AFF(data_ov002_022d0fd4,-192); }
  AFF(data_ov002_022d0fe4,-y2);
  DISP(0x04000000,12);
  DISP(0x04001000,12);
  *(volatile u16 *)0x04000050=0;
  *(volatile u16 *)0x04001050=0;
 } else if(t<88) {
  int b=16-(t-56);
  if(b<0) return;
  func_0208e2f4((volatile u16 *)0x04000050,12,b);
  func_0208e2f4((volatile u16 *)0x04001050,12,b);
 } else if(t<104) {
  int a=t-88;
  int b=16-a;
  func_0208e318((int *)0x04000050,12,63,b,a);
  func_0208e318((int *)0x04001050,12,63,b,a);
 } else {
  HIDE(0x04000000);
  HIDE(0x04001000);
  *(volatile u16 *)0x04000050=0;
  *(volatile u16 *)0x04001050=0;
  p[0]=0;
  func_ov002_022b3020(&data_ov002_022d1af8,(void *)1);
 }
}




