/* CAMPAIGN-PREP candidate for func_02040d54 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard chain (movs/moveq, cmp/movge) + tail call returning bool
 *   risk:       arg3 must be signed for the movge (>= signed); h held in r4 across calls; movs-on-call-result idiom
 *   confidence: high
 */
#include "types.h"

extern void *func_02040de8(void *arg0, void *arg1);
extern int func_020aaddc(void);
extern void func_020aadf8(void *arg2, void *h);

int func_02040d54(void *arg0, void *arg1, void *arg2, int arg3)
{
    void *h = func_02040de8(arg0, arg1);
    if (h == 0) {
        return 0;
    }
    if (func_020aaddc() >= arg3) {
        return 0;
    }
    func_020aadf8(arg2, h);
    return 1;
}
