struct State {
 unsigned int player:1;
 unsigned int pad0:7;
 unsigned int card:15;
 unsigned int pad1:9;
 unsigned int pad2[5];
 unsigned int low:8;
 unsigned int flag:8;
 unsigned int high:16;
};
extern struct State data_ov002_022cd300;
extern unsigned int func_0202b878(int id);
extern unsigned int func_0202b890(int id);
extern int func_ov002_021c8940();
extern int func_ov002_021c93cc(int a, int b, int bit);
int func_ov002_02271278(int player, int a, int b) {
 unsigned int card;
 int sum;
 int result;
 if (player != data_ov002_022cd300.player) return 0;
 sum = a + b;
 if (sum > 4) return 0;
 card = data_ov002_022cd300.card;
 switch (card) {
 case 0x1466: case 0x18b4: case 0x19ca:
  result = func_ov002_021c8940(player, sum);
  result = result == func_0202b878(card);
  break;
 case 0x16c9: case 0x16cb: case 0x16e4:
  result = func_ov002_021c93cc(player, sum, data_ov002_022cd300.flag ? 2 : 1);
  break;
 default:
  result = func_ov002_021c93cc(player, sum, func_0202b890(card));
  break;
 }
 return result ? 0x800 : 0;
}


