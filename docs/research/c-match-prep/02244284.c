/* CAMPAIGN-PREP candidate for func_02244284 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     reload field_14 each call (bind-vs-reload) + guard chain + two tail calls
 *   risk:       speculative arg setup (mov r0,r5;mov r1,r4 before bne) is mwcc scheduling - should match; field_14 type guessed
 *   confidence: high
 */
#include <nitro/types.h>

typedef struct {
    u8   _pad[0x14];
    void *field_14;   /* offset 0x14 */
} Card;

extern int func_0202b878(void *p);
extern int func_ov002_021ff400(Card *p);
extern int func_ov002_0223f684(Card *p, int a1);
extern int func_ov002_0223fa20(Card *p, int a1);

int func_ov002_02244284(Card *p, int a1)
{
    if (func_0202b878(p->field_14) == 0x16)
        return 1;
    if (func_0202b878(p->field_14) == 0x17)
        return func_ov002_0223f684(p, a1);
    if (func_ov002_021ff400(p) == 0)
        return 1;
    return func_ov002_0223fa20(p, a1);
}
