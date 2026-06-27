/* CAMPAIGN-PREP candidate for func_022075a4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: bit0 table-select gate, then short-circuit OR of two key calls -> 1
 *   risk:       reshape-able: branch/const-select layout — orig collapses the two call results into a shared 'return 1' (.L_60) and 'return 0' (.L_68); if mwcc lays the const moves differently the block order diverges. Also struct-guessed.
 *   confidence: med
 */
/* func_ov002_022075a4 (ov002, cls D): table-select gate + two guard calls.
 * STRUCT/TABLE GUESSED. v=u16@+2, sel=bit0, off=sel*0x868. cf188[off]<2(unsigned)
 * ->0; type6(bits[11:6])==0x23 ->1; func_021bb91c(0x16cb)!=0 ->1; func_021bb91c
 * (0x16e4)!=0 ->1; else 0. Note the calls take only the key (no entity arg). */
struct Ent { char _0[2]; unsigned short f2; };
extern char data_ov002_022cf188[];
extern int  func_ov002_021bb91c(int key);

int func_ov002_022075a4(struct Ent *c) {
    unsigned short v;
    int sel;
    v   = c->f2;
    sel = ((unsigned)(v << 0x1f) >> 0x1f) & 1;
    if ((unsigned)*(int *)(data_ov002_022cf188 + sel * 0x868) < 2)
        return 0;
    if (((v << 0x14) >> 0x1a) == 0x23)
        return 1;
    if (func_ov002_021bb91c(0x16cb) != 0)
        return 1;
    if (func_ov002_021bb91c(0x16e4) != 0)
        return 1;
    return 0;
}
