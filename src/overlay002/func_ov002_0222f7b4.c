typedef unsigned short u16;
struct Self { u16 id; u16 pad[3]; u16 slots[2]; };
struct Context { char pad[0x5a8]; int state; int index; };
struct Player { char pad[0xcec]; int player; };
struct Selection { char pad[0xb2]; u16 id; };
struct Record;
extern struct Context data_ov002_022ce288;
extern struct Player data_ov002_022d016c;
extern struct Selection data_ov002_022d0e6c;
extern int func_ov002_021b9b64(int unused0);
extern int func_ov002_021bc618(int arg0);
/* This caller supplies only r0; the thunk's other parameters are passthrough registers. */
extern int func_ov002_021ca2b8();
extern int func_ov002_021e286c(int arg0);
extern void func_ov002_021e2b3c(int unused0);
/* The unused input is the preceding call's result in the original. */
extern void func_ov002_021e2c5c();
extern int func_ov002_0225368c(int ctx, int card_id, int arg2);
extern void func_ov002_0226b054(int arg0);
extern int func_ov002_0226b194(int arg0, int arg1, int arg2);
extern void func_ov002_0227ac64(int a, struct Record *b, int c, int d, unsigned int e);
int func_ov002_0222f7b4(struct Self *self) {
 int side = data_ov002_022d016c.player ^ data_ov002_022ce288.index;
 switch (data_ov002_022ce288.state) {
 case 0x80:
  data_ov002_022ce288.index = 0;
  self->slots[0] = 0;
  self->slots[1] = 0;
  return 0x7f;
 case 0x7f:
  if (func_ov002_021ca2b8(side) == 0) return 0x78;
  if (func_ov002_021bc618(side) == 0) return 0x78;
  if (func_ov002_0225368c(side, self->id, 0) == 0) return 0x79;
  func_ov002_0226b194(side, self->id, 0);
  return 0x7e;
 case 0x7e:
  self->slots[side] = data_ov002_022d0e6c.id;
  return 0x78;
 case 0x79:
  func_ov002_0226b054(1-side);
  return 0x78;
 case 0x78:
  if (++data_ov002_022ce288.index < 2) return 0x7f;
  data_ov002_022ce288.index = 0;
  func_ov002_021e2b3c(0);
  return 0x77;
 case 0x77:
  if (self->slots[side] != 0) {
   int record = func_ov002_021b9b64(self->slots[side]);
   func_ov002_0227ac64(side, (struct Record *)record, 1, 0, (unsigned int)self->id << 16);
  }
  if (++data_ov002_022ce288.index < 2) return 0x77;
  return 0x6e;
 case 0x6e:
  func_ov002_021e286c(data_ov002_022d016c.player);
  func_ov002_021e286c(1-data_ov002_022d016c.player);
  func_ov002_021e2c5c();
  return 0;
 }
 return 0;
}
