/* CAMPAIGN-PREP candidate for func_02021660 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Search loop: running-pointer access + separate bound index
 *   risk:       reg-alloc of matched/index/pointer may differ; mwcc could index e[i] instead of incrementing e, or reorder the add lr,#0xc
 *   confidence: med
 */
/* func_02021660: search array of {key, value, pad} (stride 0xc) at
 * p+0x18, length p->count (offset 0x14). Return the value of the
 * n-th entry whose key == arg key, else 0. Uses a running element
 * pointer (e) for access and a separate index (i) for the bound,
 * matching the asm's lr + r3 split. */
int func_02021660(char *p, int key, int n) {
    int count = *(int *)(p + 0x14);
    int matched = 0;
    int i;
    int *e = (int *)(p + 0x18);
    for (i = 0; i < count; i++) {
        if (e[0] == key) {
            if (matched == n) return e[1];
            matched++;
        }
        e += 3;   /* stride 0xc */
    }
    return 0;
}
