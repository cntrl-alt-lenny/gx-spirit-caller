struct Slot { unsigned int id:13; unsigned int rest:19; char pad[16]; };
struct State { unsigned int player:1; unsigned int pad:7; unsigned int card:15; unsigned int rest:9; };
extern struct State data_ov002_022cd300;
extern char data_ov002_022cf16c[];
extern int func_ov002_021bc618(int arg0);
extern int func_ov002_021bc288(int a, int b);
extern int func_ov002_021ba104(int a, int b, int c);
extern int func_ov002_021c23ac(int a, int b);
int func_ov002_02270ca8(int player, int a, int b) {
 int sum = a + b;
 if (player != data_ov002_022cd300.player) return 0;
 if (sum > 4) return 0;
 if (((struct Slot *)(data_ov002_022cf16c + (player & 1) * 0x868 + 0x30))[sum].id == 0) return 0;
 if (func_ov002_021bc618(data_ov002_022cd300.player) == 0) {
  if (player != data_ov002_022cd300.player || func_ov002_021bc288(player, sum) == 0) return 0;
 }
 switch (data_ov002_022cd300.card) {
 case 0x1895:
  if (func_ov002_021ba104(player, sum, 0x1522)) return 0x800;
  break;
 case 0x19a6:
  if (func_ov002_021c23ac(player, sum) == 0) return 0;
  if (func_ov002_021ba104(player, sum, 0x18f9)) return 0x800;
  break;
 }
 return 0;
}
