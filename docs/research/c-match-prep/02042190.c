/* CAMPAIGN-PREP candidate for func_02042190 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     reload-per-use global (3 separate ldr); store arg0 at +0x1000; two calls
 *   risk:       data_0219d9f0 must RELOAD each ref (do NOT bind) — written as 3 refs; 0x11dc is a reused pool word; arg0 store width
 *   confidence: high
 */
#include "types.h"

extern char *data_0219d9f0;
extern void func_02092748(void *p);
extern void func_020927b8(void *p);

void func_02042190(void *arg0)
{
    func_020927b8(data_0219d9f0 + 0x11dc);
    *(void **)(data_0219d9f0 + 0x1000) = arg0;
    func_02092748(data_0219d9f0 + 0x11dc);
}
