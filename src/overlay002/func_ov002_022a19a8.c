typedef struct { char pad[4]; int f4; char pad8[0x2c]; int f34; } ObjA16;
typedef struct { int f0, mode; unsigned int bits, mask; int f10, kind, pad18[2], index, pad24[10], value; } Self;
struct Self0229f160 { int f_0; char _pad[8]; int f_c, f_10; };
struct Obj { int f0, f4, kind, fc, f10, f14, state, value; };
typedef struct {
 int f0, mode, f8, fc, f10, focus, invalid, f1c, index, count, scroll, f2c, row, f34, f38, f3c, f40;
 char pad44[0x150]; int buttons; struct Obj button[1];
} Menu;
extern void func_02006110(int *out_a, int *out_b);
extern unsigned int func_02006164(void);
extern unsigned int func_0200617c(void);
extern unsigned int func_02006194(void);
extern int func_02037208(int a0, int r1, int r2, int r3);
extern int func_ov002_0229f160(struct Self0229f160 *self, int arg1, int arg2);
extern void func_ov002_0229f1e0(struct Obj *obj);
extern int func_ov002_022a0f8c(Self *self, int i);
extern void func_ov002_022a10fc(Menu *s, int i);
extern int func_ov002_022a16b0(ObjA16 *s);
extern void func_ov002_022acd4c(Menu *s);
typedef struct { int v[2]; } Pair;
extern Pair data_ov002_022ca3d0;
void func_ov002_022a19a8(Menu *s)
{
 int x, y;
 int oldIndex, oldFocus;
 int i, spacing;
 int j;
 if (s->mode < 0) { func_ov002_022acd4c(s); return; }
 oldIndex = s->index; oldFocus = s->focus;
 func_02006110(&x, &y);
 y -= func_ov002_022a16b0((ObjA16 *)s);
 switch (s->mode) {
 case 3:
  if (func_02006164() && y >= s->row * 8 && y < s->row * 8 + 16) {
   spacing = s->count < 4 ? 64 : 42;
   { int left = spacing * s->index + 32; if (x >= left && x < left + 64) break; }
   for (i = s->index + 1; i < s->count; i++) {
    int left = i * spacing + 32;
    if (x >= left && x < left + 64) {
     func_ov002_022a10fc(s, i); s->index = i; break;
    }
   }
   for (i = s->index - 1; i >= 0; i--) {
    int left = i * spacing + 32;
    if (x >= left && x < left + 64) {
     func_ov002_022a10fc(s, i); s->index = i; break;
    }
   }
  }
  break;
 case 5:
  { int top = s->row * 8;
   if (y >= top && y < top + 32) {
    if (x >= 48 && x < 208 && (x - 48) % 16 != 0 && (y - top) % 16 != 0) {
     i = (y - top) / 16 * 10 + (x - 48) / 16;
     if (s->index != i) func_ov002_022a10fc(s, i);
     s->index = i;
    } else s->invalid = 1;
   }
  }
  break;
 case 6: case 9:
  if (y >= s->row * 8 && y < s->row * 8 + 16) {
   if (x >= 52 && x < 196 && (x - 52) % 24 < 20) {
    i = (x - 52) / 24;
    if (s->index != i) func_ov002_022a10fc(s, i);
    s->index = i;
   } else s->invalid = 1;
  }
  break;
 case 11:
  { Pair positions = data_ov002_022ca3d0;
   for (i = 0; i < 2; i++) {
    if (y >= positions.v[i] && y < positions.v[i] + 16) {
     oldIndex = i + 1; s->index = oldIndex;
    }
   }
   if (s->f3c && x >= 224 && x < 240 && y >= 32 && y < 105) {
    oldIndex = 3; s->index = oldIndex;
    if (y < 40) s->scroll = 0;
    else if (y > 98) s->scroll = s->count * 16 - 104;
    else s->scroll = (y - 40) * (s->count * 16 - 104) / 57;
    s->scroll = s->scroll > s->count * 16 - 104 ? s->count * 16 - 104 : s->scroll;
   }
  }
  break;
 }
 for (j = 0; j < s->buttons; j++) {
  if (func_ov002_0229f160((struct Self0229f160 *)&s->button[j], x, y)) {
   if (s->f40 == 0) s->focus = j;
   else if (j == s->focus && func_ov002_022a0f8c((Self *)s, s->index) == 0) continue;
   if (func_02006194()) { s->button[j].f4 = 1; break; }
   if (func_0200617c()) func_ov002_0229f1e0(&s->button[j]);
   break;
  }
 }
 if (oldIndex == s->index && oldFocus == s->focus) return;
 if (s->mode == 3) func_02037208(72, -1, 0, 3);
 else func_02037208(56, -1, 0, 3);
}




