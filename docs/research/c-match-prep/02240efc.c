/* CAMPAIGN-PREP candidate for func_02240efc (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard (a2>=5) + guard (a1 != result&0xff) + tail call
 *   risk:       minimal; arg-save register assignment to r4/r5/r6 should match; signedness of a2>=5 compare
 *   confidence: high
 */
#include <nitro/types.h>

typedef struct Card Card;

extern int func_ov002_0223de94(Card *p, int i);
extern int func_ov002_022018cc(Card *p, int a1, int a2);

int func_ov002_02240efc(Card *p, int a1, int a2)
{
    if (a2 >= 5)
        return 0;
    if (a1 != (func_ov002_0223de94(p, 0) & 0xff))
        return 0;
    return func_ov002_022018cc(p, a1, a2);
}
