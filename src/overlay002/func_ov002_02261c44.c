typedef unsigned int u32;
typedef unsigned short u16;
typedef unsigned char u8;
struct Card { u32 id:13; u32 flag:1; u32 rest:8; u32 value:8; u32 tail:2; u16 x; u16 busy; u16 active; u16 y; int z; u32 flags; };
struct Player { char head[0x30]; struct Card cards[11]; char gap[0x30c]; struct CardWord {u32 id:13; u32 flag:1; u32 rest:8; u32 value:8; u32 tail:2;} deck[1]; char end[0x44c]; };
struct State {char head[0xcec]; int player; char pad[0x3c]; int step; int sub;};
extern struct State data_ov002_022d016c;
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf180[];
extern int func_0202e234(int x);
extern int func_ov002_021b3ecc(int,int,int);
extern int func_ov002_021b4120(int,int,int);
extern int func_ov002_021b8fcc(int,int);
extern int func_ov002_021b947c(int);
extern int func_ov002_021b9e00(int,int);
extern int func_ov002_021b9ecc(int,int);
extern int func_ov002_021baca8(int,int,int);
extern int func_ov002_021bd030(int);
extern int func_ov002_021d59cc(int,int,int,int,unsigned short);
extern void func_ov002_021d5b80(int,int,int,int);
extern void func_ov002_021d5d58(int,int,int,int);
extern int func_ov002_021d6870(int,int,int,int,int,int);
extern int func_ov002_021d8414(int,int,int,int,int,int,int);
extern void func_ov002_021d91e0(int,int,int);
extern void func_ov002_021de41c(int,int,int);
extern int func_ov002_021de480(int,int,int,int);
extern void func_ov002_021df62c(int,int,int);
extern void func_ov002_021df6d4(int,int);
extern int func_ov002_021e30b4(int,int,int);
extern void func_ov002_02244fe4(int,u32);
#define ROW(p) ((struct Player *)(data_ov002_022cf16c + ((p)&1)*0x868))
#define POWER(c) ((c).value*2+(c).flag)
int func_ov002_02261c44(int a) {
 switch(data_ov002_022d016c.sub) {
 case 0:
  func_ov002_02244fe4(0x17,0);
  data_ov002_022d016c.sub++;
  return 0;
 case 1: {
  int i,p,j,id;
  struct Player *r;
  for(i=0;i<2;i++) {
   p=data_ov002_022d016c.player ^ i;
   r=ROW(p);
   for(j=0;j<5;j++) {
    if ((r->cards[j].active & ~((r->cards[j].flags>>6)&1)) & ~(((r->cards[j].flags>>1)|(r->cards[j].flags>>2))&1)) {
     id=func_ov002_021b9ecc(p,j);
     switch(id) {
     case 0x1419: case 0x1566: case 0x15d2: case 0x1912: case 0x1915:
      if(func_ov002_021b3ecc(p,j,0x14d6) && r->cards[j].busy==0) {
       func_ov002_021d5b80(p,j,0x14d6,1);
       func_ov002_021df62c(p,j,POWER(r->cards[j]));
       func_ov002_021d6870(p,j,0,0,id,0);
       func_ov002_021d59cc(p,j,0x1419,0x22,0);
      }
      break;
     case 0x14d7:
      if(func_ov002_021b3ecc(p,j,id)) func_ov002_021d5b80(p,j,id,1);
      break;
     case 0x1983:
      if(func_ov002_021b3ecc(p,j,id) && func_ov002_021b9e00(p,j)) {
       func_ov002_021df62c(p,j,POWER(r->cards[j]));
       func_ov002_021d91e0(p,j,-func_ov002_021b9e00(p,j));
      }
      break;
     case 0x1a61:
      if(func_ov002_021b3ecc(p,j,0x14d6) && r->cards[j].busy==0) {
       func_ov002_021df62c(p,j,POWER(r->cards[j]));
       func_ov002_021d6870(p,j,0,0,id,0);
      }
      break;
     }
    }
   }
  }
  data_ov002_022d016c.sub++;
  return 0;
 }
 case 2: {
  int i,p,j;
  for(i=0;i<2;i++) {
   p=data_ov002_022d016c.player^i;
   for(j=0;j<5;j++) if(func_ov002_021b3ecc(p,j,0x1392)) {
    func_ov002_021df6d4(p,0x1392);
    func_ov002_021de480(p,j,1,0x1392);
   }
  }
  data_ov002_022d016c.sub++;
  return 0;
 }
 case 3: {
  int i,n,q,found;
  u8 pos;
  int p,j,v,loc;
  for(i=0;i<2;i++) {
   p=data_ov002_022d016c.player^i;
   for(j=0;j<5;j++) {
    if(func_ov002_021baca8(p,j,0x12a6)) {
     v=func_ov002_021b4120(p,j,0x12a6);
     if(v>=0) {
      q=v&1; n=v/2;
      found=func_ov002_021bd030(q);
      loc=func_ov002_021b947c(n); pos=(u8)loc;
      if(found>=0 && (u8)((u16)loc>>8)==14) {
       func_ov002_021df62c(p,j,POWER(ROW(p)->cards[j]));
       func_ov002_021d8414((u8)pos,14,n,q,found,1,0);
       func_ov002_021d5d58(q,(u16)((u8)q|((u8)found<<8)),(u16)((u8)p|((u8)j<<8)),12);
      }
      func_ov002_021d5b80(p,j,0x12a6,0);
      return 0;
     }
    }
   }
  }
  data_ov002_022d016c.sub++;
 }
 case 4: {
  int i;
  for(i=0;i<2;i++) if(func_ov002_021b3ecc(i,11,0x1415)) {
   if(func_ov002_021e30b4((((u32)i<<31)&0x80000000)|0x501415,0,0)==0)
    func_ov002_021d5b80(i,11,0x1415,0);
   return 0;
  }
  data_ov002_022d016c.sub++;
 }
 case 5: {
  int i,p,j,v;
  for(i=0;i<2;i++) {
   p=data_ov002_022d016c.player^i;
   for(j=0;j<5;j++) if(func_ov002_021baca8(p,j,0x1a95)) {
    v=func_ov002_021b4120(p,j,0x1a95);
    if(v>=0) {
     func_ov002_021e30b4(((((u32)p<<31)&0x80000000)|0x200000|(((u32)j<<16)&0x1f0000)|0x1a95),(u16)POWER(ROW(p)->cards[j]),v);
     func_ov002_021d5b80(p,j,0x1a95,0);
     return 0;
    }
   }
  }
  data_ov002_022d016c.sub++;
 }
 case 6: {
  struct Card *c;
  int i,p,j;
  for(i=0;i<2;i++) {
   p=data_ov002_022d016c.player^i;
   c=ROW(p)->cards;
   for(j=0;j<5;j++,c++) if(c->id) func_ov002_021d5b80(p,j,0x12e2,1);
  }
  data_ov002_022d016c.sub++;
  return 0;
 }
 case 7: {
  int bits=0,i;
  struct Card *c;
  int k,p,j;
  for(i=0;i<2;i++) {
   p=data_ov002_022d016c.player^i;
   c=ROW(p)->cards;
   k=p<<4;
   for(j=0;j<5;j++,c++,k++) if(c->id && !func_0202e234(c->id) && !func_ov002_021b8fcc(p,j) && func_ov002_021b3ecc(p,j,0x1362)) bits |= 1<<k;
  }
  if(bits) {func_ov002_021de41c(1-a,0x1362,bits); return 0;}
  data_ov002_022d016c.sub++;
 }
 case 8: {
  if(func_ov002_021b3ecc(a,11,0x1512)) {
   int bits=0,i;
   struct Card *c;
   int k,p,j;
   for(i=0;i<2;i++) {
    p=data_ov002_022d016c.player^i;
    c=ROW(p)->cards;
    k=p<<4;
    for(j=0;j<5;j++,c++,k++) if(c->id && func_ov002_021b3ecc(p,j,0x1512)) bits|=1<<k;
   }
   if(bits) {func_ov002_021df6d4(a,0x1512);func_ov002_021de41c(a,0x1512,bits);}
  }
  data_ov002_022d016c.sub++;
  return 0;
 }
 case 9: {
  int p=1-a;
  struct CardWord *c;
  int sign;
  struct Player *r;
  u32 i;
  i=0;
  if(*(u32 *)(data_ov002_022cf180+(p&1)*0x868)>i) {
  r=ROW(p);
  c=(struct CardWord *)((char *)r+0x418);
  sign=(((u32)p<<31)&0x80000000)|0x4e1571;
  do {
   if(c->id==0x1571) if(func_ov002_021e30b4(sign,(u16)POWER(*c),0)) return 0;
  i++; c++;
  } while(i<*(u32 *)((char *)r+0x14));
  }
  data_ov002_022d016c.sub++;
  return 0;
 }
 default:
  func_ov002_021d5b80(a,11,0x1469,1);
  if(!func_ov002_021b3ecc(a,11,0x11ed)) return 1;
  func_ov002_021d5b80(a,11,0x11ed,1);
  data_ov002_022d016c.step=0;
  data_ov002_022d016c.sub=0;
  return 0;
 }
}







