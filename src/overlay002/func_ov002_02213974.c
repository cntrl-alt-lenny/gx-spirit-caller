typedef unsigned short u16;
struct Ov002Self { u16 f0, f2; u16 pad:2; u16 disabled:1; u16 rest:13; };
struct node;
struct Node;
struct State { char pad[0x5a8]; int action; };
struct Row { unsigned id:13; unsigned rest:19; char pad[16]; };
struct Table { char pad[0x30]; struct Row rows[1]; };
extern struct State data_ov002_022ce288;
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a2[];
extern char data_ov002_022cf1a4[];
extern u16 func_ov002_0223de94(struct node *, int);
extern int func_ov002_0223df38(struct Node *, int, int *);
extern int func_ov002_021d63fc(struct Ov002Self *, int, int, int);
extern void func_ov002_021e2d94(int, int, int, int);
extern int func_ov002_021df708(int, int);
extern int func_ov002_021e2b1c(int);
extern void func_ov002_02253ea4(int, int);
extern int func_ov002_021c84a8(int, int);
extern int func_ov002_021de4d8(struct Ov002Self *, int, int);
/* The original passes no argument; the definition only has an unused parameter. */
extern void func_ov002_021e2b3c();
/* The original passes no argument; the definition only has an unused parameter. */
extern void func_ov002_021e2c5c();
int func_ov002_02213974(struct Ov002Self *self) {
 int packed, player, row, sideoff, rowoff, id;
 if (self->disabled) return 0;
 packed = func_ov002_0223de94((struct node *)self, 0);
 player = packed & 0xff;
 row = (int)(u16)packed >> 8;
 row = row & 0xff;
 sideoff = (player & 1) * 0x868;
 rowoff = (short)row * 20;
 id = ((struct Table *)(data_ov002_022cf16c + sideoff))->rows[(short)row].id;
 switch (data_ov002_022ce288.action) {
 case 0x80:
  if (func_ov002_0223df38((struct Node *)self, 0, 0) &&
      *(u16 *)(data_ov002_022cf1a2 + sideoff + rowoff) != 0 &&
      *(u16 *)(data_ov002_022cf1a4 + sideoff + rowoff) == 0) {
   func_ov002_021e2b3c();
   func_ov002_021d63fc(self, player, row, 1);
   func_ov002_021e2d94(player, row, 2, 1);
   return 0x7f;
  }
  return 0;
 case 0x7f:
  func_ov002_021df708(player, id);
  func_ov002_021e2b1c(30);
  func_ov002_02253ea4(-1, 0);
  return 0x7e;
 case 0x7e:
  if (func_ov002_021c84a8(player, row) > 2000) {
   func_ov002_021d63fc(self, player, row, 0);
   func_ov002_021e2d94(player, row, 2, 0);
  } else {
   func_ov002_021de4d8(self, player, row);
  }
  func_ov002_021e2c5c();
  return 1;
 }
 return 0;
}


