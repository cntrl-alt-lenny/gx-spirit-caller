typedef unsigned short u16;
struct Self { u16 id; u16 player:1; u16 rest:15; u16 pad[2]; u16 masks[2]; u16 count; };
struct State { char pad[0x5a8]; int mode; int remaining; };
struct Totals { char pad[0x14]; int a; char pad2[0x864]; int b; };
struct Result { char pad[0xd70]; int player, lo, hi; };
extern struct State data_ov002_022ce288;
extern struct Totals data_ov002_022cf16c;
extern struct Result data_ov002_022d016c;
extern int func_ov002_02257704(void *self);
extern int func_ov002_021de408(int a, int b);
extern void func_ov002_021e276c(void *self, int a, int b, int c);
extern int func_ov002_022577dc(void *self);
extern void func_ov002_0229cf10(char *dst, const char *fmt, int val);
extern void func_ov002_021ae400(int a, int b);
extern int func_ov002_021e7584(void *arg0, int arg1, int arg2);
/* Original supplies only two arguments to the forwarding thunk. */
extern int func_ov002_02257878();
extern void func_ov002_0225935c(int arg0, int arg1, int arg2);
extern int func_ov002_022593f4(void);
extern int func_ov002_021d873c(int arg0, int arg1);
int func_ov002_0221e2a4(struct Self *self) {
 char buf[256];
 switch (data_ov002_022ce288.mode) {
 case 0x80:
  data_ov002_022ce288.remaining = data_ov002_022cf16c.a + data_ov002_022cf16c.b;
  func_ov002_021de408((int)self, func_ov002_02257704(self));
  func_ov002_021e276c((void *)self->player, self->id, 1, 0);
  return 0x7f;
 case 0x7f:
  { int a = data_ov002_022cf16c.a; int b = data_ov002_022cf16c.b; data_ov002_022ce288.remaining = (a + b) - data_ov002_022ce288.remaining; }
  self->masks[0] = self->masks[1] = 0;
  self->count = 1;
  if (data_ov002_022ce288.remaining <= 0) return 0;
  if (func_ov002_022577dc(self) == 0) return 0;
  func_ov002_0229cf10(buf, (const char *)0x119, data_ov002_022ce288.remaining);
  func_ov002_021ae400(self->player, (int)buf);
  return 0x7e;
 case 0x7e:
  if (func_ov002_02257878(self, func_ov002_021e7584) == 0) return 0x7c;
  func_ov002_0225935c(self->player, self->id, (int)func_ov002_021e7584);
  return 0x7d;
 case 0x7d:
  if (func_ov002_022593f4()) {
   int player = data_ov002_022d016c.player;
   int shift = data_ov002_022d016c.lo + data_ov002_022d016c.hi;
   self->masks[player] |= 1 << shift;
   func_ov002_021d873c(player, shift);
   if (--data_ov002_022ce288.remaining) return 0x7e;
   return 0x7c;
  }
  return 0x7e;
 case 0x7c:
  func_ov002_021de408((int)self, self->masks[0] | (self->masks[1] << 16));
  return 0;
 }
 return 0;
}






