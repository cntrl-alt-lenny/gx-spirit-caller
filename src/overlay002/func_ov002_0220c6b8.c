typedef unsigned short u16;
struct Card {
 u16 id;
 u16 player:1;
 u16 row:5;
 u16 type:6;
 u16 pad:2;
 u16 other:1;
 u16 last:1;
};
extern int func_ov002_021b3618(int player, int idx);
extern int func_ov002_021b3ecc(int arg0, int arg1, int arg2);
extern int func_ov002_021bc8c8(int a, int b, int c);
extern int func_ov002_021bc68c(int self);
extern int func_ov002_021bc288(int a, int b);
extern int func_ov002_021ca2b8();
extern int func_ov002_0223f6c4(struct Card *self);
extern int func_ov002_022536e8(void *self, int arg1, int arg2);
extern char data_ov002_022cf17c[];
int func_ov002_0220c6b8(struct Card *self) {
 int slot;
 int side = self->player ^ self->other;
 int row;
 slot = func_ov002_021b3618(self->player, self->row);
 if (slot == 0xffff) return 0;
 if (!func_ov002_021b3ecc(self->player, self->row, self->id)) return 0;
 row = (unsigned char)(slot >> 8);
 slot = (unsigned char)slot;
 if (!func_ov002_021bc8c8(side, slot, row)) return 0;
 if (!func_ov002_021bc68c(side)) {
  if (slot != side || !func_ov002_021bc288(slot, row)) return 0;
 }
 if (!func_ov002_021ca2b8(side)) return 0;
 if (*(int *)(data_ov002_022cf17c + (self->player & 1) * 0x868) == 0) {
  int value = func_ov002_0223f6c4(self);
  if (!func_ov002_022536e8((void *)self->player, self->id, value)) return 0;
 }
 return 1;
}
