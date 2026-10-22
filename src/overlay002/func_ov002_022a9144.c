typedef unsigned short u16;
typedef unsigned int u32;
typedef struct { int x,y; } Point;
typedef struct { u32 packed; u16 tag; } Event;
typedef struct { u16 side:1,kind:5,idx:8,pad:2; } Bits;
typedef struct { u32 id:13; u32 pad:19; } Card;
extern int data_ov002_022cd73c[];
typedef struct { Card card; char pad[16]; } Slot;
typedef struct { char pad[0x30]; Slot slots[5]; char tail[0x7d4]; } Side;
extern Side data_ov002_022cf16c[];
extern char data_ov002_022d0f98[];
extern short data_020bef80[];
extern void func_02006110(int *,int *);
extern unsigned int func_02006194(void);
extern int func_0207ef90(void *,void *);
extern void func_0207f05c(void *,void *,int);
extern void func_0208b0fc(int,int,int);
extern int func_0208c66c(int,int);
extern int func_ov002_021be2d8(int,int,int);
extern int func_ov002_0229d2c8(void *);
extern void *func_ov002_022a6324(char *,int,int,int);
extern Point func_ov002_022a6e04(char *,int,int,int);
/* Original caller supplies self although the existing definition takes no arguments. */
extern int func_ov002_022a8694();
#define I(o) (*(int *)(self+(o)))
void func_ov002_022a9144(char *self) {
 int angle;
 int x;
 int y;
 int mat[4];
 Event ev;
 Point start,end,pos;


 if (I(0x620)==0) return;
 ev.packed=0x80002000;
 ev.tag=0x1529;
 if (I(0x620)>=3) {
  { Point t; t=func_ov002_022a6e04(self,I(0x628),I(0x62c),0); start=t; }
  if (I(0x620)==3) {
   if (func_ov002_022a8694(self)!=0 && func_02006194()!=0) func_02006110(&end.x,&end.y);
   else { Bits *b=(Bits *)(self+0x590); Point t; t=func_ov002_022a6e04(self,b->side,b->kind,b->idx); end=t; }
  } else {
   if (I(0x634)>4) { Point t; t=func_ov002_022a6e04(self,I(0x630),7,0); end=t; }
   else { Point t; t=func_ov002_022a6e04(self,I(0x630),I(0x634),0); end=t; }
  }
  y=start.y;
  angle=(u16)-func_0208c66c(start.x-end.x,y-end.y);
  if (I(0x624)<128) {
   if (I(0x628)==(data_ov002_022cd73c[1]^1)) { angle-=0x8000; angle*=I(0x624); angle/=128; angle+=0x8000; }
   else { angle=(short)angle; angle*=I(0x624); angle/=128; }
   angle=(u16)angle;
   x=start.x;
  } else {
   x=start.x+(I(0x624)-128)*(end.x-start.x)/128;
   y=y+(I(0x624)-128)*(end.y-y)/128;
  }
  func_0208b0fc((int)mat,data_020bef80[(angle>>4)*2],data_020bef80[(angle>>4)*2+1]);
  x-=(angle>0 && angle<=0x8000 ? 1 : 0);
  y-=(angle>0x4000 && angle<=0xc000 ? 1 : 0);
  ev.packed=(ev.packed&0xfe00ff00)|((y-16)&255)|((u32)((x-16)<<23)>>7);
  { int affine=func_0207ef90(data_ov002_022d0f98,mat);
  ev.packed=(ev.packed&0xc1fffcff)|0x100|(affine<<25);
  ev.tag=(ev.tag&~0x3ff)|0x131; }
  func_0207f05c(data_ov002_022d0f98,&ev,1);
  if (I(0x624)>128) {
   start.x-=(angle>0 && angle<=0x8000 ? 1 : 0);
   start.y-=(angle>0x4000 && angle<=0xc000 ? 1 : 0);
   ev.packed=(ev.packed&0xfe00ff00)|((start.y-16)&255)|((u32)((start.x-16)<<23)>>7);
   ev.tag=(ev.tag&~0x3ff)|0x139;
   func_0207f05c(data_ov002_022d0f98,&ev,1);
  }
 }
 if (I(0x61c)<0) {
  I(0x61c)=0;
  for(int i=0;i<5;i++) {
   if (data_ov002_022cf16c[I(0x628)&1].slots[i].card.id) {
    if (func_ov002_021be2d8(I(0x628),i,1)) I(0x61c)|=1<<i;
   }
  }
 }
 for(int i=0;i<5;i++) {
  if (I(0x620)>2 && i==I(0x62c)) continue;
  if (!data_ov002_022cf16c[I(0x628)&1].slots[i].card.id) continue;
  if (func_ov002_0229d2c8(func_ov002_022a6324(self,I(0x628),i,0))!=0) continue;
  if (!(I(0x61c)&(1<<i))) continue;
  { Point t; t=func_ov002_022a6e04(self,I(0x628),i,0); pos=t; }
  ev.packed=(ev.packed&0xfe00ff00)|((pos.y-16)&255)|((u32)((pos.x-16)<<23)>>7);
  ev.packed=(ev.packed&0xc1fffcff)|(I(0x628)==(data_ov002_022cd73c[1]^1)?0x30000000:0);
  ev.tag=(ev.tag&~0x3ff)|0x129;
  func_0207f05c(data_ov002_022d0f98,&ev,1);
 }
}

















