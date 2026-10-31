typedef unsigned short u16;
typedef unsigned char u8;
struct S021ff3bc { u16 w0; u16 bit0:1; u16 pad1:13; u16 bit14:1; u16 pad15:1; };
struct Node0223def4 { char pad[8]; u16 arr8[5]; u16 f18; };
struct State { char pad[0x5a8]; int state; };
struct Card { unsigned id:13; unsigned side:1; unsigned rest:18; };
struct Player { char pad[0x418]; struct Card cards[276]; };
extern struct State data_ov002_022ce288;
extern struct Player data_ov002_022cf16c[];
extern int func_ov002_021ff3bc(struct S021ff3bc *, int);
extern int func_ov002_0223def4(struct Node0223def4 *, int);
extern unsigned int func_ov002_021b947c(int);
extern int func_ov002_021c33e4(int a,int b,int c);
extern int func_ov002_021ca698(int arg0,int arg1);
extern int func_ov002_0227adb8(int a,int b,int c,int d);
extern void func_ov002_021d8128(int arg0,void *arg1,int arg2);
int func_ov002_02224044(struct S021ff3bc *self, int unused) {
 switch(data_ov002_022ce288.state) {
 case 0x80:
  if(func_ov002_021ff3bc(self,unused)) {
   unsigned int word=func_ov002_021b947c(func_ov002_0223def4((struct Node0223def4 *)self,0));
   int lo=(u8)word;
   int kind=(u8)((u16)word >> 8);
   int index=(u16)(word >> 16);
   if(kind==14 && func_ov002_021c33e4(self->bit0,lo,index)) {
    func_ov002_0227adb8(self->bit0,(int)&data_ov002_022cf16c[lo & 1].cards[index],1,0);
   }
  }
  return 0x7f;
 case 0x7f:
  if(func_ov002_021ca698(self->bit0,1-self->bit0)) {
   unsigned int word=func_ov002_021b947c(func_ov002_0223def4((struct Node0223def4 *)self,1));
   int kind=(u8)((u16)word >> 8);
   if(kind==14) {
    int lo=(u8)word;
    int index=(u16)(word >> 16);
    struct Card *card=&data_ov002_022cf16c[lo & 1].cards[index];
    func_ov002_021d8128(card->side,card,self->bit0 != card->side);
   }
  }
  return 0x7e;
 }
 return 0;
}
