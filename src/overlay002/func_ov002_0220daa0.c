/* func_ov002_0220daa0: 2-bit tag at arg0+2 selects between a D016C-state
 * gated forward to func_ov002_02206780, or a direct func_ov002_021b8fcc query. */
#include "ov002_core.h"
typedef unsigned short u16;
struct S0220daa0F2 { u16 bit0 : 1; u16 f1_5 : 5; u16 pad6 : 6; u16 tag2 : 2; u16 pad14 : 2; };
struct S0220daa0 { short pad0; struct S0220daa0F2 f2; };
extern int func_ov002_02206780(void *arg0, int arg1);
extern int func_ov002_021b8fcc(int player, int idx);

int func_ov002_0220daa0(struct S0220daa0 *arg0, int arg1) {
    if (arg0->f2.tag2 == 0) {
        if (D016C->f_cec != 1 - arg0->f2.bit0) return 0;
        if (D016C->f_cf8 != 2 && D016C->f_cf8 != 4) return 0;
        return func_ov002_02206780(arg0, arg1);
    }
    return func_ov002_021b8fcc(arg0->f2.bit0, arg0->f2.f1_5) != 0;
}
