struct Self {
 unsigned short f0;
 unsigned short bit:1;
 unsigned short row:5;
 unsigned short kind:6;
 unsigned short pad:4;
};
struct State { int f0; unsigned int player; int busy; int pad[5]; unsigned int row; };
extern struct State data_ov002_022cd3f4;
extern char data_ov002_022cf1a4[];
extern char data_ov002_022cf1a8[];
extern unsigned int func_ov002_021c92fc(unsigned int a, unsigned int b);
int func_ov002_0220c4e8(struct Self *self) {
 if (self->kind == 20) {
  unsigned int mask, flags;
  int bit, row;
  if (data_ov002_022cd3f4.busy != 0) return 0;
  if (*(unsigned short *)(data_ov002_022cf1a4 + (data_ov002_022cd3f4.player & 1) * 0x868 + data_ov002_022cd3f4.row * 20) == 0) return 0;
  mask = func_ov002_021c92fc(data_ov002_022cd3f4.player, data_ov002_022cd3f4.row);
  bit = self->bit;
  row = self->row;
  flags = *(unsigned int *)(data_ov002_022cf1a8 + (bit & 1) * 0x868 + row * 20);
  if (flags & mask) return 1;
  return 0;
 }
 return 1;
}



