typedef unsigned short u16;
typedef unsigned char u8;
struct Slot { u16 side:1; u16 kind:4; u16 number:9; u16 state:2; };
struct Node { char pad[6]; struct { u16 lo:8; u16 hi:8; } count; struct Slot slots[5]; u16 start; };
typedef struct { u16 id; u16 side:1; u16 kind:5; u16 rest:10; } Card;
typedef struct { u16 id; u16 side:1; u16 rest:15; u16 pad:2; u16 flag:1; u16 rest4:13; u16 f6; u16 f8; u16 value; } Obj;
struct State { char pad[0x5a8]; int state; };
extern struct State data_ov002_022ce288;
extern unsigned int func_0202b878(int id);
extern int func_0202e234(int x);
extern int func_0202f9e8(int id);
extern int func_ov002_021b9ecc(int player, int idx);
extern int func_ov002_021c2084(Card *card, int side, int slot, int check);
extern int func_ov002_021de64c(int a, int b, int c, int unused3);
extern void func_ov002_021e1920(int arg0, int arg1, int arg2, int arg3);
extern int func_ov002_021e286c(int arg0);
extern int func_ov002_021e2b1c(int arg0);
extern int func_ov002_0223df38(struct Node *self, int idx, int *out);
extern int func_ov002_0225764c(int arg0, int arg1, int arg2);
extern void func_ov002_0226b054(int arg0);
int func_ov002_022194c8(Obj *self) {
 int packed;
 int side, slot, id;
 if (self->flag) return 0;
 switch (data_ov002_022ce288.state) {
 case 0x80:
  if (func_ov002_0223df38((struct Node *)self, 0, &packed) == 0) return 0;
  side = (u8)packed;
  slot = (u8)((u16)packed >> 8);
  if (func_ov002_0225764c((int)self, side, slot) == 0) return 0;
  if (func_ov002_021c2084((Card *)self, side, slot, 1) == 0) return 0;
  self->value = func_ov002_021b9ecc(side, slot);
  id = self->value;
  if (func_ov002_021de64c((int)self, side, slot, 2) == 0) return 0;
  func_ov002_021e2b1c(30);
  switch (self->id) {
  case 0x1363:
   if (func_0202e234(id) != 0) {
    if (func_0202f9e8(id) == 1) return 0x7f;
   }
   return 0;
  case 0x1364:
   if (func_0202b878(id) == 0x17) return 0x7f;
   return 0;
  }
  return 0;
 case 0x7f:
  func_ov002_021e1920(self->side, self->value, 1, 0);
  return 0x7e;
 case 0x7e:
  func_ov002_021e1920(1-self->side, self->value, 1, 1);
  return 0x7d;
 case 0x7d:
  func_ov002_0226b054(self->side);
  return 0x7c;
 case 0x7c:
  func_ov002_0226b054(1-self->side);
  return 0x7b;
 case 0x7b:
  func_ov002_021e286c(self->side);
  return 0x7a;
 case 0x7a:
  func_ov002_021e286c(1-self->side);
  return 1;
 }
 return 0;
}
