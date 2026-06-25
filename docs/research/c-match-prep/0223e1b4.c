/* CAMPAIGN-PREP candidate for func_0223e1b4 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     u16:8 bitfield count (shift pair) + byte-pack (orr non-shifted first) + counted scan
 *   risk:       count bitfield :8 vs and#0xff; guard may add extra pre-check before loop; (u16) cast on packed may fold
 *   confidence: med
 */
#include <nitro/types.h>

typedef struct {
    u8  _pad[6];
    u16 count : 8;   /* offset 0x6, low byte via lsl#24;lsr#24 */
    u16 : 8;
} Card;

extern int func_ov002_0223de94(Card *p, int i);

int func_ov002_0223e1b4(Card *p, int a1, int a2)
{
    int packed;
    int i;
    if (p->count <= 0)
        return 0;
    packed = (u16)(((u8)a1) | (((u8)a2) << 8));
    for (i = 0; i < p->count; i++) {
        if (packed == func_ov002_0223de94(p, i))
            return 1;
    }
    return 0;
}
