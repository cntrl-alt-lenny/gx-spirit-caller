/* func_ov002_0220d34c: self->b0 and a 5-bit field (bits 1-5 of the same u16
 * at self+2) both feed func_ov002_021c19f0; a 9-bit field at self+4 selects
 * a data_ov002_022d0170 u16 entry whose 13-bit id gates func_0202ecb0, then
 * func_ov002_021bb184(0x1a77, self->b0, r) gates the final self->f14 read. */
#include "ov002_core.h"

extern int func_ov002_021c19f0(int a, int b);
extern char data_ov002_022d0170[];
extern int func_0202ecb0(int id);
extern int func_ov002_021bb184(int a0, int a1, int a2);

int func_ov002_0220d34c(struct Ov002Self *self) {
    int field5 = (unsigned)(*(unsigned short *)((char *)self + 2) << 26) >> 27;
    int r = func_ov002_021c19f0(self->b0, field5);
    int field9 = (unsigned)(*(unsigned short *)((char *)self + 4) << 17) >> 23;
    unsigned short entry = *(unsigned short *)(data_ov002_022d0170 + field9 * 4);
    int id = (unsigned)(entry << 19) >> 19;

    if (func_0202ecb0(id) != 0 && func_ov002_021bb184(0x1a77, self->b0, r) != 0) {
        return *(int *)((char *)self + 0x14) == 0;
    }
    return *(int *)((char *)self + 0x14);
}
