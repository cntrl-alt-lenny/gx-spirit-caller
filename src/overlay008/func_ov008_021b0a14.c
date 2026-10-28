typedef struct { unsigned short top, selected; char pad[0xa4]; unsigned short count, timer; int active, cursor, complete; } State;
typedef struct { char pad[0x634]; int flags; } Context;
typedef struct { char pad[0x38]; int value; } Global;
typedef struct { int f0, f4; short next, f0a; } Node;
extern State data_ov008_021b2de4;
extern Context data_ov008_021b2780;
extern Global data_021040ac;
extern Node *func_02005dac(int which, int slot_i);
extern void func_020944a4(int unused0, int unused1, int unused2);
extern void func_ov008_021ab484(int x, int y, int row, int col, int cell, int scale, int priority, int mode);
extern void func_ov008_021abcdc(void);
extern void func_ov008_021ac0b8(int a0, int a1, int a2);
extern void func_ov008_021afc2c(int index);
extern void func_ov008_021afec8(void);
/* The caller supplies no argument and consumes the thunk's return value. */
extern int func_ov008_021b23ac();
void func_ov008_021b0a14(void) {
 struct { unsigned int attr; unsigned short tile, pad; } sprite;
 int tile;
 func_ov008_021afc2c(data_ov008_021b2de4.selected);
 func_ov008_021afec8();
 if (data_ov008_021b2de4.count > 3)
  func_ov008_021ac0b8(data_ov008_021b2de4.top, data_ov008_021b2de4.count - 3, 1);
 else
  func_ov008_021ac0b8(data_ov008_021b2de4.top, data_ov008_021b2de4.count - 3, 0);
 if (data_ov008_021b2de4.complete) {
  func_ov008_021ab484(0xe3,0xa4,0,0,(data_ov008_021b2780.flags & 1) ? 8 : 7,2,0x400,0);
 } else if (!data_ov008_021b2de4.active) {
  func_ov008_021ab484(0x56,0xa4,0,0,(data_ov008_021b2780.flags & 0x200) ? 0x25 : 0x24,2,0x400,0);
 } else {
  tile = (data_021040ac.value >> 4) & 3;
  if (tile == 3) tile = 2;
  sprite.attr = 0x80e320a4;
  sprite.tile = (tile * 8 + 0x293) | 0x3000;
  func_020944a4((int)&sprite, (int)func_02005dac(2,0), 8);
 }
 if (func_ov008_021b23ac())
  func_ov008_021ab484(0xe3,0,0,0,(data_ov008_021b2780.flags & 0x400) ? 0x18 : 0x17,2,0x400,0);
 data_ov008_021b2780.flags &= ~0x400;
 func_ov008_021abcdc();
}
