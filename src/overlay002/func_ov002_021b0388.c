struct Player { int value; char pad[2148]; };
struct State { char pad[224]; int flag; char pad2[3080]; int side; unsigned int turn; unsigned int start; };
extern struct Player data_ov002_022cf18c[];
extern struct Player data_ov002_022cf194[];
extern struct Player data_ov002_022cf16c[];
extern struct State data_ov002_022d016c;
extern int func_ov002_021b025c(void *self);
extern int func_ov002_021b02f0(int arg0);
extern int func_ov002_021b4054(int arg0, int arg1, int arg2, int arg3);
extern int func_ov002_021bbf50(int arg0);
int func_ov002_021b0388(void *self) {
 int player = (int)self;
 int other = (1-player)&1;
 int own;
 if (data_ov002_022cf18c[other].value != 0) return 2;
 own = player&1;
 if (data_ov002_022cf18c[own].value != 0) return 0;
 if (func_ov002_021b025c(self) != 0) return 3;
 if (func_ov002_021b02f0(player) != 0) return 4;
 if (func_ov002_021b4054(data_ov002_022d016c.side,11,0x151e,5) != 0) {
  data_ov002_022d016c.flag = 1;
  if (func_ov002_021bbf50(player) > 0) return 6;
  return 0;
 }
 if (func_ov002_021b4054(player,11,0x169c,1) != 0) return 7;
 if (data_ov002_022cf194[own].value != 0) return 8;
 if (data_ov002_022cf16c[other].value == 0) return 1;
 if (data_ov002_022d016c.turn >= data_ov002_022d016c.start+4) {
  if (data_ov002_022cf16c[own].value > data_ov002_022cf16c[other].value) return 9;
 }
 return 0;
}
