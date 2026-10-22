typedef unsigned char u8;
typedef unsigned short u16;
typedef struct { unsigned unk; unsigned mode:3; unsigned rest:29; } Global;
typedef struct {
 int unk0, state; unsigned kind; u8 pad0[0x1c]; u16 pos; u8 pad1[0x1e];
 signed char text[0x20]; signed char widths[0x20]; int done;
} State;
extern Global data_02104f4c;
extern u8 data_ov005_021b1c8c[];
extern u8 data_ov005_021b224c[];
extern int func_02037208(int a0, int r1, int r2, int r3);
extern int func_020054a4(const char *, int);
extern void *func_0202c0c0(int);
extern void func_ov005_021af090(State *);
extern int func_ov005_021af2dc(State *);
extern int func_ov005_021afba0(State *, const char *);
extern void func_ov005_021b0b30(void *, int, void *);
static inline int small(unsigned kind) {
 int result = 0; if (kind <= 4) result = ((1 << kind) & 0x19) != 0; return result;
}
#define BE(p) ((((const u8 *)(p))[0] << 8) + ((const u8 *)(p))[1])
int func_ov005_021b018c(State *s, unsigned action)
{
 int narrow;
 if (data_02104f4c.mode == 0) {
  switch(action) {
  case 0:
   if (BE(data_ov005_021b1c8c) == BE(&s->text[s->pos * 2]) && BE(&s->text[s->pos * 2 + 2]) == 0) {
    s->text[s->pos * 2] = 0;
    s->text[s->pos * 2 + 1] = 0;
   }
   if (s->pos != 0) s->pos--;
   func_02037208(0x3a, -1, 0, 1);
   break;
  case 1:
   if (s->text[s->pos * 2] == 0) {
    s->text[s->pos * 2] = (u16)BE(data_ov005_021b1c8c) >> 8;
    s->text[s->pos * 2 + 1] = BE(data_ov005_021b1c8c);
   }
   narrow = 0; if (s->kind <= 4) { if ((1 << s->kind) & 0x19) narrow = 1; }
   if (s->pos < (narrow != 0 ? 10 : 12) - 1) s->pos++;
   func_02037208(0x3a, -1, 0, 1);
   break;
  case 2: func_ov005_021af090(s); break;
  case 3:
   if (func_ov005_021af2dc(s)) {
    if (s->text[0] == 0) { func_02037208(0x43, -1, 0, 1); break; }
    if (func_ov005_021afba0(s, (char *)s->text)) {
     s->done = 1;
     func_02037208(0x3a, -1, 0, 1);
     if (s->kind != 4) return 1;
     func_ov005_021b0b30(data_ov005_021b224c, 2, func_0202c0c0(0x6a8));
     s->state = 1;
     return 0;
    } else {
     func_02037208(0x43, -1, 0, 1);
     func_ov005_021b0b30(data_ov005_021b224c, 0x11, func_0202c0c0(0xfa));
     s->state = 1;
    }
   } else func_02037208(0x43, -1, 0, 1);
   break;
  }
 } else {
  switch(action) {
  case 0:
   if (s->text[s->pos] == 0x20 && s->text[s->pos + 1] == 0) {
    s->text[s->pos] = 0;
    s->widths[s->pos] = 0;
   }
   if (s->pos != 0) s->pos--;
   func_02037208(0x3a, -1, 0, 1);
   break;
  case 1:
   if (s->text[s->pos] == 0) {
    int limit;
    s->text[s->pos] = 0x20;
    narrow = 0; if (s->kind <= 4) { if ((1 << s->kind) & 0x19) narrow = 1; }
    limit = narrow != 0 ? 10 : 12;
    if (func_020054a4((char *)s->text, 12) > limit * 12) {
     s->text[s->pos] = 0;
     func_02037208(0x43, -1, 0, 1);
     return 0;
    }
    s->widths[s->pos] = 6;
   }
   narrow = 0; if (s->kind <= 4) { if ((1 << s->kind) & 0x19) narrow = 1; }
   if (s->pos < (narrow != 0 ? 10 : 12) * 2 - 1) s->pos++;
   func_02037208(0x3a, -1, 0, 1);
   break;
  case 2: func_ov005_021af090(s); break;
  case 3:
   if (func_ov005_021af2dc(s)) {
    if (s->text[0] == 0) { func_02037208(0x43, -1, 0, 1); break; }
    if (func_ov005_021afba0(s, (char *)s->text)) {
     s->done = 1;
     func_02037208(0x3a, -1, 0, 1);
     if (s->kind != 4) return 1;
     func_ov005_021b0b30(data_ov005_021b224c, 2, func_0202c0c0(0x6a8));
     s->state = 1;
     return 0;
    } else {
     func_02037208(0x43, -1, 0, 1);
     func_ov005_021b0b30(data_ov005_021b224c, 0x11, func_0202c0c0(0xfa));
     s->state = 1;
    }
   } else func_02037208(0x43, -1, 0, 1);
   break;
  }
 }
 return 0;
}









