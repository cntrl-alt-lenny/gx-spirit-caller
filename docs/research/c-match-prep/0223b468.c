/* CAMPAIGN-PREP candidate for func_0223b468 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     sparse switch returning constants (cmp chain) + guard + ?: as movne/moveq
 *   risk:       switch vs if-chain may change block layout; sparse-case compare order; field_6 offset/type guessed
 *   confidence: med
 */
#include <nitro/types.h>

typedef struct {
    u16 id;        /* offset 0x0 */
    u16 _u2;
    u16 _u4;
    u16 field_6;   /* offset 0x6 */
} ScanEntry;

extern ScanEntry *func_ov002_0223b3cc(int key);

int func_ov002_0223b468(int key)
{
    ScanEntry *e;
    switch (key) {
    case 0x157e: return 5;
    case 0x19ef: return 4;
    }
    e = func_ov002_0223b3cc(key);
    if (e == 0)
        return 0;
    if (e->field_6 != 0)
        return 3;
    return 2;
}
