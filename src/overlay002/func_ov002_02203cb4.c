/* func_ov002_02203cb4: gate chain -- D016C.f_cec-derived row selector
 * must match self's kind field AND self->b0, the row's +8 field must
 * be nonzero, self's [0x14,0x16) halfwords must satisfy a<b, then
 * forward to func_ov002_021c1e44 with cd3f4's f_0/f_1c. */
#include "ov002_core.h"

extern char data_ov002_022cd420[];

int func_ov002_02203cb4(struct Ov002Self *self) {
    int row_idx = 1 - D016C->f_cec;
    unsigned short raw = *(unsigned short *)((char *)self + 2);
    unsigned int kind = (unsigned int)(raw << 20) >> 26;
    char *row = data_ov002_022cd420 + row_idx * 0x38;

    if (kind == 13 && row_idx == self->b0) {
        if (*(int *)(row + 8) != 0) {
            unsigned short a = *(unsigned short *)((char *)self + 0x14);
            unsigned short b = *(unsigned short *)((char *)self + 0x16);
            if (a < b) {
                int p0 = *(int *)data_ov002_022cd3f4;
                int p1 = *(int *)(data_ov002_022cd3f4 + 0x1c);
                if (func_ov002_021c1e44(self, p0, p1) == 0) {
                    return 1;
                }
            }
        }
    }
    return 0;
}
