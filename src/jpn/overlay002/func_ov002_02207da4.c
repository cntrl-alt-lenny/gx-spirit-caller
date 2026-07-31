/* func_ov002_02207da4: guard D016C->f_cf8==2, guard
 * func_ov002_021bc7e8(bit0,bit0,f1_5)==0, then compare own-player vs
 * opposite-player cf16c row leading int, return own>other. */
#include "ov002_core.h"

typedef unsigned short u16;
struct S02207e94F2 { u16 bit0 : 1; u16 f1_5 : 5; u16 pad : 10; };
struct S02207e94 { char pad0[2]; struct S02207e94F2 f2; };

extern char data_ov002_022cf08c[];
extern int func_ov002_021bc7e8(int a, int bit0, int f1_5);

int func_ov002_02207da4(struct S02207e94 *self) {
    if (D016C->f_cf8 != 2)
        return 0;
    if (func_ov002_021bc7e8(self->f2.bit0, self->f2.bit0, self->f2.f1_5) == 0)
        return 0;
    return *(int *)(data_ov002_022cf08c + (self->f2.bit0 & 1) * 0x868) >
           *(int *)(data_ov002_022cf08c + ((1 - self->f2.bit0) & 1) * 0x868);
}
