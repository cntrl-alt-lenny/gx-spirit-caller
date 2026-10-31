struct Card { unsigned id:13; unsigned side:1; unsigned pad:8; unsigned value:8; unsigned rest:2; };
struct Player { char pad[0x120]; struct Card cards[1]; char tail[0x744]; };
struct State { char pad[0x494]; int index; unsigned short entries[128]; };
extern struct Player data_ov002_022cf16c[];
extern struct State data_ov002_022ce288;
extern unsigned short data_ov002_022ce720[];
extern int func_0202e234(int x);
extern int func_ov002_021ca440(int arg0, int arg1);
extern void func_ov002_02253458(int player, int kind, int idx);
void func_ov002_0224ad64(int player, int unused, int idx) {
 int offset = (player & 1) * 0x868;
 struct Card *cards = (struct Card *)(offset + (unsigned)data_ov002_022cf16c + 0x120);
 int id = cards[idx].id;
 int i, count, start; unsigned value;
 if (func_0202e234(id) == 0) return;
 if (func_ov002_021ca440(player, id) == 0) return;
 start = data_ov002_022ce288.index;
 count = data_ov002_022ce720[start & 127];
 i = 0;
 if (count > 0) {
  value = cards[idx].value * 2 + cards[idx].side;
  do {
   i++;
   { unsigned short entry = data_ov002_022ce288.entries[(start + i) & 127];
   if (entry == value) return; }
  } while (i < count);
 }
 func_ov002_02253458(player, 11, idx);
}




