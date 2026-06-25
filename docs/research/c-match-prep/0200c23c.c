/* CAMPAIGN-PREP candidate for func_0200c23c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     indexed find-slot loop + if-guards; pointer-arith addressing
 *   risk:       ip-counter reg choice or the lsl#4 base-add vs struct-index addressing may differ; full=8 sentinel must stay int
 *   confidence: med
 */
/* func_0200c23c: scan 8 slots (stride 0x10) for a free (key<0) or
 * matching (key==id) entry; on success commit val@0x1e4, key@0x1e8
 * and return 1; if the table is full return 0. Leaf. */

int func_0200c23c(char *o, int id, int val) {
    int i = 0;
    do {
        int key = *(int *)(o + (i << 4) + 0x1e8);
        if (key < 0) break;
        if (id == key) break;
        i++;
    } while (i < 8);
    if (i == 8) return 0;
    *(int *)(o + (i << 4) + 0x1e4) = val;
    *(int *)(o + (i << 4) + 0x1e8) = id;
    return 1;
}
