extern void func_02006110(int *, int *);
extern unsigned int func_02006164(void);
extern unsigned int func_0200617c(void);
extern unsigned int func_02006194(void);
typedef struct {
 unsigned active:1, enabled:1, pad:5, x:9, y:9, pad2:7;
 unsigned a:8, b:8, pad3:16;
 unsigned flags;
} State;
void func_ov000_021ac578(State *p) {
 int x, y;
 int hit = 0;
 if (!p->active) { p->flags &= ~0x20000; return; }
 func_02006110(&x, &y);
 if (func_02006194() || func_0200617c()) {
  
  int height = p->b;


  if (!height) {
   int radius = p->a >> 1;
   int dy = y - (p->y + radius);
   int dx = x - (p->x + radius);
   if (dx * dx + dy * dy < radius * radius) hit = 1;
  } else {
   if ((unsigned)x > p->x && (unsigned)x < p->x + p->a && (unsigned)y > p->y && (unsigned)y < p->y + height) hit = 1;
  }
 }
 if (hit) {
  if (func_02006164()) p->flags |= 0x30000;
  if (!((p->flags << 15) >> 31)) return;
  if (func_02006194()) { *((unsigned *)p) = (*((unsigned *)p) & ~0x78) | 8; return; }
  if (func_0200617c()) { *((unsigned *)p) = (*((unsigned *)p) | 4) & ~0x78; }
 } else {
  if (!func_02006194() || ((p->flags << 13) >> 31)) {
   *((unsigned *)p) &= ~0x78;
   p->flags &= ~0x10000;
   p->flags &= ~0x40000;
  }
  p->flags &= ~0x20000;
 }
}














