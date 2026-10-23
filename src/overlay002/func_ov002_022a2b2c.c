typedef struct { int f0; char pad[8]; int fc, f10; } Self0229f354;
typedef struct { int x, y; } Pair0229f354;
typedef struct { char pad[4]; int f4; char pad8[0x2c]; int f34; } ObjA16;
typedef struct { int f0, f4, f8, fc, f10, f14, f18, f1c; } Button;
typedef struct { int f0, mode, f8; unsigned mask; int f10, focus, invalid, f1c, index, f24, f28, f2c, row, f34, timer; char pad3c[12]; int f48, f4c; char pad50[16]; int f60; char pad64[0x134]; Button button[1]; } Menu;
typedef struct { unsigned attr; unsigned short tile, pad; } Sprite;
extern unsigned int func_02006194(void);
extern int func_ov002_022a16b0(ObjA16 *s);
extern void func_ov002_0229f354(Pair0229f354 *out, Self0229f354 *self);
extern void func_ov002_022a2a40(Pair0229f354 *out, Menu *s, int i);
extern void func_ov002_0229f7e8(Menu *s);
extern int func_0207f05c(void *, void *, int);
extern char data_ov002_022d0f98[];
extern struct { char pad[0xd0]; int state; } data_ov002_022d0f2c;
extern struct { char pad[0xcf8]; int x; } data_ov002_022d016c;
extern struct { char pad[0x38]; unsigned flags; } data_021040ac;
static inline void sprite(Sprite *o, int x, int y, int t) { o->attr = ((x & 511) << 16) | ((y & 255) | 0x80000000); o->tile = t / 128 | 0xa000; }
static inline void pos(Pair0229f354 *out, Menu *s, int i) { Pair0229f354 t; func_ov002_022a2a40(&t,s,i); *out = t; }
static inline int active(Button *b) { if(b->f0 && b->f18) return 1; return 0; }
void func_ov002_022a2b2c(Menu *s) {
 struct { Pair0229f354 q, p; Sprite o; } coords;
 Pair0229f354 r;
 int a, b;
 if (s->timer < 8) return;
 if (s->f48) func_ov002_0229f7e8(s);
 if (data_ov002_022d0f2c.state != 2) return;
 if (s->mode == 4) {
  int y = func_ov002_022a16b0((ObjA16 *)s) + s->row * 8;
  int x = data_ov002_022d016c.x * 4 + 4;
  sprite(&coords.o,x*8,y,0xb980);
  func_0207f05c(data_ov002_022d0f98, &coords.o, 1);
  if (s->focus < 0) return;
  if (func_02006194() && !s->button[s->focus].f4) return;
  { Button *button = &s->button[s->focus];
  int enabled = active(button);
  if (enabled) a = !(s->button[s->focus].f18 & 4);
  else a = s->button[s->focus].f4; }
  { Pair0229f354 temp;
    func_ov002_0229f354(&temp, (Self0229f354 *)&s->button[s->focus]); coords.p = temp; }
  { int y = coords.p.y + func_ov002_022a16b0((ObjA16 *)s) - 16;
    int x = coords.p.x - 16;
    int tile = ((a + 1) * 512 + 0xb980) / 128;
    sprite(&coords.o,x,y,(a+1)*512+0xb980); }
  func_0207f05c(data_ov002_022d0f98, &coords.o, 1);
  return;
 }
 switch(s->mode) {
 case 5: case 6: case 9:
  if (s->invalid) break;
  { Pair0229f354 temp; func_ov002_022a2a40(&temp,s,s->index); coords.q=temp; }
  { int y = coords.q.y + func_ov002_022a16b0((ObjA16 *)s) - 16;
    int x = coords.q.x - 16;
    sprite(&coords.o,x,y,0xc980); }
  func_0207f05c(data_ov002_022d0f98, &coords.o, 1);
  if (s->f4c) {
   int i;
   for(i=0; i<20; i++) if(s->mask & (1 << (i+1))) break;
   { Pair0229f354 temp; func_ov002_022a2a40(&temp,s,i); coords.q=temp; }
   { int y = coords.q.y + func_ov002_022a16b0((ObjA16 *)s) - 16;
     int x = coords.q.x - 16;
     coords.o.attr = (coords.o.attr & 0xfe00ff00) | (y & 255) | ((x & 511) << 16); }
   func_0207f05c(data_ov002_022d0f98, &coords.o, 1);
  }
  break;
 case 11: return;
 }
 if(s->mode < 0 && s->f60 != 1) return;
 if(s->focus < 0) return;
 if(func_02006194() && !s->button[s->focus].f4) return;
 a = s->mode == 7 ? 48 : 32;
 b = s->mode == 7 || s->mode == 4 ? 32 : 24;
 { Pair0229f354 temp;
   func_ov002_0229f354(&temp,(Self0229f354 *)&s->button[s->focus]); r=temp; }
 { int tile = ((!(data_021040ac.flags & 16) << 10) + 0xb980) / 128;
   int y = r.y + func_ov002_022a16b0((ObjA16 *)s) - b/2 - 1;
   int x = r.x - a/2 - 1;
   coords.o.attr = ((x & 511) << 16) | ((y & 255) | 0xc0004000);
   coords.o.tile = tile | 0xa000; }
 func_0207f05c(data_ov002_022d0f98, &coords.o, 1);
}










