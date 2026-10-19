struct Self {
 unsigned short card;
 unsigned short player:1;
 unsigned short rest:15;
 unsigned short pad:2;
 unsigned short blocked:1;
 unsigned short rest4:13;
};
struct State { char pad[0x5a8]; int mode; };
struct Ctrl {
 char pad[0x10];
 unsigned int a:13;
 unsigned int bit13:1;
 unsigned int b:8;
 unsigned int value:8;
 unsigned int c:2;
};
extern struct State data_ov002_022ce288;
extern struct Ctrl data_ov002_022cdc78;
extern int func_ov002_0225368c(int ctx, int card_id, int arg2);
extern void func_ov002_021ae400(int a, int b);
extern int func_ov002_021e286c(int arg0);
extern void func_ov002_021d479c(unsigned short a0, unsigned short a1, unsigned short a2, unsigned short a3);
extern void func_ov002_021e2818(int player);
extern int func_ov002_021e2b1c(int arg0);
int func_ov002_02214b44(struct Self *self) {
 if (self->blocked) return 0;
 switch (data_ov002_022ce288.mode) {
 case 0x80:
  if (func_ov002_0225368c(self->player, self->card, 0) == 0) {
   func_ov002_021ae400(self->player, 0xd);
   return 0;
  }
  func_ov002_021e286c(self->player);
  func_ov002_021d479c((unsigned short)((self->player ? 0x8000 : 0) | 0x57), 0xd,
   (unsigned short)(data_ov002_022cdc78.value * 2 + data_ov002_022cdc78.bit13), 0);
  return 0x7f;
 case 0x7f:
  func_ov002_021e2818(self->player);
  func_ov002_021e2b1c(0x1e);
  func_ov002_021e2818(self->player);
  return 0;
 default: return 0;
 }
}
