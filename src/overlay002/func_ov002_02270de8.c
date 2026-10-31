struct State { unsigned player:1; unsigned rest:31; int pad4; unsigned char count; char pad9[7]; unsigned short list[1]; };
struct Entry { unsigned short field; char pad[18]; };
struct Player { struct Entry cards[5]; char tail[2052]; };
extern struct State data_ov002_022cd300;
extern struct Player data_ov002_022cf1a4[];
extern int func_ov002_021b9ecc(int player, int idx);
extern int func_ov002_021bc288(int a, int b);
extern int func_ov002_021bc618(int arg0);
extern int func_ov002_021bc8c8(int self, int player, int slot);
int func_ov002_02270de8(int player, int a, int b) {
 int sum = a + b;
 int i, j;
 if (sum > 4) return 0;
 if (func_ov002_021bc8c8(data_ov002_022cd300.player, player, sum) == 0) return 0;
 if (func_ov002_021b9ecc(player, sum) != data_ov002_022cd300.count + 0x1119) return 0;
 if (player != data_ov002_022cd300.player) {
  if (data_ov002_022cf1a4[player & 1].cards[sum].field == 0) return 0;
 }
 if (func_ov002_021bc618(data_ov002_022cd300.player) == 0) {
  if (player == data_ov002_022cd300.player) {
   if (func_ov002_021bc288(player, sum) != 0) return 0x800;
  }
  for (i=0; i<data_ov002_022cd300.count; i++) {
   int pair = data_ov002_022cd300.list[i];
   if ((pair & 0xff) == data_ov002_022cd300.player) {
    if (func_ov002_021bc288(pair & 0xff, (pair >> 8) & 0xff) != 0) return 0x800;
   }
  }
  for (i=data_ov002_022cd300.count+1; i<3; i++) {
   for (j=0; j<=4; j++) {
    if (func_ov002_021b9ecc(data_ov002_022cd300.player,j) == i+0x1119) {
     if (func_ov002_021bc8c8(data_ov002_022cd300.player,data_ov002_022cd300.player,j) != 0) {
      if (func_ov002_021bc288(data_ov002_022cd300.player,j) != 0) return 0x800;
     }
    }
   }
  }
  return 0;
 }
 return 0x800;
}
