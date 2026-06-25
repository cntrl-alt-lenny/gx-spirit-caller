/* CAMPAIGN-PREP candidate for func_0224fad8 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard==0; counted loop; :2 bitfield@15 (lsl15;lsr30 movs); sink
 *   risk:       reg-alloc i/slots/base may flip; bitfield must emit movs lsr#30 not cmp; off-CSE
 *   confidence: high
 */
/* func_ov002_0224fad8: per-player slot scan. The slot holds a 2-bit field at
 * bit 15 (lsl#15;lsr#30); when non-zero, mark via the list sink. */
#include "ov002_core.h"

extern char data_ov002_022cf180[];

struct Ov002SlotFlags { unsigned int : 15; unsigned int f15 : 2; };

void func_ov002_0224fad8(int player) {
    int i;
    struct Ov002SlotFlags *slots;
    char *base;
    int off = (player & 1) * 0x868;
    if (*(int *)(data_ov002_022cf180 + off) == 0)
        return;
    base = data_ov002_022cf16c + off;
    slots = (struct Ov002SlotFlags *)(base + 0x418);
    for (i = 0; i < *(unsigned int *)(base + 0x14); i++) {
        if (slots[i].f15)
            func_ov002_02253458(player, 0xe, i);
    }
}
