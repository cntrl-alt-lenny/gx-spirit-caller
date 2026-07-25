/* func_ov002_021e2d48: guard on D008C->f_d0c, then compare
 * data_ov002_022cd65c[1] against (self->bit14 ^ self->b0) of self->f_2. */
#include "ov002_core.h"

struct Ov002Self2 {
    unsigned short f0;
    unsigned short b0 : 1;
    unsigned short pad : 13;
    unsigned short bit14 : 1;
    unsigned short pad2 : 1;
};
extern int data_ov002_022cd65c[];

int func_ov002_021e2d48(struct Ov002Self2 *self) {
    if (D008C->f_d0c == 0)
        return 0;
    return data_ov002_022cd65c[1] != (self->b0 ^ self->bit14);
}
