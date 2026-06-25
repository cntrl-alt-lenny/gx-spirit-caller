/* CAMPAIGN-PREP candidate for func_02249e84 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     mla base + fixed-3 loop + halfword load (ldrh), arg-c order
 *   risk:       mwcc may precompute base+0x1da2 (single ldr) instead of re-adding #0x1d00/#0xa2 per-iter; constant-split order uncertain
 *   confidence: low
 */
/* func_ov002_02249e84: fixed 3-iteration scan; passes halfword at data+0x1da2+i*2 as arg c. */

extern void func_ov002_02253458(int a, int b, int c);
extern char data_ov002_022cf16c[];

void func_ov002_02249e84(int idx) {
    int x = 1 - idx;
    int i;

    for (i = 0; i < 3; i++)
        func_ov002_02253458(
            x, 11,
            *(unsigned short *)(data_ov002_022cf16c + 0x1d00 + 0xa2 + i * 2));
}
