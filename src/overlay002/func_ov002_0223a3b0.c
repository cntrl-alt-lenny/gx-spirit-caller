typedef unsigned char u8;
typedef unsigned short u16;
struct Self {
 u16 f0;
 u16 side:1; u16 idx:5; u16 pad2:10;
 u16 pad4:6; u16 value:9; u16 pad5:1;
 u16 pad6:8; u16 flag:8;
 u16 f8;
};
struct Slot { unsigned int pad0:13; unsigned int low:1; unsigned int pad1:8; unsigned int high:8; unsigned int pad3:2; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int func_ov002_021bc55c(int side, int idx);
extern void func_ov002_021d479c(u16 a0, u16 a1, u16 a2, u16 a3);
int func_ov002_0223a3b0(struct Self *self) {
 struct Slot *slot = (struct Slot *)(data_ov002_022cf16c + (self->side & 1) * 0x868 + 0x30 + self->idx * 0x14);
 int idx;
 if (self->value != slot->high * 2 + slot->low) return 0;
 if (*(u16 *)(data_ov002_022cf1a4 + (self->side & 1) * 0x868 + self->idx * 0x14) == 0) return 0;
 if (self->flag != 0) {
  idx = (self->f8 >> 8) & 0xff;
  if (func_ov002_021bc55c(self->side, idx) != 0) {
   func_ov002_021d479c((u16)((self->side ? 0x8000 : 0) | 0x3d),
    (u16)((u8)self->side | ((u8)self->idx << 8)),
    (u16)((u8)self->side | ((u8)idx << 8)), 0);
  }
 }
 return 0;
}
