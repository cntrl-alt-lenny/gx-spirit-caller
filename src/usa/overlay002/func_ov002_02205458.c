/* func_ov002_02205458: guard chain — self's field9 (bits6-14 of +4) must
 * pass func_ov002_021ca4dc; arg1 non-null; arg1->b0 != self->b0; then
 * either func_0202e1e0(arg1->f0) holds or arg1's field2 (bits12-13 of +2)
 * is 0; finally forward arg1 to func_ov002_021b6338 and test bit0 of its
 * result as a signed >0 compare. */
#include "ov002_core.h"

extern int func_ov002_021ca4dc(int arg0);
extern int func_0202e1e0(int id);
extern int func_ov002_021b6338(void *arg1);

int func_ov002_02205458(struct Ov002Self *self, struct Ov002Self *arg1) {
    int field9 = (unsigned)(*(unsigned short *)((char *)self + 4) << 17) >> 23;

    if (func_ov002_021ca4dc(field9) == 0)
        return 0;
    if (arg1 == 0)
        return 0;
    if (arg1->b0 == self->b0)
        return 0;
    if (func_0202e1e0(*(unsigned short *)arg1) == 0) {
        int field2 = (unsigned)(*(unsigned short *)((char *)arg1 + 2) << 18) >> 30;
        if (field2 != 0)
            return 0;
    }
    return (func_ov002_021b6338(arg1) & 1) > 0;
}
