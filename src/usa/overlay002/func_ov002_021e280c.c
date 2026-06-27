/* CAMPAIGN-PREP candidate for func_021e28fc (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     u16-narrow trampoline; constant-kind arg-pack tail-call
 *   risk:       low; only the ldr-pool dispatcher reloc and the lsl#16;lsr#16 narrow could vary
 *   confidence: high
 */
/* func_ov002_021e280c: arg-pack tail-call trampoline -> func_021d479c(0x59,
 * (u16)arg0, 0, 0). Constant kind in r0, narrowed arg0 as 2nd param. */
#include "ov002_core.h"
int func_ov002_021e280c(int arg0) {
    return func_ov002_021d46ac(0x59, (u16)arg0, 0, 0);
}
