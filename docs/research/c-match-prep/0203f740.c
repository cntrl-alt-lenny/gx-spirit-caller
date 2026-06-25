/* CAMPAIGN-PREP candidate for func_0203f740 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     stack-buffer; compare returning bool 1/0 (moveq/movne)
 *   risk:       frame 0x1c vs 0x18 in siblings — buf size guessed; eq->1/ne->0 order must match (==0 form chosen)
 *   confidence: high
 */
#include "types.h"

extern u8 data_020fe550[8];
extern void func_0203f590(void *arg0, void *out);
extern int func_020a7440(void *a, void *b, int n);

int func_0203f740(void *arg0)
{
    u8 buf[0x1c];
    func_0203f590(arg0, &buf[0]);
    if (func_020a7440(&buf[0], data_020fe550, 8) == 0) {
        return 1;
    }
    return 0;
}
