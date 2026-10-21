typedef unsigned short u16;
typedef unsigned int u32;
struct Self { u16 id; u16 player:1; u16 rest:15; u16 pad[2]; u16 card; };
struct Card { u32 id:13; u32 rest:19; };
extern char data_ov002_022ce288[];
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf178[];
extern char data_ov002_022d0e6c[];
extern int func_ov002_02257594(void *arg0, int arg1);
extern int func_ov002_021e27c0(int self_thing, int arg1);
extern int func_ov002_021e2b1c(int arg0);
extern int func_ov002_021c3ae4(int arg0, int arg1);
extern int func_0202df78(int id, int arg);
extern void func_ov002_0226afd0(int arg0, int arg1, int arg2);
extern void func_ov002_021d7b44(int a, struct Card *b, int c);
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_0226af78(int arg0, int arg1);
int func_ov002_0222adfc(struct Self *self, int arg1) {
 u32 i;
 int card = self->card;
 switch (*(int *)(data_ov002_022ce288 + 0x5a8)) {
 case 0x80: {
  int n;
  if (func_ov002_02257594(self, arg1) == 0) return 0;
  func_ov002_021e27c0(1-self->player, 1);
  func_ov002_021e2b1c(0x1e);
  n = func_ov002_021c3ae4(1-self->player, (u16)card);
  if (n == 0) return 0x78;
  if (n == 1) {
   i = 0;
   if (i < *(u32 *)(data_ov002_022cf178 + ((1-self->player)&1)*0x868)) {
    do {
     if (func_0202df78(((struct Card *)(data_ov002_022cf16c + ((1-self->player)&1)*0x868 + 0x120))[i].id, card) != 0)
      *(u16 *)(data_ov002_022d0e6c + 0xb0) = i;
     i++;
    } while (i < *(u32 *)(data_ov002_022cf16c + ((1-self->player)&1)*0x868 + 0xc));
   }
   return 0x7e;
  }
  return 0x7f;
 }
 case 0x7f:
  func_ov002_0226afd0(1-self->player, self->id, card);
  return 0x7e;
 case 0x7e:
  func_ov002_021d7b44(1-self->player, (struct Card *)(data_ov002_022cf16c + ((1-self->player)&1)*0x868 + 0x120) + *(u16 *)(data_ov002_022d0e6c + 0xb0), 1);
  return 0x64;
 case 0x78:
  func_ov002_021ae400(self->player, 0x11);
  return 0x77;
 case 0x77:
  func_ov002_0226af78(self->player, 1);
  return 0x64;
 case 0x64:
  func_ov002_021e27c0(1-self->player, 0);
  return 0;
 }
 return 0;
}

