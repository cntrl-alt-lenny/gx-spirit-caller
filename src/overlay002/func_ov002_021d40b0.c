typedef unsigned short u16;
typedef struct { u16 f0,f2,f4,f6; char pad[0x804]; int active,state; unsigned int timer; } State;
typedef struct { int life; char pad[0x864]; } Player;
extern State data_ov002_022ce950;
extern Player data_ov002_022cf16c[];
extern char data_ov002_022cf194[][0x868];
extern struct { int a,b,c; } data_ov002_022cd3f4;
extern struct { int a,player; } data_ov002_022cd73c;
extern struct { char pad[0xcec]; int player; char pad2[0x18]; int card; } data_ov002_022d016c;
extern int func_0202e310(int unused0);
extern int func_ov002_021b0b0c(int arg0);
extern void func_ov002_021b0b54(int id,int value);
extern int func_ov002_021b0bdc(void *self,int arg);
extern int func_ov002_021b0c04(void *self,int arg1);
extern void func_ov002_021b1f20(int,int,int,int,int);
extern int func_ov002_0229ade0(int,int,int,int);
extern int func_ov002_0229c7f8(int);
void func_ov002_021d40b0(int arg) {
 int offset,side;
 char *base;
 int kind,card,delta;
 side = (data_ov002_022ce950.f0 & 0x8000) ? 1:0;
 if(arg) delta=data_ov002_022ce950.f2; else delta=-data_ov002_022ce950.f2;
 kind=data_ov002_022ce950.f4;
 card=data_ov002_022ce950.f6;
 switch(data_ov002_022ce950.state) {
 case 0: {

  func_ov002_0229ade0(14,side,delta,(u16)(((unsigned char)kind<<8)|1));
  offset=(side&1)*0x868;
  base=(char *)data_ov002_022cf16c;
  if(*(int *)(base+offset)>0 && *(int *)(base+offset)<=-delta) {
   data_ov002_022d016c.card=card;
   switch(card) {
   case 0x16ec: case 0x1725: case 0x1729: case 0x1985: case 0x1986: case 0x1b2e: case 0x1b2f:
    if(data_ov002_022cd3f4.c) *(int *)data_ov002_022cf194[(1-side)&1]=card;
    break;
   }
  }
  if(side==(data_ov002_022cd73c.player^1) && delta<0) {
   if(kind==1) {
    int amount=-delta;
    func_ov002_021b0bdc(3,amount);
    func_ov002_021b0c04(4,amount);
    func_ov002_021b0c04(10,amount);
    func_ov002_021b0bdc(9,func_ov002_021b0b0c(10));
    if(data_ov002_022cd3f4.c) {
     func_ov002_021b0c04(7,amount);
     if(func_0202e310(card)) func_ov002_021b0c04(11,amount);
    }
    if(data_ov002_022d016c.player==(data_ov002_022cd73c.player^1)) {
     func_ov002_021b0bdc(5,amount);
     func_ov002_021b0c04(6,amount);
    }
    if(*(int *)(base+offset)>0 && *(int *)(base+offset)<=amount && side==(data_ov002_022cd73c.player^1)) func_ov002_021b0b54(8,amount);
   } else if(kind==0) {
    int amount=-delta;
    func_ov002_021b0bdc(1,amount);
    func_ov002_021b0c04(2,amount);
    func_ov002_021b0c04(10,amount);
    func_ov002_021b0bdc(9,func_ov002_021b0b0c(10));
    if(*(int *)(base+offset)>0 && *(int *)(base+offset)<=amount && side==(data_ov002_022cd73c.player^1)) func_ov002_021b0b54(8,amount);
   }
   func_ov002_021b0b54(55,-delta==*(int *)(base+offset));
  }
  if(side==data_ov002_022cd73c.player && delta<0) func_ov002_021b0b54(54,1);
  if(side==data_ov002_022cd73c.player && delta>0) func_ov002_021b0c04(18,delta);
  data_ov002_022ce950.state++;
  break;
 }
 case 1:
  if(func_ov002_0229c7f8(14)) return;
  func_ov002_0229ade0(73,side,delta,kind);
  data_ov002_022ce950.state++;
  data_ov002_022ce950.timer=0;
  break;
 case 2:
  if(func_ov002_0229c7f8(73)) return;
  if(++data_ov002_022ce950.timer>10) data_ov002_022ce950.state++;
  break;
 case 3:
  func_ov002_0229ade0(14,side,delta,(u16)((unsigned char)kind<<8));
  data_ov002_022ce950.state++;
  break;
 case 4:
  if(func_ov002_0229c7f8(14)) return;
  if(delta<0) {
   int life=data_ov002_022cf16c[side&1].life;
   life+=delta;
   if(life<0) life=0;
   data_ov002_022cf16c[side&1].life=life;
  } else if(data_ov002_022cf16c[side&1].life!=0) data_ov002_022cf16c[side&1].life+=delta;
  if(kind==2 && side==data_ov002_022d016c.player) func_ov002_021b1f20(side,11,33,0x14c0,-delta);
  func_ov002_021b0bdc(19,data_ov002_022cf16c[data_ov002_022cd73c.player&1].life);
  func_ov002_021b0bdc(20,data_ov002_022cf16c[(data_ov002_022cd73c.player^1)&1].life-data_ov002_022cf16c[data_ov002_022cd73c.player&1].life);
  func_ov002_0229ade0(8,0,0,0);
  data_ov002_022ce950.active=0;
  break;
 }
}





