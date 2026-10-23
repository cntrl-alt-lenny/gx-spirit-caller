typedef struct { int a, b; } Entry;
typedef unsigned short u16;
typedef unsigned int u32;
typedef struct { int index; u16 first, last, previous; } State;
typedef struct {
 char pad0[0x2c]; void *sprite;
 char pad1[0x24]; short left, top, right, bottom;
 int value, min, max, mode;
 short step, pad2;
 int timer;
 unsigned disabled:1; unsigned rest:31;
} Obj;
extern u16 func_0207ec28(State *s);
extern unsigned int func_02006194(void);
extern void func_02006110(int *out_a, int *out_b);
extern int func_020b3870(int, int);
extern void func_ov015_021b3520(void *p, int v);
extern int func_02037208(int a0, int a1, int a2, int a3);
extern int func_0207fd28(void *p, int unused1);
extern int func_0207f934(void *, unsigned short, void *, void *, int *, unsigned short, int);
int func_ov015_021b3280(Obj *o, int dt, State *s, Entry **out) {
 int count = func_0207ec28(s);
 int offset;
 int old = o->value;
 int pos[2];
 int x, y;
 void *sprite;
 int drawn;
 Entry *cursor;
 int remaining, elapsed;
 offset = 0;
 if (o->timer > 0) {
  o->timer -= dt;
  if (o->timer < 0) o->timer = 0;
  remaining = *(int *)&o->timer;
  elapsed = 0x5000 - remaining;
  switch (o->mode) {
  case 2:
   offset = (-o->step * elapsed) / 5;
   if (remaining == 0) { o->value--; o->mode = 1; offset = 0; }
   break;
  case 3:
   offset = (o->step * elapsed) / 5;
   if (remaining == 0) { o->value++; o->mode = 1; offset = 0; }
   break;
  }
 } else {
  if (!o->disabled) {
   if (func_02006194()) {
    func_02006110(&x, &y);
    if (x >= o->left && x <= o->right && y >= o->top && y <= o->bottom)
     func_ov015_021b3520(o, func_020b3870(y - o->top, o->step));
    o->mode = 4;
   } else o->mode = 1;
  } else o->mode = 1;
 }
 if (o->value < o->min) o->value = o->min;
 else if (o->value > o->max) o->value = o->max;
 if (old != o->value) func_02037208(0x38, -1, 0, 1);
 func_0207fd28(o, dt);
 sprite = o->sprite;
 pos[0] = o->left << 12;
 pos[1] = ((o->top + o->step * o->value) << 12) + offset;
 drawn = func_0207f934(*out, (u16)count, sprite, 0, pos, 0, 0);
 cursor = *out;
 cursor += drawn;
 *out = cursor;
 return drawn;
}









