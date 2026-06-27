/* CAMPAIGN-PREP candidate for func_020a5a94 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D/C: mla base+b2*stride; word|(1<<b2) word-first; G reloaded; stride read-once
 *   risk:       permuter-class: orig recomputes i*0x20 inline for the memcpy ptr yet HOLDS a separate copy (r5) across both bl for the return; mwcc CSE may collapse to one reg -> add r,r,r5 vs add r,r,lsl#5.
 *   confidence: low
 */
/* func_020a5a94: memcpy a row, set bit b2 in a per-row mask word, gated commit.
 * obj->b2 (u8@+2); G=data_021a9924 (reloaded across both calls); H stride@0,count@4.
 * src = G + (idx-1)*0x20 + b2*stride (mla); size = stride. (class D, store-order) */
extern char *data_021a9924;
extern struct { int stride; int count; } data_021a9928;
extern void func_02094688(int dst, int src, int size);
extern int  func_020a5a34(int idx);

int func_020a5a94(unsigned char *obj, int idx) {
    int b2;
    int i;
    int stride;
    int *wp;

    if (data_021a9924 == 0)
        return 0;
    b2 = obj[2];
    if (b2 > data_021a9928.count)
        return 0;

    i = idx - 1;
    stride = data_021a9928.stride;
    func_02094688((int)(obj + 3),
                  (int)(data_021a9924 + i * 0x20 + b2 * stride),
                  stride);

    wp = (int *)(data_021a9924 + 0x1e0 + i * 4);
    *wp |= 1 << b2;

    if (func_020a5a34(idx) != 0)
        return (int)(data_021a9924 + i * 0x20);
    return 0;
}
