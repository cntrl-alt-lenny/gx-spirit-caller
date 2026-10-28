typedef struct { int state, hover, choice, height, offset, timer, flags; } State;
typedef struct { char pad[0x54]; unsigned short keys; } Input;
extern Input data_02104bac;
extern void func_02006110(int *, int *);
extern unsigned int func_0200617c(void);
extern int func_02037208(int, int, int, int);
int func_ov005_021b103c(State *s) {
 int x, y, bound;
 int top = (192 - s->height) / 2 - 8;
 int delta = s->height + (192 - s->height) / 2 - 8;
 unsigned short keys = data_02104bac.keys;
 switch (s->state) {
 case 0:
  s->timer++;
  *(volatile unsigned int *)0x04001010 = ((s->height - delta * s->timer / 8) << 16) & 0x01ff0000;
  *(volatile unsigned int *)0x04001014 = ((s->height - delta * s->timer / 8) << 16) & 0x01ff0000;
  if (s->timer >= 8) s->state = 1;
  break;
 case 1:
  if (keys) {
   switch (s->flags & 15) {
   case 1:
    if (keys & 3) { s->state = 2; func_02037208(0x3a, -1, 0, 1); }
    break;
   case 2:
    if (keys & 1) { func_02037208(0x3a, -1, 0, 1); s->state = 2; }
    else if (keys & 2) { func_02037208(0x43, -1, 0, 1); s->choice = 1; s->state = 2; }
    else if (keys & 0x30) { func_02037208(0x38, -1, 0, 1); s->choice = 1 - s->choice; }
    break;
   }
  } else {
   func_02006110(&x, &y);
   switch (s->flags & 15) {
   case 1:
    bound = s->offset + top + 5;
    if (x >= 0x68 && y >= bound && x < 0x98 && y < bound + 0x12) s->hover = 1;
    else s->hover = 0;
    if (func_0200617c() && s->hover) { s->state = 2; func_02037208(0x3a, -1, 0, 1); }
    break;
   case 2: {
    int bound2 = s->offset + top + 5;
    if (x >= 0x30 && y >= bound2 && x < 0x60 && y < bound2 + 0x12) { s->hover = 1; s->choice = 0; }
    else if (x >= 0xa0 && y >= bound2 && x < 0xd0 && y < bound2 + 0x12) { s->hover = 1; s->choice = 1; }
    else s->hover = 0;
    if (func_0200617c() && s->hover) { func_02037208(0x3a, -1, 0, 1); s->state = 2; }
    break; }
   }
  }
  break;
 case 2:
  s->timer--;
  *(volatile unsigned int *)0x04001010 = ((s->height - delta * s->timer / 8) << 16) & 0x01ff0000;
  *(volatile unsigned int *)0x04001014 = ((s->height - delta * s->timer / 8) << 16) & 0x01ff0000;
  if (s->timer <= 0) return 1;
  break;
 }
 return 0;
}



