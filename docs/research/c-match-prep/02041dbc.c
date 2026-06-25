/* CAMPAIGN-PREP candidate for func_02041dbc (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     memset call; bind base+0x1000 once (held in r1); store-order fields; reload 0x1134 twice
 *   risk:       0xb68/0x5ea ride pool words (LIT1/LIT2) — must stay literal; base+0x1134 reloaded not bound; store order exact
 *   confidence: high
 */
#include "types.h"

extern void func_02071028(void *p);
extern void func_020945f4(void *dst, int val, int n);

void func_02041dbc(char *base)
{
    int *b;
    func_020945f4(base + 0x1134, 0, 0x64);
    b = (int *)(base + 0x1000);
    b[0x170 / 4] = 0xb68;
    b[0x174 / 4] = b[0x9c8 / 4];
    b[0x17c / 4] = 0x5ea;
    b[0x180 / 4] = b[0x9cc / 4];
    func_02071028(base + 0x1134);
}
