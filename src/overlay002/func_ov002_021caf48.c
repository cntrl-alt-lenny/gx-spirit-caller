typedef unsigned short u16;
struct State { u16 flags, slot, active, cleanup; char pad[2052]; int pending; };
struct Entry { unsigned flags; char pad[16]; };
struct Player { struct Entry cards[12]; char pad[1912]; };
extern struct State data_ov002_022ce950;
extern struct Player data_ov002_022cf1ac[];
extern int func_ov002_021b9ecc(int self, int arg1);
extern void func_ov002_021c1010(int self, int arg1);
extern int func_ov002_021b3ecc(int arg0, int arg1, int arg2);
extern void func_ov002_021b1f20(int a0, int a1, int a2, int a3, int a4);
extern void func_ov002_021b2ab4(void);
void func_ov002_021caf48(void) {
 int player, slot, active, cleanup, card;
 player = (data_ov002_022ce950.flags & 0x8000) != 0;
 slot = data_ov002_022ce950.slot;
 active = data_ov002_022ce950.active;
 cleanup = data_ov002_022ce950.cleanup;
 card = func_ov002_021b9ecc(player, slot);
 if (active != 0) {
  func_ov002_021c1010(player, slot);
  switch (card) {
  case 0xfa6: case 0xfa7:
   if (func_ov002_021b3ecc(player, 11, card) == 0)
    func_ov002_021b1f20(player, 11, 1, 0xfa7, 0);
   break;
  case 0xff8:
   if (func_ov002_021b3ecc(player, 11, card) == 0)
    func_ov002_021b1f20(player, 11, 1, card, 0);
   break;
  }
  if (cleanup != 0) func_ov002_021b2ab4();
 } else {
  data_ov002_022cf1ac[player & 1].cards[slot].flags &= ~0x400000;
 }
 data_ov002_022ce950.pending = 0;
}
