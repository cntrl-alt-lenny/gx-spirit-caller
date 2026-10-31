typedef unsigned short u16;
typedef unsigned char u8;
struct node { char pad[8]; u16 arr8[5]; u16 f18; };
struct Node;
struct Card { unsigned id:13; unsigned rest:19; char pad[16]; };
struct Player { char pad[48]; struct Card cards[5]; char tail[2004]; };
struct State { char pad[0x5a8]; int mode; };
extern struct State data_ov002_022ce288;
extern struct Player data_ov002_022cf16c[];
struct HalfRow { u16 value; char pad[18]; };
struct HalfPlayer { struct HalfRow rows[107]; char tail[12]; };
extern struct HalfPlayer data_ov002_022cf1a4[];
extern struct HalfPlayer data_ov002_022cf1a2[];
extern u16 func_ov002_0223de94(struct node *, int);
extern int func_ov002_0223df38(struct Node *, int, int *);
extern void func_ov002_021d6714(int, int, int);
extern int func_ov002_021df708(int, int);
extern int func_ov002_021e2b1c(int);
extern int func_0202e270(int);
extern int func_ov002_0220e518(void *);
int func_ov002_0221d934(struct node *self) {
 int pair = func_ov002_0223de94(self, 0);
 int player = (u8)pair;
 int slot = (u8)((u16)pair >> 8);
 int id = data_ov002_022cf16c[player & 1].cards[slot].id;
 switch (data_ov002_022ce288.mode) {
 case 0x80:
  if (func_ov002_0223df38((struct Node *)self, 0, 0) != 0 &&
      data_ov002_022cf1a4[player & 1].rows[slot].value == 0 &&
      data_ov002_022cf1a2[player & 1].rows[slot].value != 0) {
   func_ov002_021d6714(player, slot, 1);
   return 0x7f;
  }
  return 0;
 case 0x7f:
  func_ov002_021df708(player, id);
  func_ov002_021e2b1c(0x1e);
  return 0x7e;
 case 0x7e:
  if (func_0202e270(id) != 0) {
   if (func_ov002_0220e518(self) != 0) return 0;
  }
  func_ov002_021d6714(player, slot, 0);
  return 0;
 }
 return 0;
}
