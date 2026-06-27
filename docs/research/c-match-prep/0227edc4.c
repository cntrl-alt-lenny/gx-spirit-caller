/* CAMPAIGN-PREP candidate for func_0227edc4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     counted loop reloaded bound; one ldr/entry -> two bitfields (:13,:1); fused && predicated return
 *   risk:       whole `f(i)==0 && f1==b && f2==a` is one fused predicated chain (moveq/cmpeq/ldmeqia) reusing one loaded word; mwcc may instead branch the && and/or reload. reshape-able
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_0227edc4 (ov002, class D, MED tier) — brief 0080.
 * UNVERIFIED + ITERATION-EXPECTED. Struct (:13 + :1 at bit13) confirmed vs siblings.
 *   recipe:     counted loop reloaded bound; one load per entry, two fields (:13,:1); fused && predicated return i
 *   confidence: med
 */
/* func_ov002_0227edc4 (cls D) — for i<cdc78.count (reloaded): if 0227e76c(i)==0
 * && cdc88[i].f1(:13)==b && cdc88[i].f2(bit13,:1)==a return i. else -1.
 * Both fields come from ONE ldr of cdc88[i]; compares are arg-vs-field. */

extern struct { char _pad[0xc]; unsigned int count; } data_ov002_022cdc78;
extern struct { unsigned int f1 : 13; unsigned int f2 : 1; } data_ov002_022cdc88[];
extern int func_ov002_0227e76c(int i);

int func_ov002_0227edc4(int a, int b) {
    int i;
    for (i = 0; (unsigned)i < data_ov002_022cdc78.count; i++) {
        if (func_ov002_0227e76c(i) == 0
            && data_ov002_022cdc88[i].f1 == b
            && data_ov002_022cdc88[i].f2 == a)
            return i;
    }
    return -1;
}
