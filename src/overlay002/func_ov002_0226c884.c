/* func_ov002_0226c884: gate on current-player match + range check, then look
 * up the slot id at (player&1)*0x868 + a1*20 + 0x30, guard against the
 * pending d0e6c+0xa2 request already matching (player,a1), then defer to
 * func_ov002_021c1e20 for the final verdict.
 */
#include "ov002_core.h"

extern int func_ov002_021c1e20(int a, int b, int c);
extern char data_ov002_022d0e6c[];

int func_ov002_0226c884(int player, int a1, int a2) {
    u16 val, packed;
    int flag;

    if (player != D016C->f_d94)
        goto fail;
    a1 = a1 + a2;
    if (a1 > 10)
        goto fail;
    if (((struct Ov002Slot *)((char *)data_ov002_022cf16c + (player & 1) * 0x868 + a1 * 20 + 48))->id == 0)
        return 0;
    val = *(u16 *)(data_ov002_022d0e6c + 0xa2);
    packed = (u8)player | ((u8)a1 << 8);
    if (val == packed)
        return 0;
    flag = (player != (val & 0xff));
    return func_ov002_021c1e20(player, a1, flag) ? 0 : 0x800;
fail:
    return 0;
}
