/* CAMPAIGN-PREP candidate for func_0203f6cc (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     stack-buffer; compare guard early-return; tail copy
 *   risk:       the 0x18 frame and buf[0]/buf[8] split may not match mwcc's stack layout exactly; arg0 pass-through
 *   confidence: med
 */
#include "types.h"

extern u8 data_020fe550[8];
extern void func_0203f590(void *arg0, void *out);
extern int func_020a7440(void *a, void *b, int n);
extern void func_02094688(void *dst, void *src, int n);

void func_0203f6cc(void *arg0, void *arg1)
{
    u8 buf[0x18];
    func_0203f590(arg0, &buf[0]);
    if (func_020a7440(&buf[0], data_020fe550, 8) != 0) {
        return;
    }
    func_02094688(&buf[8], arg1, 0xa);
}
