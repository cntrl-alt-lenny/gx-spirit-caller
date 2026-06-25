/* CAMPAIGN-PREP candidate for func_021d641c (ov004, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     base+212 field-pool scan loop + early-return index
 *   risk:       KNOWN WALL (header brief 318 'base+212 pool 021d641c'): two-step add base+0xd4 then +0x3c00 is a field-pool reg quirk mwcc folds to one add
 *   confidence: low
 */
/* func_ov004_021d641c: scan up to 0x3c entries of the f228 array (stride 0x54)
 * against the b500+0xd4+0x3c00 record via 02052cdc; return the first matching
 * index, else -1. */
#include "ov004_core.h"
extern int func_02052cdc(void *rec, void *entry);

int func_ov004_021d641c(void) {
    char *rec = data_ov004_0220b500 + 0xd4;
    char *entry = data_ov004_0220f228;
    int i = 0;
    do {
        if (func_02052cdc(rec + 0x3c00, entry) != 0) return i;
        entry += 0x54;
    } while (++i < 0x3c);
    return -1;
}
