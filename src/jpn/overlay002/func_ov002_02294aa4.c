/* func_ov002_02294aa4: guard on data_ov002_022cf08c[self->b0*0x868] <=
 * 0xfa0, then func_ov002_02280594(self->b0, self->f0, 0) >= 0, then sum
 * func_0202b89c() + func_ov002_0228119c(self->b0, self->b0) against the
 * OTHER player's data_ov002_022cf08c[!self->b0*0x868] field.
 */
#include "ov002_core.h"

extern int func_ov002_02280594(int a, int b, int c);
extern int *func_ov002_021afa94(void);
extern int func_0202b89c(int id);
extern int func_ov002_0228119c(int a, int b);

int func_ov002_02294aa4(struct Ov002Self *self) {
    int off = (self->b0 & 1) * 0x868;
    int field = *(int *)((char *)data_ov002_022cf08c + off);
    int bit0;
    int id;
    int a4;
    int sum;
    int off2;
    int field2;

    if (field > 0xfa0)
        return 0;

    if (func_ov002_02280594(self->b0, self->f0, 0) < 0)
        goto fail;

    id = ((struct Ov002Slot *)func_ov002_021afa94())->id;
    bit0 = self->b0;
    a4 = func_0202b89c(id);
    sum = a4 + func_ov002_0228119c(bit0, bit0);

    off2 = ((1 - self->b0) & 1) * 0x868;
    field2 = *(int *)((char *)data_ov002_022cf08c + off2);

    if (sum >= field2)
        return 1;
fail:
    return 0;
}
