/* CAMPAIGN-PREP candidate for func_02248434 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     mla base-fusion via stride-0x868 array index (a0&1); unsigned&&signed bound; pre-test loop
 *   risk:       index*0x868 must fuse to mla not mul; field_10 u32 for bcs; && order; struct stride must be exactly 0x868
 *   confidence: med
 */
#include <nitro/types.h>

typedef struct {
    u8  _pad[0x10];
    u32 field_10;     /* offset 0x10 */
    u8  _tail[0x868 - 0x10 - 4];   /* stride 0x868 */
} Slot;

extern Slot data_ov002_022cf16c[];
extern void func_ov002_02253458(int a0, int b, int i);

void func_ov002_02248434(int a0)
{
    Slot *sel = &data_ov002_022cf16c[a0 & 1];
    int i;
    for (i = 0; (u32)i < sel->field_10 && i < 5; i++) {
        func_ov002_02253458(a0, 13, i);
    }
}
