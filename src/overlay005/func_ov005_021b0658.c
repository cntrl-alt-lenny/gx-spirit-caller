typedef unsigned char u8;
typedef unsigned short u16;
typedef struct { unsigned unk; unsigned mode:3; unsigned rest:29; } Global;
typedef struct {
 int unk0, state; unsigned kind; int unkC, row, col, done, phase, count, page;
 u16 pos; u8 pad0[0x1e]; char text[0x20]; char widths[0x20];
 u8 pad1[0x344]; int layout; u16 saved;
} State;
extern Global data_02104f4c;
extern u8 data_ov005_021b1c8c[];
extern const void *func_ov005_021af874(unsigned char *p, unsigned int index);
extern int func_ov005_021afac8(int *p);
extern int func_02037208(int a0, int r1, int r2, int r3);
extern int func_020aaddc(const char *s);
extern int func_020054a4(const char *, int);
extern int func_ov005_021af750(State *, int);
extern int func_ov005_021af8ec(State *, unsigned);
extern int func_ov005_021aef74(State *);
#define BE(p) ((((const u8 *)(p))[0] << 8) + ((const u8 *)(p))[1])
static inline int small(unsigned kind) {
 int result = 0; if (kind <= 4) { if ((1 << kind) & 0x19) result = 1; } return result;
}
int func_ov005_021b0658(State *s, int index)
{
 int value;
 const char *p;
 int limit;
 int narrow;
 char old;
 unsigned character;
 if (data_02104f4c.mode == 0) {
  p = func_ov005_021af874((u8 *)s, s->layout);
  if (p[index * 2] != 0) value = (u16)BE(p + index * 2);
  else if (s->layout == 3) value = 0;
  else value = (u16)BE(data_ov005_021b1c8c);
  if (s->layout == 0 && value != BE(data_ov005_021b1c8c) && index < 50) {
   func_ov005_021af750(s, s->row * 5 + (s->page + s->col));
   func_ov005_021af8ec(s, 3);
   s->saved = s->row * 5 + (s->page + s->col);
   s->page = 0; s->row = 0; s->col = 0;
   s->layout = 3;
   func_ov005_021afac8((int *)s);
   func_02037208(0x56, -1, 0, 1);
  } else {
   if (value != 0) {
    s->text[s->pos * 2] = value >> 8;
    s->text[s->pos * 2 + 1] = value;
    func_ov005_021aef74(s);
    func_02037208(0x3a, -1, 0, 1);
    narrow = 0; if (s->kind <= 4) { if ((1 << s->kind) & 0x19) narrow = 1; }
    if (s->pos < (narrow != 0 ? 10 : 12) - 1) s->pos++;
    else { s->done = 1; s->phase = 3; }
   }
   if (s->layout == 3) {
    func_ov005_021af8ec(s, 0);
    s->layout = 0; s->page = 0;
    s->row = s->saved / 5;
    s->col = s->saved % 5;
    s->saved = 0;
    func_ov005_021afac8((int *)s);
    if (value == 0) func_02037208(0x56, -1, 0, 1);
   }
  }
 } else {
  p = func_ov005_021af874((u8 *)s, s->layout);
  if (func_020aaddc(p) > index) index = p[index];
  else index = 0x20;
  old = s->text[s->pos];
  s->text[s->pos] = index;
  narrow = 0; if (s->kind <= 4) { if ((1 << s->kind) & 0x19) narrow = 1; }
  limit = narrow != 0 ? 10 : 12;
  if (func_020054a4(s->text, 12) > limit * 12) {
   s->text[s->pos] = old;
   func_02037208(0x43, -1, 0, 1);
   return 0;
  }
  if (index != 0x20) {
   character = (u8)index;
   s->widths[s->pos] = func_020054a4((char *)&character, 12);
  } else s->widths[s->pos] = 6;
  func_ov005_021aef74(s);
  func_02037208(0x3a, -1, 0, 1);
  narrow = 0; if (s->kind <= 4) { if ((1 << s->kind) & 0x19) narrow = 1; }
  if (s->pos < (narrow != 0 ? 10 : 12) * 2 - 1) s->pos++;
  else { s->done = 1; s->phase = 3; }
 }
 return 1;
}

