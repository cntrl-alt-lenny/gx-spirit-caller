/* CAMPAIGN-PREP candidate for func_02041ea0 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     ldrb guard ==0xff; +0x1000 fields recomputed off param; guard + tail call
 *   risk:       base param held in r4 with +0x1000/+offsets recomputed each use (not bound) — matches asm; 0x1bf4/0x1b34 pool words
 *   confidence: high
 */
#include "types.h"

extern void func_02091af4(void *p);
extern void func_02092748(void *p);
extern void func_020927b8(void *p);

void func_02041ea0(char *base)
{
    if (*(u8 *)(base + 0x1000) != 0xff) {
        return;
    }
    func_020927b8(base + 0x1bf4);
    *(int *)(base + 0x1000 + 0xc0c) = 1;
    func_02092748(base + 0x1bf4);
    if (*(int *)(base + 0x1000 + 0xba0) == 0) {
        return;
    }
    func_02091af4(base + 0x1b34);
}
