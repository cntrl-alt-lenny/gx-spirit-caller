/* CAMPAIGN-PREP candidate for func_022bdb44 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     16-slot loop, guard call, conditional streq-pair clear
 *   risk:       conditional double-store may not fold to streq pair; cursor/zero-reg liveness across loop may flip
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_022bdb44 (ov002, class A).
 *   recipe:  loop over 16 stride-8 slots; if slot.f0 set, call validator and
 *            if it returns 0 clear both words (streq pair) of the slot
 *   risk:    the conditional double-store wants 'if(...==0){f0=0;f4=0;}' to emit
 *            streq pair; r4=zero held across loop, r5 counter, r6 cursor liveness
 *   confidence: med
 */

extern int func_020215d8(int handle);

typedef struct {
    int f0;
    int f4;
} Slot022bdb44;

void func_ov002_022bdb44(Slot022bdb44 *slot)
{
    int i;
    for (i = 0; i < 16; i++) {
        if (slot->f0 != 0) {
            if (func_020215d8(slot->f0) == 0) {
                slot->f0 = 0;
                slot->f4 = 0;
            }
        }
        slot++;
    }
}
