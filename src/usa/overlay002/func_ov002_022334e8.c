/* func_ov002_022334e8: opponent (1-self->b0) per-player guard chain.
 * If cf17c[opp*0x868] is 0, bail. Else pull slot id from
 * cf16c[opp*0x868+0x260], run several guard predicates, and dispatch to
 * one of three tail actions depending on which guards pass. Every path
 * shares a single "return 0" epilogue. */
#include "ov002_core.h"

extern int func_0202e1e0(int a);
extern int func_02030584(int a);
extern int func_ov002_021bc538(int a);
extern int func_ov002_021c97ac(int a, int b, int c);
extern int func_ov002_021ca360(int player, int id);
extern int func_ov002_021d81a8(int a, int b, int c);
extern void func_ov002_021d86ec(int a);
extern void func_ov002_021e1304(int a, int b, int c);
extern void func_ov002_021e2728(int a);
extern void func_ov002_021e2c30(int a0, int a1, int a2);
extern int func_ov002_0227acc8(int a, int b, int c, int d);

int func_ov002_022334e8(struct Ov002Self *self)
{
    unsigned int opp = (1 - self->b0) & 1;

    if (*(int *)((char *)data_ov002_022cf09c + opp * 0x868) == 0) {
        goto end;
    }

    {
        int slotId = ((struct Ov002Slot *)(data_ov002_022cf08c + opp * 0x868 + 0x260))->id;

        if (func_ov002_021c97ac(1 - self->b0, 0xd, 0) == 0) {
            func_ov002_021e2728(1 - self->b0);
        }
        func_ov002_021d86ec(1 - self->b0);

        if (func_0202e1e0(slotId) != 0
            && func_02030584(slotId) != 0
            && func_ov002_021ca360(self->b0, slotId) != 0) {
            if (func_ov002_021bc538(self->b0) != 0
                && ((int (*)(int))func_ov002_021ca1d8)(self->b0) != 0) {
                func_ov002_0227acc8(self->b0,
                    (int)(data_ov002_022cf08c + (((1 - self->b0) & 1) * 0x868) + 0x260), 1, 0);
                goto end;
            }
            func_ov002_021e1304(1 - self->b0, 1, 1);
            goto end;
        }
        func_ov002_021d81a8(1 - self->b0, (int)(data_ov002_022cf08c + (((1 - self->b0) & 1) * 0x868) + 0x260), 0);
        func_ov002_021e2c30(1 - self->b0, 2, 1);
    }
end:
    return 0;
}
