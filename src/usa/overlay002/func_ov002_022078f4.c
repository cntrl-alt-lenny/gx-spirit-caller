/* func_ov002_022078f4: guard on cf26c[bit0*0x868]!=0, then
 * func_ov002_021c22cc(bit0, 10); on success, re-read self->b0 fresh, look
 * up the cf16c row's +0xf8 slot id, and tail-call func_0202df24(id, 0x10f4). */
#include "ov002_core.h"

extern char data_ov002_022cf18c[];
extern int func_ov002_021c22cc(int a, int b);
extern int func_0202df24(int a, int b);

int func_ov002_022078f4(struct Ov002Self *self) {
    int bit0 = self->b0;
    int off = (bit0 & 1) * 0x868;

    if (*(unsigned short *)(data_ov002_022cf18c + off) == 0)
        return 0;
    if (func_ov002_021c22cc(bit0, 10) == 0)
        return 0;

    {
        int bit0b = self->b0;
        int offb = (bit0b & 1) * 0x868;
        int id = ((struct Ov002Slot *)(data_ov002_022cf08c + offb + 0xf8))->id;
        return func_0202df24(id, 0x10f4);
    }
}
