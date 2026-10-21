typedef unsigned char u8;
typedef unsigned int u32;
typedef struct Ctx Ctx;
struct Ctx {
 u8 p0[0x455]; u8 state; u8 p456[2]; int f458; int f45c;
 u8 p460[0x20]; u8 b480[0x114]; u32 f594; u8 p598[8]; u32 f5a0;
 u8 p5a4[8]; u8 f5ac; u8 f5ad; u8 p5ae; u8 f5af; u8 f5b0;
 u8 p5b1[0xff]; u8 f6b0; u8 p6b1[0xff]; u8 b7b0[0x50];
 char *f800; u8 *f804; u32 f808; u32 f80c;
 u32 (*f810)(u32, Ctx *, int);
};
extern int func_0209bc20(void *a0);
extern u32 func_020770bc(Ctx *c);
extern int func_02077018(char *, void *);
extern int func_020771bc(Ctx *, void *);
extern int func_02077398(Ctx *, u8 **, int, int, u32);
void func_02076ddc(Ctx *c, u8 *p) {
 u8 low;
 u32 result;
 u32 remaining;
 int index;
 u8 *next;
 int date[3];
 remaining = p[2] + (((p[0] << 8) + p[1]) << 8);
 p += 3;
 c->f45c = -1;
 func_0209bc20(date);
 result = 0;
 c->f80c = date[2] + (((date[0] + 2000) << 16) + (date[1] << 8));
 c->f6b0 = 0;
 c->f5a0 = 0;
 c->f594 = c->f5a0;
 index = 0;
 do {
  u32 size = p[2] + (((p[0] << 8) + p[1]) << 8);
  p += 3;
  c->f458 = -1;
  c->f5ad = 0;
  c->f5ac = 0;
  c->f5af = 0;
  c->f6b0 = 0;
  c->f5b0 = 0;
  c->b7b0[0] = 0;
  remaining -= size + 3;
  c->f804 = p;
  c->f808 = size;
  if (func_02077398(c, &p, 0, 0, result) != 0 || c->f594 < 0x33 || c->f5a0 == 0) {
   c->state = 9;
   return;
  }
  result = func_020770bc(c);
  if (index == 0 && c->f800 != 0) {
   if (func_02077018(c->f800, c->b7b0) != 0) result |= 0x4000;
  }
  low = result & 0xff;
  if (low == 1 && remaining != 0) {
   next = p + 3;
   c->f5ad = 0;
   if (func_02077398(c, &next, 0, 0, 2) != 0) {
    c->state = 9;
    return;
   }
   result = (result & ~0xff) | func_020771bc(c, c->b480);
  }
  if (c->f810 != 0) result = c->f810(result, c, index);
  index++;
 } while (low != 0 && result == 0 && remaining != 0 && (result = 1));
 if (result == 0) c->state = 3;
 else c->state = 9;
}





