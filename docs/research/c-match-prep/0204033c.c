/* CAMPAIGN-PREP candidate for func_0204033c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     bind global once (single ldr reused); +0x1000 guard; tail call
 *   risk:       data_0219d9d4 must be a held base (one ldr, reused) — bound; field 0x384 type/sign; 0x1318 pool word should survive as literal
 *   confidence: med
 */
#include "types.h"

extern char *data_0219d9d4;
extern void func_02091af4(void *p);

void func_0204033c(void)
{
    char *b = data_0219d9d4;
    if (*(int *)(b + 0x1000 + 0x384) == 0) {
        return;
    }
    func_02091af4(b + 0x1318);
}
