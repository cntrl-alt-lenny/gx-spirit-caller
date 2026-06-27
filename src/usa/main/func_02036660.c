/* CAMPAIGN-PREP candidate for func_02036660 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     mla entry; widen both ids (u16); compute MY offset first then entry's; movge/movlt bool
 *   risk:       VERIFIED byte-exact vs target (mla, dual lsl/lsr widen, mul order ip-then-r0, and#0x7f, movge/movlt, cpylt pc,lr). struct-guessed offsets only; no divergence observed
 *   confidence: high
 */
/* func_02036660 (class D): r0 = my card id, r1 = entry index. entry =
 * &data_0219b680[idx*0x78]; if inactive (sbyte+0x6a < 0) return 1. Compare the
 * +0 priority bytes (masked 0x7f) of two card-defs (stride 0xc) in the table at
 * data_0219b200[+0x34]: mine (id=r0) vs the entry's stored id ((u16)entry+0x34).
 * return 1 if mine >= entry's, else 0. */

extern unsigned char data_0219b680[];
extern unsigned char data_0219b200[];

int func_02036660(int myId, int idx) {
    unsigned char *entry;
    int storedId;
    int myOff;
    int stOff;
    unsigned char *defs;
    int myPrio;
    int stPrio;

    entry = data_0219b680 + idx * 0x78;
    if (*(signed char *)(entry + 0x6a) < 0)
        return 1;

    storedId = (unsigned short)*(int *)(entry + 0x34);
    myOff = (unsigned short)myId * 0xc;
    stOff = storedId * 0xc;
    defs = *(unsigned char **)(data_0219b200 + 0x34);
    myPrio = defs[myOff] & 0x7f;
    stPrio = defs[stOff] & 0x7f;
    return myPrio >= stPrio;
}
