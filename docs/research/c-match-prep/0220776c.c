/* CAMPAIGN-PREP candidate for func_0220776c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: default-first if/else-if const-select for thr; bit0 table-select; unsigned >= 
 *   risk:       reshape-able: the thr equality chain — orig reuses 0x14f0 then adds 0x1ec for the 2nd compare; if mwcc materializes 0x16dc as a fresh literal the constant pool/encoding diverges. Keep else-if order. Also struct-guessed.
 *   confidence: med
 */
/* func_ov002_0220776c (ov002, cls D): id-based threshold select, then bit0 table
 * compare. STRUCT/TABLE GUESSED. id=u16@+0 (offset 0, not +2). thr default 1;
 * id==0x14f0 -> thr=0xf; else id==0x16dc(0x14f0+0x1ec) -> thr=0x1e. Then v=u16@+2,
 * sel=bit0, val=*(int*)(cf180+sel*0x868); return (val>=thr unsigned)?1:0. Keep the
 * default-first if/else-if order so thr's mov/branch layout matches (movcs/movcc). */
struct Ent { unsigned short id; unsigned short f2; };
extern char data_ov002_022cf180[];

int func_ov002_0220776c(struct Ent *c) {
    unsigned short id;
    unsigned short v;
    int sel;
    int thr;
    id  = c->id;
    thr = 1;
    if (id == 0x14f0)
        thr = 0xf;
    else if (id == 0x16dc)
        thr = 0x1e;
    v   = c->f2;
    sel = ((unsigned)(v << 0x1f) >> 0x1f) & 1;
    if ((unsigned)*(int *)(data_ov002_022cf180 + sel * 0x868) >= (unsigned)thr)
        return 1;
    return 0;
}
