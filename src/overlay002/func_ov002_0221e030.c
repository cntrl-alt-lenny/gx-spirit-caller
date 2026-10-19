typedef unsigned short u16;
typedef unsigned char u8;
struct Ov002Self {
 u16 f0;
 u16 b0:1; u16 pad2:15;
 u16 pad4:2; u16 b2:1; u16 rest4:13;
 u16 lo6:8; u16 count:8;
};
struct node;
typedef struct Card021c1e44 Card021c1e44;
extern u16 func_ov002_0223de94(struct node *arg0, int arg1);
extern int func_ov002_0223df38(void *self, int arg1, int *arg2);
extern int func_ov002_021de4d8(struct Ov002Self *self, int player, int idx);
extern int func_ov002_021d5a08(struct Ov002Self *arg0, int arg1, int arg2, int arg3, u16 arg4, u16 arg5);
extern int func_ov002_021c1e44(Card021c1e44 *a0, int a1, int a2);
/* Assembly wrapper consumes r0 and r1 despite its void parameter spelling. */
extern asm void func_ov002_0226b11c(int player, int idx);
extern struct { char pad[0x5a8]; int mode; } data_ov002_022ce288;
int func_ov002_0221e030(struct Ov002Self *self) {
 int raw0, raw1;
 int player0, idx0, player1, idx1;
 if (self->b2) return 0;
 if (self->count == 2) {
  raw0 = func_ov002_0223de94((struct node *)self, 0);
  raw1 = func_ov002_0223de94((struct node *)self, 1);
  player0 = (u8)raw0;
  idx0 = (u8)((u16)raw0 >> 8);
  player1 = (u8)raw1;
  idx1 = (u8)((u16)raw1 >> 8);
  switch (data_ov002_022ce288.mode) {
  case 0x80:
   if (func_ov002_0223df38(self, 0, 0) && func_ov002_0223df38(self, 1, 0) && player0 != self->b0 && player1 == self->b0) {
    func_ov002_021de4d8(self, player0, idx0);
    return 0x7f;
   }
   return 0;
  case 0x7f:
   func_ov002_021d5a08(self, player1, idx1, self->f0, 5, player0);
   if (func_ov002_021c1e44((Card021c1e44 *)self, player1, idx1) == 0)
    func_ov002_0226b11c(player1, idx1);
   return 0;
  }
 }
 return 0;
}

