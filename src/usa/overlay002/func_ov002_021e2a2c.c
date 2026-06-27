/* CAMPAIGN-PREP candidate for func_021e2b1c (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     u16-narrow trampoline; constant-kind arg-pack tail-call
 *   risk:       low; only the ldr-pool dispatcher reloc and the lsl#16;lsr#16 narrow could vary
 *   confidence: high
 */
/* func_ov002_021e2a2c: arg-pack tail-call trampoline -> func_021d479c(0xa,
 * (u16)arg0, 0, 0). Identical shape to 021e28fc, kind 0xa. */
#include "ov002_core.h"
int func_ov002_021e2a2c(int arg0) {
    return func_ov002_021d46ac(0xa, (u16)arg0, 0, 0);
}
