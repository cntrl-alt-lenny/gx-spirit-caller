typedef unsigned short u16;
typedef unsigned int u32;
struct Input { u16 id; u16 player:1, rest:15; u16 pad[2]; u16 count; };
struct Record { u32 card:13, bit:1, pad:8, value:8, pad2:2; };
struct Global { char pad[0x5a8]; int state; int count; };
extern struct Global data_ov002_022ce288;
extern int func_ov002_021bbf50(int arg0);
extern int func_ov002_021bc618(int arg0);
/* Original caller sets only r0; the thunk forwards incidental registers. */
extern int func_ov002_021ca2b8();
extern int func_ov002_021ca3f0(int arg0, int arg1);
extern void func_ov002_021e2b3c(int unused0);
extern void func_ov002_021e2c5c(int unused0);
extern void func_ov002_0227ac64(int a, struct Record *b, int c, int d, u32 e);
int func_ov002_0221c9a4(struct Input *self) {
 int card = 0;
 int count = 0;
 int mode = 2;

 switch (self->id) {
 case 0x13fc: card = 0x1422; count = 2; break;
 case 0x180e: card = 0x1815; count = func_ov002_021bbf50(1-self->player); mode = 1; break;
 case 0x1810: card = 0x1813; count = self->count; mode = 1; break;
 case 0x19af: card = 0x19ba; count = 3; mode = 0; break;
 case 0x19fe: card = 0x19ee; count = 2; mode = 1; break;
 case 0x1a62: card = 0x189c; count = 2; break;
 }
 switch (data_ov002_022ce288.state) {
 case 0x80:
  if (func_ov002_021ca2b8(self->player) == 0) return 0;
  if (func_ov002_021ca3f0(self->player, card) == 0) return 0;
  if (func_ov002_021bc618(self->player) < count) return 0;
  data_ov002_022ce288.count = 0;
  func_ov002_021e2b3c((int)&data_ov002_022ce288);
  return 0x7f;
 case 0x7f:
  if (data_ov002_022ce288.count < count) {
   struct Record rec = {0};
   rec.card = card;
   rec.bit = self->player;
   func_ov002_0227ac64(self->player, &rec, 1, mode, 1);
   data_ov002_022ce288.count++;
   return 0x7f;
  }
  func_ov002_021e2c5c(data_ov002_022ce288.count);
  return 0;
 default: return 0;
 }
}

