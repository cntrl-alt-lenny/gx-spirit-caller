/* CAMPAIGN-PREP candidate for func_02207984 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: if-assign match (moveq#1/movne#0), match*0x38 mul index, ==const result
 *   risk:       reshape-able: match as if-assign vs ternary controls the moveq/movne pair; mwcc could instead branch. Risk the equality-to-int->mul folds to a different reg. Also struct-guessed offsets (cd3f4+0x70, cd444 stride 0x38).
 *   confidence: med
 */
/* func_ov002_02207984 (ov002, cls D): bitfield gate, equality -> {0,1} index *0x38,
 * final compare. STRUCT/TABLE GUESSED. v=u16@+2: type6==0x16 else ->0. w=u32@+0x14.
 * match = (*(int*)(cd3f4+0x70) == (w & 0x1ff)). idx=match*0x38 (mul, not pow2).
 * return *(int*)(cd444+idx)==0xa. The w&0x1ff comes from (w<<0x17)>>0x17 (mask
 * 0x1ff unencodable -> shift pair); match materialized as moveq#1/movne#0. */
struct Ent { char _0[2]; unsigned short f2; char _4[0x10]; unsigned int f14; };
extern char data_ov002_022cd3f4[];
extern char data_ov002_022cd444[];

int func_ov002_02207984(struct Ent *c) {
    unsigned int w;
    int match;
    if (((c->f2 << 0x14) >> 0x1a) != 0x16)
        return 0;
    w = c->f14;
    if (*(int *)(data_ov002_022cd3f4 + 0x70) == (int)((w << 0x17) >> 0x17))
        match = 1;
    else
        match = 0;
    return *(int *)(data_ov002_022cd444 + match * 0x38) == 0xa;
}
