typedef unsigned short u16;
struct Obj {
 u16 first;
 u16 side:1; u16 slot:5; u16 unused2:10;
 u16 bit0:1; u16 bit1:1; u16 bit2:1; u16 bit3:1; u16 pad4:2; u16 key:9; u16 pad5:1;
};
extern unsigned int func_ov002_021b947c(int key);
extern void func_ov002_021d8904(int player, int idx, int value);
extern int func_ov002_021de4b0(int arg0, int arg1, int arg2);
extern int func_ov002_021dee94(void *self, int flag);
extern void func_ov002_021e2550(void *self, int a, int b, int c);
extern void func_ov002_021e2570(int a, int b, int c);
extern int func_ov002_021e286c(int arg0);
extern int data_ov002_022cd3f4[];
struct Player { char pad[0x120]; int cards[466]; };
extern struct Player data_ov002_022cf16c[];
int func_ov002_022304d4(struct Obj *self, struct Obj *other) {
 unsigned int packed;
 int kind;
 if (!other) return 0;
 other->bit1 = 1;
 other->bit2 = other->bit1;
 other->bit3 = other->bit2;
 packed = func_ov002_021b947c(other->key);
 func_ov002_021d8904(other->side, other->slot, other->key);
 kind = ((u16)packed >> 8) & 0xff;
 if ((unsigned int)kind <= 10) {
  if ((u16)(packed >> 16)) {
   func_ov002_021dee94(self, data_ov002_022cd3f4[1] == other->side && data_ov002_022cd3f4[8] == other->slot);
  } else {
   func_ov002_021de4b0((int)self, other->side, other->slot);
  }
 } else if (kind == 11) {
  int side = other->side;
  int index = (u16)(packed >> 16);
  struct Player *row = &data_ov002_022cf16c[side & 1];
  func_ov002_021e2550(side, (u16)index, (int)&row->cards[(u16)index], side != self->side);
 } else if (kind == 13) {
  int side = packed & 0xff;
  func_ov002_021e2570(side, (u16)(packed >> 16), side != self->side);
  func_ov002_021e286c(side);
 }
 return 0;
}


