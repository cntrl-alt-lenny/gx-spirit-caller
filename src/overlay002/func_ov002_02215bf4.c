typedef unsigned short u16;
typedef unsigned char u8;
typedef struct { u16 f0; u16 flag0:1; u16 field:5; u16 :10; } Card021c1e44;
typedef struct Card {
 u16 id; u16 side:1; u16 unused2:13; u16 flipped:1; u16 unused3:1;
 u16 unused4:5; u16 active:1; u16 unused5:10; u16 pad[9];
 u16 effect; u16 owner:1; u16 unused6:15;
} Card;
struct Entry { unsigned id:13; unsigned rest:19; char pad[16]; };
struct Player { char pad[48]; struct Entry cards[5]; char tail[2004]; };
extern char data_ov002_022ce288[];
extern char data_ov002_022d016c[];
extern char data_ov002_022d0e6c[];
extern struct Player data_ov002_022cf16c[];
extern int func_0202b8f0(int unused0);
extern int func_ov002_021c1e44(Card021c1e44 *a0, int a1, int a2);
extern int func_ov002_021debe0(int a, int b, int c);
extern int func_ov002_021df818(Card *card, int side, int amount);
extern int func_ov002_022577dc(void *self);
extern void func_ov002_0226b034(int arg0, int arg1, int arg2);
int func_ov002_02215bf4(Card *self) {
 int player, slot, amount;
 int pair;
 switch (*(int *)(data_ov002_022ce288 + 0x5a8)) {
 case 0x80:
  if (func_ov002_022577dc(self) == 0) return 0;
  func_ov002_0226b034(*(int *)(data_ov002_022d016c + 0xcec), self->id, self->side);
  return 0x7f;
 case 0x7f:
  pair = *(u16 *)(data_ov002_022d0e6c + 0xb0);
  player = (u8)pair;
  slot = (u8)(pair >> 8);
  amount = func_0202b8f0(data_ov002_022cf16c[player & 1].cards[slot].id);
  if (func_ov002_021c1e44((Card021c1e44 *)self, player, slot) != 0) return 0;
  func_ov002_021debe0((int)self, player, slot);
  func_ov002_021df818(self, 1 - *(int *)(data_ov002_022d016c + 0xcec), (amount + 1) >> 1);
  return 0;
 }
 return 0;
}
