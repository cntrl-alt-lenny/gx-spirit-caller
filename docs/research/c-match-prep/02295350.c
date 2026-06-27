/* CAMPAIGN-PREP candidate for func_02295350 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Same as 022952dc clone: D-bitfield :1/:13, induction i*0x14, mla base
 *   risk:       Identical codegen risk to 022952dc (its clone): induction+mla pairing. If 022952dc matches, this matches with same C. reshape-able.
 *   confidence: med
 */
/* func_ov002_02295350: byte-exact clone of 022952dc, only the inner callee
 * differs (0228dd84 vs 0228dbe4). Counted loop i=0..4 over a bank-indexed
 * table; index = b0*0x868 + i*0x14; read :13 field at +0x30; if nonzero call
 * 0228dd84(b0, i) and return 1 if it returns nonzero. Else return 0. */
extern char data_ov002_022cf16c[];
extern int  func_ov002_0228dd84(int b0, int i);

struct Ov002Hdr1 { char _p2[2]; unsigned short b0 : 1; };
struct Ov002Bank1 { char _p30[0x30]; unsigned int f30 : 13; };

int func_ov002_02295350(struct Ov002Hdr1 *p) {
    int i;
    int b0;

    for (i = 0; i <= 4; i++) {
        b0 = p->b0;
        if (((struct Ov002Bank1 *)(data_ov002_022cf16c + b0 * 0x868 + i * 0x14))->f30) {
            if (func_ov002_0228dd84(b0, i))
                return 1;
        }
    }
    return 0;
}
