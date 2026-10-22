typedef unsigned short u16;
typedef unsigned int u32;
struct Arg1 { u16 f0; u16 bit0:1; u16 pad:13; u16 bit14:1; u16 pad2:1; };
struct State { char p0[0x480]; int f480; char p1[0x1f8]; int state; int f680; int f684; int f688; int f68c; };
struct Dialog { char p[0xd44]; int f44; int f48; int f4c; int f50; int f54; int f58; int f5c; int f60; int f64; int f68; int f6c; int f70; int f74; };
struct Flags { char p[0x300]; u32 pad:5; u32 ready:1; u32 rest:26; };
extern struct State data_ov002_022ce288;
extern struct Dialog data_ov002_022d016c;
extern struct Flags data_ov002_022cd968;
extern int data_ov002_022cd744[];
extern unsigned int data_ov002_022ca9b8;
extern int func_0202b100(int a0);
extern int func_0202e234(int x);
extern int func_ov002_021ae4a0(int x,int y);
extern void func_ov002_021b1458(int a,int b,int c,int d);
extern void func_ov002_021d479c(u16 a,u16 b,u16 c,u16 d);
extern int func_ov002_02245f18(struct Arg1 *p,int side,int mode);
extern void func_ov002_02258168(int arg);
extern void func_ov002_022582b4(int arg);
extern void func_ov002_022583b4(int a,int b,int c);
extern void func_ov002_022592b8(int arg);
extern int func_ov002_0228c330(int player,struct Arg1 *arg1);
extern void func_ov002_0229cd88(void *self,unsigned int arg1);
extern void func_ov002_0229cdb8(void *self,unsigned int arg1);
extern void func_ov002_0229ce5c(void *self,unsigned int a,unsigned int b);
int func_ov002_021e3968(struct Arg1 *p,int side) {
 char buf[256];
 int mode;
 switch(data_ov002_022ce288.state) {
 case 0: data_ov002_022ce288.state++;
 case 1: case 5:
  if(data_ov002_022cd744[side]==1) {
   if(func_ov002_02245f18(p,side,1) && func_ov002_0228c330(side,p)) {
    data_ov002_022ce288.state=11; return 0;
   }
   return 1;
  } else if(data_ov002_022cd744[side]==2) {
   data_ov002_022ce288.state=20;
  } else {
   if(func_ov002_02245f18(p,side,0)==0) {
    func_ov002_0229cd88(buf,0xcd);
    func_ov002_0229cdb8(buf,(u32)&data_ov002_022ca9b8);
    func_ov002_0229cdb8(buf,0xce);
    mode=0;
   } else if(func_0202e234(p->f0)) {
    func_ov002_0229ce5c(buf,7,func_0202b100(p->f0));
    mode=func_ov002_02245f18(p,side,1)+1;
   } else {
    func_ov002_0229ce5c(buf,8,func_0202b100(p->f0));
    mode=func_ov002_02245f18(p,side,1)+1;
   }
   if(data_ov002_022ce288.state==5) mode=3;
   func_ov002_021ae4a0((int)buf,mode);
   data_ov002_022ce288.state=2;
  }
  return 0;
 case 2:
  if(data_ov002_022d016c.f44==0) return 1;
  data_ov002_022ce288.state=10;
  data_ov002_022d016c.f50=0;
  return 0;
 case 10:
  func_ov002_022592b8(5);
  data_ov002_022ce288.state++;
  return 0;
 case 11:
  if(data_ov002_022d016c.f50==0) { data_ov002_022ce288.state=5; return 0; }
  if(data_ov002_022d016c.f64!=3) {
   data_ov002_022d016c.f54=1;
   data_ov002_022ce288.state--;
   return 0;
  }
  data_ov002_022ce288.state=30;
  return 0;
 case 20:
  func_ov002_021b1458(15,(u16)data_ov002_022ce288.f480,0,0);
  data_ov002_022ce288.f68c=0;
  data_ov002_022cd968.ready=0;
  data_ov002_022ce288.state++;
  return 0;
 case 21:
  if(data_ov002_022cd968.ready==0) return 0;
  if(data_ov002_022ce288.f68c==0) return 1;
  data_ov002_022ce288.state=30;
  return 0;
 case 30:
  func_ov002_021d479c((u16)((side?0x8000:0)|0x62),(u16)(side!=(p->bit0 ^ p->bit14)),0,0);
  data_ov002_022ce288.state++;
 case 31:
  switch(data_ov002_022d016c.f74) {
  case 11:
   if(func_0202e234(data_ov002_022d016c.f5c)) func_ov002_022582b4((int)p);
   else func_ov002_022583b4(1,1,(int)p);
   break;
  case 12: case 13: case 14: case 15: break;
  default: func_ov002_02258168((int)p); break;
  }
  if(data_ov002_022d016c.f50!=0) return 0;
  data_ov002_022ce288.f688=0;
  data_ov002_022ce288.f68c=1;
  return 1;
 default: return 1;
 }
}

