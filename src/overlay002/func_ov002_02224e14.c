typedef unsigned short u16;
typedef unsigned char u8;
typedef struct { u16 w0; u16 bit0:1; u16 pad1:13; u16 bit14:1; u16 pad15:1; } S021ff3bc;
struct node { char pad[8]; u16 arr8[5]; u16 f18; };
struct Node;
struct State { char pad[0x5a8]; int state; int side; };
struct Card { unsigned id:13; unsigned side:1; unsigned rest:18; char tail[16]; };
struct Player { char pad[0x30]; struct Card cards[12]; char pad2[0x808]; };
extern struct State data_ov002_022ce288;
extern char data_ov002_022cf16c[];
extern u16 data_ov002_022d0e6c[];
extern int func_ov002_021de910(int a, int b, int c);
extern int func_ov002_021ff46c(S021ff3bc *p, int unused1);
extern u16 func_ov002_0223de94(struct node *arg0, int arg1);
extern int func_ov002_0223df38(struct Node *self, int idx, int *out);
extern int func_ov002_0225764c(int arg0, int arg1, int arg2);
extern void func_ov002_0226afb4(int arg0, int arg1);
extern int func_ov002_0227adb8(int a, int b, int c, int d);
int func_ov002_02224e14(S021ff3bc *p, int unused) {
 switch (data_ov002_022ce288.state) {
 case 0x80:
  if (func_ov002_0223df38((struct Node *)p,0,0)) {
   int a,b;
   int pair=func_ov002_0223de94((struct node *)p,0);
   a=(u8)pair;
   b=(u8)((u16)pair >> 8);
   if (func_ov002_0225764c((int)p,a,b)) {
    data_ov002_022ce288.side=((struct Card *)(data_ov002_022cf16c+(a&1)*0x868+b*20+0x30))->side;
    func_ov002_021de910((int)p,a,b);
    return 0x7f;
   }
  }
  return 0;
 case 0x7f:
  p->bit14=(u16)(p->bit0 != data_ov002_022ce288.side);
  {
   int result=func_ov002_021ff46c(p,unused);
   p->bit14=0;
   if (!result) return 0;
  }
  func_ov002_0226afb4(data_ov002_022ce288.side,p->w0);
  return 0x7e;
 case 0x7e:
  func_ov002_0227adb8(data_ov002_022ce288.side,(int)(data_ov002_022cf16c+(data_ov002_022ce288.side&1)*0x868+0x120+data_ov002_022d0e6c[0x58]*4),1,p->w0<<16);
  return 0;
 }
 return 0;
}
