extern int func_0202e234(int x);
extern int func_ov002_021ae4a0(int x, int y);
extern void func_ov002_021af9d0(int player, int phase, int card, int arg);
extern int func_ov002_021b04c8(void);
extern void func_ov002_02245100(int arg);
extern int func_ov002_02245dd4(int player, int mode);
extern void func_ov002_022461d8(void *buf);
extern void func_ov002_02258168(int arg);
extern void func_ov002_022582b4(int arg);
extern void func_ov002_022583b4(int a, int b, int c);
extern void func_ov002_02258500(int a, int b, int c);
extern void func_ov002_022592b8(int arg);
extern int func_ov002_0228c1d0(void *player, void *arg1);
extern void func_ov002_0229cd88(void *self, unsigned int arg1);
extern void func_ov002_0229cdb8(void *self, unsigned int arg1);
struct State {
 char pad0[0x5d4]; int active; char pad1[4]; unsigned char kind;
 char pad2[0xa3]; int step; union { int index; void *ptr; } player; int running; int result;
};
struct Global { char pad0[0xcec]; int player; char pad1[0x54]; int ready; char pad2[8]; int status; char pad3[8]; int card; int value; int choice; char pad4[8]; int side; int index; };
struct Flags { char pad[0x300]; unsigned int unused:5; unsigned int done:1; unsigned int rest:26; };
extern struct State data_ov002_022ce288;
extern struct Global data_ov002_022d016c;
extern struct Flags data_ov002_022cd968;
extern int data_ov002_022cd744[];
extern char data_ov002_022cacbc[];
int func_ov002_022465d4(void) {
 char buf[0x100];
 int step = data_ov002_022ce288.step;
 void *player;
 int mode;
 int kind;
 player = data_ov002_022ce288.player.ptr;
 switch (step) {
 case 0:
  if (func_ov002_021b04c8() != 0) { data_ov002_022ce288.running = 0; return 1; }
  data_ov002_022ce288.result = 0;
  data_ov002_022ce288.step++;
 case 1:
 case 5:
  kind = data_ov002_022ce288.kind;
  if (((unsigned int)kind == 0x1f || kind == 0x20 || (unsigned int)kind == 0x21) && func_ov002_02245dd4((int)player, 0) == 0) {
   data_ov002_022ce288.step = 50; return 1;
  }
  if (data_ov002_022cd744[(int)player] == 1) {
   if (func_ov002_02245dd4((int)player, 1) != 0 && func_ov002_0228c1d0(player, 0) != 0) data_ov002_022ce288.step = 11;
   else data_ov002_022ce288.step = 50;
  } else if (data_ov002_022cd744[(int)player] == 2) {
   data_ov002_022ce288.step = 20;
  } else {
   if (func_ov002_02245dd4((int)player, 0) == 0) {
    func_ov002_0229cd88(buf, 0xcc);
    func_ov002_0229cdb8(buf, (unsigned int)data_ov002_022cacbc);
    func_ov002_0229cdb8(buf, 0xce);
    mode = 0;
   } else {
    func_ov002_022461d8(buf);
    mode = func_ov002_02245dd4((int)player, 1) + 1;
   }
   if (data_ov002_022ce288.step == 5) mode = 3;
   func_ov002_021ae4a0((int)buf, mode);
   data_ov002_022ce288.step = 2;
  }
  return 1;
 case 2:
  if (data_ov002_022d016c.ready == 0) { data_ov002_022ce288.step = 50; return 1; }
  data_ov002_022ce288.step = 10;
  data_ov002_022d016c.status = 0;
  return 1;
 case 10:
  func_ov002_022592b8(4);
  data_ov002_022ce288.step++;
  return 1;
 case 11:
  if (data_ov002_022d016c.status == 0) { data_ov002_022ce288.step = 5; return 1; }
  switch (data_ov002_022d016c.choice) {
  case 3:
   data_ov002_022ce288.step = 30;
   return 1;
  case 1:
   func_ov002_021af9d0(data_ov002_022d016c.side, data_ov002_022d016c.index - 11, -1, data_ov002_022d016c.index);
   data_ov002_022ce288.step--;
   return 1;
  default:
   data_ov002_022ce288.step = step - 1;
   return 1;
  }
 case 20:
  func_ov002_02245100(1);
  data_ov002_022ce288.result = 0;
  data_ov002_022cd968.done = 0;
  data_ov002_022ce288.step++;
  return 1;
 case 21:
  if (!data_ov002_022cd968.done) return 1;
  if (data_ov002_022ce288.result == 0) { data_ov002_022ce288.step = 50; return 1; }
  data_ov002_022ce288.step = 30;
  return 1;
 case 30:
  switch (data_ov002_022d016c.index) {
  case 11:
   if (func_0202e234(data_ov002_022d016c.card) != 0) func_ov002_022582b4(0);
   else func_ov002_022583b4(1, 0, 0);
   break;
  case 12: case 13: case 14: case 15:
   func_ov002_02258500(0, data_ov002_022d016c.side, data_ov002_022d016c.index);
   break;
  default:
   func_ov002_02258168(0);
   break;
  }
  if (data_ov002_022d016c.status != 0) return 1;
  data_ov002_022ce288.result = 1;
  data_ov002_022ce288.running = 0;
  return 1;
 case 50:
  data_ov002_022ce288.player.index = 1 - (int)player;
  if (data_ov002_022ce288.player.index != data_ov002_022d016c.player) { data_ov002_022ce288.step = 0; return 1; }
  data_ov002_022ce288.active = 0;
  data_ov002_022ce288.running = 0;
  return 1;
 }
 return 1;
}






