/* CAMPAIGN-PREP candidate for func_0227e7e8 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     counted loop reloaded unsigned bound; cdc88[i] :13 field; guard-chain continue; lit-0 arg
 *   risk:       orig dedicates r8 to literal 0 across the loop for 022815a4's 2nd arg; mwcc likely inlines `mov r1,#0` => that one call's arg reg diverges. permuter-class
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_0227e7e8 (ov002, class D, MED tier) — brief 0080.
 * UNVERIFIED + ITERATION-EXPECTED. Struct layout confirmed vs siblings 021ae514/02281b5c.
 *   recipe:     counted loop, reloaded unsigned bound row[+0xc]; idarr[i] :13 field; guard-chain continues; literal 0 arg
 *   confidence: med
 */
/* func_ov002_0227e7e8 (cls D) — for i<cdc78.count (reloaded each iter):
 * if 0227e76c(i) skip; fld=cdc88[i].id (:13); if 02281994(a,fld) skip;
 * if 022815a4(fld,0) return i; if 0202b9b0(fld)<3 return i. else -1. */

extern struct { char _pad[0xc]; unsigned int count; } data_ov002_022cdc78;
extern struct { unsigned int id : 13; } data_ov002_022cdc88[];
extern int func_ov002_0227e76c(int i);
extern int func_ov002_02281994(int a, int id);
extern int func_ov002_022815a4(int id, int z);
extern int func_0202b9b0(int id);

int func_ov002_0227e7e8(int a) {
    int i;
    for (i = 0; (unsigned)i < data_ov002_022cdc78.count; i++) {
        int id;
        if (func_ov002_0227e76c(i) != 0)
            continue;
        id = data_ov002_022cdc88[i].id;
        if (func_ov002_02281994(a, id) != 0)
            continue;
        if (func_ov002_022815a4(id, 0) != 0)
            return i;
        if (func_0202b9b0(id) < 3)
            return i;
    }
    return -1;
}
