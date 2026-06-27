/* CAMPAIGN-PREP candidate for func_022952dc (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D-bitfield :1/:13 + C avoid-bind shared base, i*0x14 as induction (mla)
 *   risk:       mwcc may not emit induction (r6+=0x14) + mla pair; could compute b0*0x868+i*0x14 differently. reshape-able (loop/index shape).
 *   confidence: med
 */
/* func_ov002_022952dc: counted loop i=0..4 over a bank-indexed table.
 * Each iter: b0 = p->b0 (u16@+2 bit0); index table by bank b0*0x868 + i*0x14;
 * read the :13 field at +0x30. If nonzero, call 0228dbe4(b0, i); if that
 * returns nonzero, return 1. Else return 0.
 * mla = (b0*0x868 + base); i*0x14 is the loop induction (r6 += 0x14). */
extern char data_ov002_022cf16c[];
extern int  func_ov002_0228dbe4(int b0, int i);

struct Ov002Hdr1 { char _p2[2]; unsigned short b0 : 1; };
struct Ov002Bank1 { char _p30[0x30]; unsigned int f30 : 13; };

int func_ov002_022952dc(struct Ov002Hdr1 *p) {
    int i;
    int b0;

    for (i = 0; i <= 4; i++) {
        b0 = p->b0;
        if (((struct Ov002Bank1 *)(data_ov002_022cf16c + b0 * 0x868 + i * 0x14))->f30) {
            if (func_ov002_0228dbe4(b0, i))
                return 1;
        }
    }
    return 0;
}
