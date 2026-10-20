typedef unsigned short u16;
struct Ov002Self {
 u16 f0;
 u16 side:1; u16 idx:5; u16 kind:6; u16 pad2:4;
 u16 pad4:6; u16 value:9; u16 pad5:1;
};
struct Slot { unsigned int id:13; unsigned int low:1; unsigned int pad:8; unsigned int high:8; unsigned int pad2:2; char rest[16]; };
struct Side { char hdr[0x30]; struct Slot rows[1]; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int data_ov002_022cd3f4[];
extern int func_ov002_021b4120(int arg0, int arg1, int arg2);
extern void func_ov002_021c4c9c(int side, int idx, int *out);
extern int func_ov002_021c9dac(int player);
extern int func_ov002_021d59cc(int arg0, int arg1, int arg2, int arg3, unsigned short arg4);
extern void func_ov002_021d6c98(struct Ov002Self *self, int player, int idx);
int func_ov002_0223a118(struct Ov002Self *self) {
 int out[11];
 int side, idx, value;
 int off = (self->side & 1) * 0x868;
 int roff = self->idx * 20;
 struct Slot *slot = (struct Slot *)(data_ov002_022cf16c + off + 0x30 + roff);
 if (self->value != slot->high * 2 + slot->low) return 0;
 if (*(u16 *)(data_ov002_022cf1a4 + off + roff) == 0) return 0;
 if (self->kind == 5) {
  value = func_ov002_021b4120(self->side, self->idx, 0x1472);
  side = ((volatile struct Ov002Self *)self)->side;
  if ((unsigned char)value == side && func_ov002_021c9dac(side) != 0)
   func_ov002_021d6c98(self, self->side, self->idx);
 } else {
  side = data_ov002_022cd3f4[0];
  idx = data_ov002_022cd3f4[7];
  if (((struct Side *)(data_ov002_022cf16c + (side & 1) * 0x868))->rows[idx].id != 0 && *(u16 *)(data_ov002_022cf1a4 + (side & 1) * 0x868 + idx * 20) != 0) {
   func_ov002_021c4c9c(side, idx, out);
   value = out[5];
   if (value > 0xffff) value = 0xffff;
   func_ov002_021d59cc(self->side, self->idx, self->f0, 3, (u16)value);
   value = out[6];
   if (value > 0xffff) value = 0xffff;
   func_ov002_021d59cc(self->side, self->idx, self->f0, 3, (u16)value);
  }
 }
 return 0;
}



