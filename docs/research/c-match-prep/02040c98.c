/* CAMPAIGN-PREP candidate for func_02040c98 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     trivial stack-buffer two-call wrapper; arg0 held in r4
 *   risk:       frame 0x18 fixed; arg0 saved to callee-saved before first call — natural; buf size guessed
 *   confidence: high
 */
#include "types.h"

extern void func_020409d8(void *arg0, void *buf);
extern void func_02044610(void *buf);

void func_02040c98(void *arg0)
{
    u8 buf[0x18];
    func_02044610(&buf[0]);
    func_020409d8(arg0, &buf[0]);
}
