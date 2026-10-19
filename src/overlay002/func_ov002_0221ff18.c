typedef unsigned short u16;
typedef unsigned int u32;
struct Card { u16 id; u16 side:1; u16 pad:5; u16 kind:6; u16 rest:4; };
struct Row { u32 id:13; u32 rest:19; char pad[4]; u16 value; char tail[10]; };
extern char data_ov002_022cf16c[];
extern int func_ov002_021c8470(int a, int b);
extern int func_ov002_021c84a8(int a, int b);
extern int func_ov002_021de408(int a, int b);
extern void func_ov002_021e276c(void *self, int a, int b, int c);
extern int func_ov002_0223df38(struct Card *self, int i, int *out);
extern int func_ov002_0225764c(int arg0, int arg1, int arg2);
int func_ov002_0221ff18(struct Card *self) {
 int packed;
 int side, slot, value, i, mask;
 struct Row *row;
 char *base;
 int bit, other;
 if (self->kind != 0x23) func_ov002_021e276c((void *)self->side, self->id, 1, 0);
 if (func_ov002_0223df38(self, 0, &packed)) {
  side = (unsigned char)packed;
  slot = (unsigned char)((u16)packed >> 8);
  if (func_ov002_0225764c((int)self, side, slot)) {
   value = func_ov002_021c8470(side, slot);
   other = 1 - side;
   base = data_ov002_022cf16c + (other & 1) * 0x868;
   mask = 0;
   for (i = 0, row = (struct Row *)(base + 0x30), bit = other * 16; i < 5; i++, row++, base += 20, bit++) {
    if (row->id && *(u16 *)(base + 0x38)) {
     if (func_ov002_021c84a8(other, i) <= value) mask |= 1 << bit;
    }
   }
   func_ov002_021de408((int)self, mask);
  }
 }
 return 0;
}




