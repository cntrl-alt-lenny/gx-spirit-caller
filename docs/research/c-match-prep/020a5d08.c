/* CAMPAIGN-PREP candidate for func_020a5d08 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     null-guard early-return + indexed clear via two strides
 *   risk:       data_021a9924 element strides (0x20 array, +0x1e0 int) guessed; confirm offsets
 *   confidence: med
 */
/* func_020a5d08: guard ptr, then clear slot (idx-1). sp2p3 (.legacy.c).
 *
 *   r1 = data_021a9924; if (r1 == 0) return;
 *   r4 = idx - 1;
 *   func_020945f4(r1 + (r4<<5), 0, 0x1e);      ; clear 0x1e bytes of 0x20-stride slot
 *   r0 = data_021a9924; *(int*)(r0 + (r4<<2) + 0x1e0) = 0;
 *
 * data_021a9924 is RELOADED for the second access (separate ref in C). */

extern void func_020945f4(void *dst, int val, int n);

extern char *data_021a9924;   /* base of a 0x20-stride slot array */

void func_020a5d08(int idx) {
    int i = idx - 1;
    if (data_021a9924 == 0) return;
    func_020945f4(data_021a9924 + (i << 5), 0, 0x1e);
    *(int *)(data_021a9924 + (i << 2) + 0x1e0) = 0;
}
