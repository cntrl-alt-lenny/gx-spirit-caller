typedef unsigned short u16;
typedef unsigned char u8;
struct node {
 u16 kind;
 u16 owner:1; u16 slot:5; u16 category:6; u16 mode:2; u16 rest:2;
 u16 pad6:6; u16 val:9; u16 rest4:1;
};
struct Entry { unsigned id:13; unsigned side:1; unsigned pad:8; unsigned hi:8; unsigned rest:2; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int func_ov002_021d59cc(int a, int b, u16 c, int d, int e);
extern int func_ov002_0223de94(struct node *arg0, int arg1);
extern int func_ov002_0223df38(void *self, int i, int *out);
extern int func_ov002_0225764c(void *self, int a, int b);
extern int func_ov002_0226b11c(int a, int b);
int func_ov002_02231dec(struct node *self) {
 int owner = self->owner & 1;
 int slot = self->slot;
 int off = owner * 0x868;
 int soff = slot * 0x14;
 struct Entry *e = (struct Entry *)(data_ov002_022cf16c + off + 0x30 + soff);
 int r;
 int a, b;
 if (self->val != e->hi * 2 + e->side) return 0;
 if (*(u16 *)(data_ov002_022cf1a4 + off + soff) == 0) return 0;
 if (func_ov002_0223df38(self, 0, 0)) {
  r = func_ov002_0223de94(self, 0);
  a = (u8)r;
  b = (u8)((u16)r >> 8);
  if (func_ov002_0225764c(self, a, b)) {
   owner = self->owner;
   func_ov002_021d59cc(a, b, (u8)owner | ((u8)self->slot << 8), 6, owner);
   func_ov002_0226b11c(a, b);
  }
 }
 return 0;
}
