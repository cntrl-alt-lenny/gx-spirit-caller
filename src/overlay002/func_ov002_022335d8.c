/* func_ov002_022335d8: opponent (1-self->b0) per-player guard chain.
 * If cf17c[opp*0x868] is 0, bail. Else pull slot id from
 * cf16c[opp*0x868+0x260], run several guard predicates, and dispatch to
 * one of three tail actions depending on which guards pass. Every path
 * shares a single "return 0" epilogue. */
#include "ov002_core.h"

extern int func_0202e234(int a);
extern int func_020305d8(int a);
extern int func_ov002_021bc618(int a);
extern int func_ov002_021c988c(int a, int b, int c);
extern int func_ov002_021ca440(int player, int id);
extern int func_ov002_021d8298(int a, int b, int c);
extern void func_ov002_021d87dc(int a);
extern void func_ov002_021e13f4(int a, int b, int c);
extern void func_ov002_021e2818(int a);
extern void func_ov002_021e2d20(int a0, int a1, int a2);
extern int func_ov002_0227adb8(int a, int b, int c, int d);

int func_ov002_022335d8(struct Ov002Self *self)
{
    unsigned int opp = (1 - self->b0) & 1;

    if (*(int *)((char *)data_ov002_022cf17c + opp * 0x868) == 0) {
        goto end;
    }

    {
        int slotId = ((struct Ov002Slot *)(data_ov002_022cf16c + opp * 0x868 + 0x260))->id;

        if (func_ov002_021c988c(1 - self->b0, 0xd, 0) == 0) {
            func_ov002_021e2818(1 - self->b0);
        }
        func_ov002_021d87dc(1 - self->b0);

        if (func_0202e234(slotId) != 0
            && func_020305d8(slotId) != 0
            && func_ov002_021ca440(self->b0, slotId) != 0) {
            if (func_ov002_021bc618(self->b0) != 0
                && ((int (*)(int))func_ov002_021ca2b8)(self->b0) != 0) {
                func_ov002_0227adb8(self->b0,
                    (int)(data_ov002_022cf16c + (((1 - self->b0) & 1) * 0x868) + 0x260), 1, 0);
                goto end;
            }
            func_ov002_021e13f4(1 - self->b0, 1, 1);
            goto end;
        }
        func_ov002_021d8298(1 - self->b0, (int)(data_ov002_022cf16c + (((1 - self->b0) & 1) * 0x868) + 0x260), 0);
        func_ov002_021e2d20(1 - self->b0, 2, 1);
    }
end:
    return 0;
}
