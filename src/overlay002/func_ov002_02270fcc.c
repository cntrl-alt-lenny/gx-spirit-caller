struct State { unsigned int player:1; unsigned int rest:31; int pad4; unsigned char count; char pad9; unsigned short list[1]; };
struct Card { unsigned int id:13; unsigned int rest:19; };
extern struct State data_ov002_022cd300;
extern int data_ov002_022c85f8[];
extern char data_ov002_022cf1a4[];
extern char data_ov002_022cf16c[];
extern int func_ov002_021b9830(int target);
extern int func_ov002_021b9ecc(int player, int idx);
extern int func_ov002_021bc288(int a, int b);
extern int func_ov002_021bc618(int arg0);
extern int func_ov002_021bc8c8(int self, int player, int slot);
int func_ov002_02270fcc(int player, int a, int b) {
 int id = data_ov002_022c85f8[data_ov002_022cd300.count];
 int flag = 0;
 int i, j;
 int sum;
 if (func_ov002_021bc618(data_ov002_022cd300.player) == 0) {
  flag = 1;
  for (i = 0; i < data_ov002_022cd300.count; i++) {
   int pair = func_ov002_021b9830(data_ov002_022cd300.list[i]);
   if (pair >= 0 && (unsigned char)pair == data_ov002_022cd300.player) {
    if (func_ov002_021bc288((unsigned char)pair, (unsigned char)((unsigned short)pair >> 8)) != 0) flag = 0;
   }
  }
  for (i = data_ov002_022cd300.count + 1; i < 3; i++) {
   int next = data_ov002_022c85f8[i];
   for (j = 0; j <= 4; j++) {
    if (next == func_ov002_021b9ecc(data_ov002_022cd300.player, j) && func_ov002_021bc8c8(data_ov002_022cd300.player, data_ov002_022cd300.player, j) != 0) {
     if (func_ov002_021bc288(data_ov002_022cd300.player, j) != 0) { flag = 0; break; }
    }
   }
  }
 }
 sum = a + b;
 if (sum <= 4) {
  if (func_ov002_021bc8c8(data_ov002_022cd300.player, player, sum) == 0) return 0;
  if (player != data_ov002_022cd300.player) {
   if (*(unsigned short *)(data_ov002_022cf1a4 + (player & 1) * 0x868 + sum * 20) == 0) return 0;
  }
  if (id != func_ov002_021b9ecc(player, sum)) return 0;
  if (flag != 0) {
   if (player != data_ov002_022cd300.player || func_ov002_021bc288(player, sum) == 0) return 0;
  }
  return 0x800;
 }
 if (flag == 0 && player == data_ov002_022cd300.player && a == 11) {
  if (id != ((struct Card *)(data_ov002_022cf16c + (player & 1) * 0x868 + 0x120))[b].id) return 0;
  return 0x800;
 }
 return 0;
}

