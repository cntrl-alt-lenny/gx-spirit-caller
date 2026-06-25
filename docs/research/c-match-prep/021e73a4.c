/* CAMPAIGN-PREP candidate for func_021e73a4 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard-chain early-return tail-calls; global reload-vs-bind across mid call
 *   risk:       base bind-vs-reload split (held across 0x598/0x5a0, reloaded for 0x490/0x688) may not split there; the movne#1 true-branch
 *   confidence: med
 */
/* func_ov002_021e73a4: flat guard-chain of tail-calls keyed off fields of
 * data_ov002_022ce288. Base is reloaded after the func_0225702c call (which
 * clobbers it) -> a single global ref per use reloads naturally. */
#include "ov002_core.h"

extern int func_ov002_021e3dac(void);
extern int func_ov002_021e4ba8(void);
extern int func_ov002_021e71a4(void);
extern int func_ov002_022465d4(void);
extern int func_ov002_0225702c(void);

int func_ov002_021e73a4(void) {
    if (*(int *)(data_ov002_022ce288 + 0x598) != 0)
        return func_ov002_021e3dac();
    if (*(int *)(data_ov002_022ce288 + 0x5a0) != 0)
        return func_ov002_021e4ba8();
    if (func_ov002_0225702c() != 0)
        return 1;
    if (*(int *)(data_ov002_022ce288 + 0x490) != 0)
        return func_ov002_021e71a4();
    if (*(int *)(data_ov002_022ce288 + 0x688) == 0)
        return 0;
    return func_ov002_022465d4();
}
