/* CAMPAIGN-PREP candidate for func_02207528 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: bind sel*0x868 index once, reuse for 3 byte-offset table bases; unsigned cmps
 *   risk:       reshape-able: if mwcc recomputes sel*0x868 per access instead of binding off, extra mul/mov appear; binding off mirrors the single asm mul. Also struct-guessed bases.
 *   confidence: med
 */
/* func_ov002_02207528 (ov002, cls D): leaf, two-element struct table selected by
 * bit0, branch chain. STRUCT/TABLE GUESSED. v=u16@+2, sel=bit0. Index off=sel*0x868
 * (mul, computed once, reused for 3 bases). a=cf17c[off],c=cf188[off],d=cf180[off]
 * (three int fields 4/0xc bytes apart in a 0x868-stride struct). Logic: a<2(unsigned)
 * ->0; type6==0x23 ->1; (c>=4 && d==0) ->1; else 0. */
struct Ent { char _0[2]; unsigned short f2; };
extern char data_ov002_022cf17c[];
extern char data_ov002_022cf180[];
extern char data_ov002_022cf188[];

int func_ov002_02207528(struct Ent *c) {
    unsigned short v;
    int sel;
    int off;
    v   = c->f2;
    sel = ((unsigned)(v << 0x1f) >> 0x1f) & 1;
    off = sel * 0x868;
    if ((unsigned)*(int *)(data_ov002_022cf17c + off) < 2)
        return 0;
    if (((v << 0x14) >> 0x1a) == 0x23)
        return 1;
    if ((unsigned)*(int *)(data_ov002_022cf188 + off) >= 4 &&
        *(int *)(data_ov002_022cf180 + off) == 0)
        return 1;
    return 0;
}
