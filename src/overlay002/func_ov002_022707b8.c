struct State { unsigned int player:1; unsigned int pad:7; unsigned int card:15; unsigned int rest:9; };
extern struct State data_ov002_022cd300;
extern char data_ov002_022cf1a4[];
extern int func_0202df78(int a, int b);
extern int func_0202f164(int x);
/* The original caller consumes r0 although the C callee is defined void. */
extern int func_ov002_021b3014(int arg0, int arg1, int arg2);
extern int func_ov002_021b9ecc(int player, int idx);
extern int func_ov002_021bc8c8(int self, int player, int slot);
extern int func_ov002_021bd6c8(int arg0);
/* Original calls supply only r0-r1 to these four-parameter thunks. */
extern int func_ov002_021c84e0();
extern int func_ov002_021c8940();
int func_ov002_022707b8(int player, int a, int b) {
 int sum = a + b;
 int id;
 if (sum > 4) return 0;
 if (func_ov002_021bc8c8(data_ov002_022cd300.player, player, sum) == 0) return 0;
 if (data_ov002_022cd300.player != player) {
  if (*(unsigned short *)(data_ov002_022cf1a4 + (player & 1) * 0x868 + sum * 20) == 0) return 0;
 }
 id = func_ov002_021b9ecc(player, sum);
 switch (data_ov002_022cd300.card) {
 case 0x112e:
  if (func_0202df78(id, 0x112d) && func_ov002_021b3014(player, sum, 0x1238)) return 0x800;
  break;
 case 0x128c:
  if (func_0202df78(id, 0xff8) && func_ov002_021b3014(player, sum, 0x1238)) return 0x800;
  break;
 case 0x1758:
  if (func_ov002_021bd6c8(0x175e) == 0) return 0;
  if (*(unsigned short *)(data_ov002_022cf1a4 + (player & 1) * 0x868 + sum * 20) && id == 0x173b) return 0x800;
  break;
 case 0x176c:
  if (func_ov002_021bd6c8(0x169f) == 0) return 0;
  if (*(unsigned short *)(data_ov002_022cf1a4 + (player & 1) * 0x868 + sum * 20) && id == 0x173b) return 0x800;
  break;
 case 0x17c2:
  if (func_0202df78(id, 0x1122)) return 0x800;
  break;
 case 0x17c6:
  if (func_ov002_021c84e0(player, sum) >= 6 && func_ov002_021c8940(player, sum) == 0x12) return 0x800;
  break;
 case 0x1894:
  if (func_0202df78(id, 0xff8)) return 0x800;
  break;
 case 0x18b9:
  if (func_0202df78(id, 0x18b8)) return 0x800;
  break;
 case 0x18e8:
  if (func_0202df78(id, 0x1707)) return 0x800;
  break;
 case 0x1982:
  if (func_0202df78(id, 0xfc9)) return 0x800;
  break;
 case 0x198c:
  if (func_0202df78(id, 0x17db)) return 0x800;
  break;
 case 0x19a5:
  if (func_ov002_021c8940(player, sum) == 3) return 0x800;
  break;
 case 0x19f7:
  if (func_0202df78(id, 0x19f6)) return 0x800;
  break;
 case 0x19f8:
  if (func_0202df78(id, 0x19f7)) return 0x800;
  break;
 case 0x19f0:
  if (func_0202f164(id)) return 0x800;
  break;
 }
 return 0;
}

