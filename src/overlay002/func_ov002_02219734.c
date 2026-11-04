typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
struct node {
 u16 id; u16 info;
 u16 pad:2; u16 flag:1; u16 rest4:13;
 u16 count0:8; u16 count:8;
 u16 arr8[5]; u16 f18;
};
struct Record { u32 card:13; u32 bit:1; u32 pad:8; u32 value:8; u32 pad2:2; };
struct Player { char pad[0x418]; struct Record cards[0x114]; };
struct State { char pad[0x5a8]; int state; int index; int mask; };
extern struct State data_ov002_022ce288;
extern struct Player data_ov002_022cf16c[];
extern u16 func_ov002_0223de94(struct node *arg0, int arg1);
struct Node0223def4;
extern int func_ov002_0223def4(struct Node0223def4 *self, int idx);
extern int func_0203058c(int a);
extern int func_ov002_021b3e28(int arg0, int arg1, int arg2);
extern int func_ov002_021b99b4(int player, int id);
extern int func_ov002_021bc618(int arg0);
extern int func_ov002_021c33e4(int a, int b, int c);
extern int func_ov002_021c9df0(int arg);
/* This caller supplies only r0; the thunk's other arguments are unused. */
extern int func_ov002_021ca2b8();
/* The first argument is a player number, as passed by the original caller. */
extern void func_ov002_021e276c(int self, int a, int b, int c);
extern void func_ov002_021e2b3c(int unused0);
extern void func_ov002_021e2c5c(int unused0);
extern void func_ov002_0227ac64(int a, struct Record *b, int c, int d, u32 e);
extern int func_ov002_0227adb8(int side, void *p, int c, int d);
int func_ov002_02219734(struct node *self) {
 int player = (u8)func_ov002_0223de94(self, data_ov002_022ce288.index);
 int idx;
 struct Record *card;
 if (self->flag) return 0;
 switch (data_ov002_022ce288.state) {
 case 0x80:
  data_ov002_022ce288.index = 0;
  idx = func_ov002_021ca2b8(0);
  data_ov002_022ce288.mask = idx | (func_ov002_021ca2b8(1) << 1);
  func_ov002_021e2b3c(data_ov002_022ce288.mask);
  return 0x7f;
 case 0x7f:
  if (data_ov002_022ce288.index < self->count && func_ov002_021bc618(player) != 0 && ((data_ov002_022ce288.mask >> player) & 1)) {
   idx = func_ov002_021b99b4(player, func_ov002_0223def4((struct Node0223def4 *)self, data_ov002_022ce288.index));
   if (idx >= 0 && func_ov002_021c33e4(player, player, idx) != 0) {
    card = &data_ov002_022cf16c[player & 1].cards[idx];
    switch (self->id) {
    case 0x133b:
     if (card->card == self->id) {
      if (func_ov002_021b3e28(player, 11, self->id) >= 10) break;
      func_ov002_021e276c(player, self->id, 1, 0);
     }
     func_ov002_0227adb8(player, card, func_0203058c(card->card) != 0, self->id << 16);
     break;
    case 0x1365:
     if (func_ov002_021c9df0(player) != 0)
      func_ov002_0227ac64(player, card, 0, 1, self->id << 16);
     break;
    case 0x1990:
     func_ov002_0227ac64(player, card, 1, 1, self->id << 16);
     break;
    }
   }
  }
  return 0x7e;
 case 0x7e:
  data_ov002_022ce288.index++;
  return data_ov002_022ce288.index >= 2 ? 100 : 0x7f;
 case 100:
  func_ov002_021e2c5c(data_ov002_022ce288.state);
  return 0;
 }
 return 0;
}
