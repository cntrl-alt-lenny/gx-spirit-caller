#include "ov002_core.h"

struct F2_518 {
    unsigned short bit0 : 1;   /* bit 0: player */
    unsigned short idx  : 5;   /* bits 1-5 */
    unsigned short mid  : 6;   /* bits 6-11 (unused) */
    unsigned short tag2 : 2;   /* bits 12-13 */
    unsigned short top  : 2;   /* bits 14-15 (unused) */
};

struct F4_518 {
    unsigned short pad6   : 6;   /* bits 0-5 */
    unsigned short field9 : 9;   /* bits 6-14 */
    unsigned short top    : 1;   /* bit 15 */
};

struct Node518 {
    u16 f0;             /* +0x0 */
    struct F2_518 f2;   /* +0x2 */
    struct F4_518 f4;   /* +0x4 */
};

struct Slot518 {
    unsigned int id     : 13;  /* bits 0-12 */
    unsigned int flag13 : 1;   /* bit 13 */
    unsigned int _pad   : 8;   /* bits 14-21 */
    unsigned int sub    : 8;   /* bits 22-29 */
    unsigned int _pad2  : 2;   /* bits 30-31 */
};

extern unsigned short data_ov002_022cf1a2[];

extern int func_ov002_021de64c(void *a, int b, int c, int d);
extern int func_ov002_021c10e8(int a, int b, int c);
extern int func_ov002_021e276c(unsigned int bit, unsigned short f0, unsigned int k, unsigned int fld);

int func_ov002_0222a518(struct Node518 *self) {
    struct Slot518 *slot;
    int playerOff, idx, field9, r;
    u16 v;

    if (self->f2.tag2 != 3)
        goto end;

    playerOff = (self->f2.bit0 & 1) * 0x868;
    idx = self->f2.idx;
    field9 = self->f4.field9;

    slot = (struct Slot518 *)((char *)data_ov002_022cf16c + playerOff + 0x30 + idx * 20);

    if (field9 != slot->sub * 2 + slot->flag13)
        return 0;

    if (*(u16 *)((char *)data_ov002_022cf1a4 + playerOff + idx * 20) == 0)
        return 0;

    if (func_ov002_021de64c(self, self->f2.bit0, self->f2.idx, 0) == 0)
        goto end;

    v = *(u16 *)((char *)data_ov002_022cf1a2 + (self->f2.bit0 & 1) * 0x868 + self->f2.idx * 20);
    r = func_ov002_021c10e8(self->f2.bit0, self->f2.idx, 1);

    func_ov002_021e276c(self->f2.bit0, self->f0, 1,
                         (u16)((self->f4.field9 << 3) + (r << 2) + (v << 1) + 1));

end:
    return 0;
}
