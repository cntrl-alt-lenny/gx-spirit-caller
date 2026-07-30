#include "ov002_core.h"

extern void func_ov002_021e276c(int bit0, unsigned short f0, int kind, int fld);
extern int func_ov002_0223def4(void *self, int idx);
extern int func_0202b8f0(int id);
extern void func_ov002_021df818(void *self, int opp, int val);
extern char data_ov002_022d0250[];

struct F6Bits6 { u16 pad:6; u16 field6:6; u16 rest:4; };
struct F4Bit2_2 { u16 pad:2; u16 bit2:1; u16 rest:13; };
struct SmallSlot2 { u16 id:13; u16 rest:3; };

int func_ov002_0222efec(struct Ov002Self *self) {
    struct F6Bits6 *f2bits = (struct F6Bits6 *)((char *)self + 2);
    struct F4Bit2_2 *f4bits = (struct F4Bit2_2 *)((char *)self + 4);
    if (f2bits->field6 != 0x23) {
        func_ov002_021e276c(self->b0, self->f0, 1, 0);
    }
    if (f4bits->bit2 != 0) return 0;
    {
        int idxResult = func_ov002_0223def4(self, 0);
        struct SmallSlot2 *slot = (struct SmallSlot2 *)((char *)data_ov002_022d0250 + idxResult * 4);
        int r = func_0202b8f0(slot->id);
        func_ov002_021df818(self, 1 - self->b0, r);
    }
    return 0;
}
