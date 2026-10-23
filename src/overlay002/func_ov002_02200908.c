typedef unsigned short u16;
typedef unsigned char u8;
typedef struct {
 u16 id;
 u16 player:1; u16 slot:5; u16 kind:6; u16 state:2; u16 flag:1; u16 pad:1;
 u16 pad4:6; u16 index:9; u16 top:1;
 u16 count:8; u16 pad6:8;
} Card;
typedef struct { char _pad[6]; u16 field6:8; u16 pad6h:8; } S021b8ecc;
struct F021ff354_Self;
typedef struct { char pad0[2]; u16 bit0:1; u16 pad1:15; u16 pad4_0_6:6; u16 field6_9:9; u16 pad4_15:1; } S021ff2c8;
struct node;
extern unsigned int func_0202b878(int id);
extern unsigned int func_0202b8c0(int id);
extern int func_0202e234(int x);
extern int func_02031358(int x);
extern int IsValue12D3Or147E(int a0);
extern int func_ov002_021b59b0(Card *);
extern int func_ov002_021b8ecc(S021b8ecc *p);
/* These thunks are called with fewer arguments than their C definitions. */
extern int func_ov002_021bb90c();
extern int func_ov002_021c8940();
extern int func_ov002_021bc8c8(int self,int player,int slot);
extern int func_ov002_021c24f8(int arg0);
extern int func_ov002_021f4194(u16 *p);
extern int func_ov002_021ff14c(int,int,int,int,int);
extern int func_ov002_021ff170(int,int,int,int,int);
extern int func_ov002_021ff2c8(S021ff2c8 *p,int arg1);
extern int func_ov002_021ff354(struct F021ff354_Self *self,int unused1);
extern int func_ov002_0220803c(Card *,Card *);
extern u16 func_ov002_0223de94(struct node *arg0,int arg1);
extern char data_ov002_022d016c[];
extern char data_ov002_022cf1a4[];
extern char data_ov002_022cf178[];
int func_ov002_02200908(Card *self, Card *other) {
 if (other == 0) return 0;
 if (other->slot > 10) return 0;
 if (other->state != 0) return 0;
 if (IsValue12D3Or147E(other->id) != 0) return 0;
 switch(self->id) {
 case 0x12f5:
  if (other->player == self->player) return 0;
  return other->id == 0x10f6;
 case 0x12f6:
  if (other->player == self->player) return 0;
  return other->id == 0x12ea;
 case 0x12f7:
  if (other->player == self->player) return 0;
  return other->id == 0x10f7;
 case 0x131c:
  if (other->player == self->player) return 0;
  return (other->id == 0x1246) * 2;
 case 0x12fe: case 0x15fc: case 0x16a6:
  if (func_0202b878(other->id) != 0x16) return 0;
  return func_ov002_021ff354((struct F021ff354_Self *)self,(int)other);
 case 0x12ff:
  return func_0202b878(other->id) == 0x17;
 case 0x1721:
  if (other->player == self->player) return 0;
  if (*(int *)(data_ov002_022d016c + 0xcf8) != 3) return 0;
  return func_0202b878(other->id) == 0x17;
 case 0x140d:
  if (other->player == self->player) return 0;
  return func_0202b878(other->id) == 0x16;
 case 0x1470:
  if (other->player == self->player) return 0;
  if (func_0202b878(other->id) != 0x16) return 0;
  if (func_ov002_021ff354((struct F021ff354_Self *)self,(int)other) == 0) return 0;
  switch (func_ov002_021b59b0(other)) { case 1: case 4: return 1; default: return 0; }
 case 0x148f:
  if (func_0202b878(other->id) != 0x16) return 0;
  return func_ov002_021b8ecc((S021b8ecc *)other) != 0;
 case 0x153e:
  if (other->count == 1) {
   if (func_0202e234(other->id) == 0) {
    int v = (int)func_ov002_0223de94((struct node *)other,0);
    int slot = (u8)((u16)v >> 8);
    int player = (u8)v;
    if(slot <= 4) {
     if (*(u16 *)(data_ov002_022cf1a4 + (player & 1)*0x868 + slot*20) != 0) {
      if(func_ov002_021c8940(player,slot) == 2) return 1;
     }
    }
   }
  }
  return 0;
 case 0x1541:
  if (func_0202e234(other->id) == 0) {
   if(func_ov002_021b59b0(other) != 0) {
    if(func_ov002_021b59b0(other) < 4) return 1;
   }
  }
  return 0;
 case 0x15f1:
  if (func_0202b878(other->id) != 0x16) return 0;
  if(func_ov002_021b8ecc((S021b8ecc *)other) != 0) return 1;
  return func_ov002_021ff170(self->player,1,self->index,0,1) != 0;
 case 0x162a:
  return other->id == 0x12ec;
 case 0x1634:
  if (func_0202b878(other->id) != 0x16) return 0;
  { int n = func_ov002_021c24f8(self->player); return n >= func_ov002_021f4194((u16 *)self); }
 case 0x16dd:
  if (func_0202b878(other->id) != 0x16) return 0;
  return func_ov002_021ff14c(self->player,1,self->index,0,1) != 0;
 case 0x176b:
  if (func_0202b878(other->id) != 0x16) return 0;
  return func_0202b8c0(other->id) == 3;
 case 0x18dd:
  if (other->player == self->player) return 0;
  if (func_0202b878(other->id) != 0x16) return 0;
  return func_0202b8c0(other->id) == 4;
 case 0x18de:
  if (other->player == self->player) return 0;
  if (func_0202b878(other->id) != 0x17) return 0;
  return func_0202b8c0(other->id) == 4;
 case 0x1960:
  return func_ov002_021bb90c(self->player,0x18a6) > 0;
 case 0x148c:
  { int side = self->player ^ self->flag;
   if(*(int *)(data_ov002_022d016c + 0xcec) == 1-side) {
    int otherSide = other->player ^ other->flag;
    if(otherSide != side) {
     if(func_0202b878(other->id) == 0x16)
      return func_ov002_021bc8c8(self->player ^ self->flag,self->player,self->slot);
    }
   }
  }
  return 0;
 case 0x14b6:
  if(func_0202b878(other->id) == 0x16) { if(func_0202b8c0(other->id) == 0) return 1; }
  return 0;
 case 0x14c7:
  if(func_0202b878(other->id) == 0x17) { if(func_0202b8c0(other->id) == 0) return 1; }
  return 0;
 case 0x17c6: case 0x19e2:
  return func_0202b878(other->id) == 0x17;
 case 0x17d4: case 0x19e1:
  return func_0202b878(other->id) == 0x16;
 case 0x183a:
  if((other->player ^ other->flag) != (self->player ^ self->flag)) {
   if(func_0202b878(other->id) == 0x17)
    return func_ov002_021bc8c8(self->player ^ self->flag,self->player,self->slot);
  }
  return 0;
 case 0x1a24:
  if(other->player == self->player) return 0;
  if(func_0202b878(other->id) != 0x17) return 0;
  return func_ov002_0220803c(self,other);
 case 0x1a25:
  if(other->player == self->player) return 0;
  if(func_0202b878(other->id) != 0x16) return 0;
  return func_ov002_0220803c(self,other);
 case 0x12da:
  if(func_02031358(other->id) == 0) return 0;
  switch(other->id) {
   case 0x12fa:
    if(*(int *)(data_ov002_022cf178 + ((1-self->player)&1)*0x868) == 0) return 0;
    break;
   case 0x12f0: case 0x1324: case 0x1325: case 0x132b:
    if(func_ov002_021ff2c8((S021ff2c8 *)self,self->player) == 0) return 0;
    break;
  }
  return 1;
 default: return 0;
 }
}







