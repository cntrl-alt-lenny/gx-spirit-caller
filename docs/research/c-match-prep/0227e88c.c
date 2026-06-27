/* CAMPAIGN-PREP candidate for func_0227e88c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     counted loop reloaded unsigned bound; cdc88[i] :13 field; guard-chain; return i on <=1
 *   risk:       bound row[+0xc] reloaded each iter via global; if mwcc hoists `count` into a reg the bottom `ldr;cmp` diverges. Also :13 must give lsl#19;lsr#19 not `and`. reshape-able
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_0227e88c (ov002, class D, MED tier) — brief 0080.
 * UNVERIFIED + ITERATION-EXPECTED. Simpler clone of 0227e7e8; struct confirmed vs siblings.
 *   recipe:     counted loop, reloaded unsigned bound; cdc88[i] :13 field; guard-chain; return i when 0202b9b0<=1
 *   confidence: med
 */
/* func_ov002_0227e88c (cls D) — for i<cdc78.count (reloaded): if 0227e76c(i)
 * skip; fld=cdc88[i].id (:13); if 02281994(a,fld) skip; if 0202b9b0(fld)<=1
 * return i. else -1. */

extern struct { char _pad[0xc]; unsigned int count; } data_ov002_022cdc78;
extern struct { unsigned int id : 13; } data_ov002_022cdc88[];
extern int func_ov002_0227e76c(int i);
extern int func_ov002_02281994(int a, int id);
extern int func_0202b9b0(int id);

int func_ov002_0227e88c(int a) {
    int i;
    for (i = 0; (unsigned)i < data_ov002_022cdc78.count; i++) {
        int id;
        if (func_ov002_0227e76c(i) != 0)
            continue;
        id = data_ov002_022cdc88[i].id;
        if (func_ov002_02281994(a, id) != 0)
            continue;
        if (func_0202b9b0(id) <= 1)
            return i;
    }
    return -1;
}
