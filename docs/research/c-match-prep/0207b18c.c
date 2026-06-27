/* CAMPAIGN-PREP candidate for func_0207b18c (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     %13 -> smull magic (0x4ec4ec4f,asr#2,+sign,sub); u16 ret via (short) cast
 *   risk:       orig holds `1` in a reg (r6) for `mov ip,r6,lsl ip` across the loop and uses identical magic-div TWICE (in-loop %13 and recomputed exit %13). mwcc must CSE/emit both magic blocks the same. reshape-able (it is literal `%13`); div-block scheduling is the wobble.
 *   confidence: med
 */
/* func_0207b18c: scan for a free slot in a 13-bit mask, return slot id (1..13).
 * r0=start. Global bitmask = *(u32*)(data_021a088c + 0x2000 + 0x264).
 * loop: x from start; bit = 1 << ((x % 13) + 1); if (mask & bit)==0 keep scanning,
 *       counter r3++ until 13. On hit (or after 13), recompute ((start+r3)%13)+1.
 * 0x4ec4ec4f / asr#2 magic = /13 ; subtract back for %13.
 */
extern char *data_021a088c;

unsigned short func_0207b18c(int start) {
    unsigned int mask = *(unsigned int *)(data_021a088c + 0x2000 + 0x264);
    int count = 0;
    int x = start;

    while (count < 0xd) {
        if (mask & (1u << ((x % 13) + 1))) break;
        count++;
        x++;
    }
    return (unsigned short)(((start + count) % 13) + 1);
}
