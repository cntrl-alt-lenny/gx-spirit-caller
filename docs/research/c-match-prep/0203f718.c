/* CAMPAIGN-PREP candidate for func_0203f718 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     trivial two-call wrapper; stack buffer; arg pass-through
 *   risk:       frame size 0x18 fixed; if mwcc rounds the single 0x18 buf differently the sub-sp imm shifts
 *   confidence: high
 */
#include "types.h"

extern void func_0203f544(void *p, void *arg1);
extern void func_0203f590(void *arg0, void *out);

void func_0203f718(void *arg0, void *arg1)
{
    u8 buf[0x18];
    func_0203f590(arg0, &buf[0]);
    func_0203f544(&buf[0], arg1);
}
