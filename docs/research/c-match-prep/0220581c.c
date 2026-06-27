/* CAMPAIGN-PREP candidate for func_0220581c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bit0&1 table gate (cf. 02205508); lr-held f2 (bit0+tag6 one read); || short-circuit; shared ret 1
 *   risk:       reshape-able: the || (021ff2c8 then 021bbeac) must keep bne-to-L_68 short-circuit ordering. If mwcc reloads [self,#2] (orig holds lr for bit0+tag6) a ldrh diverges; flip to two locals if so.
 *   confidence: med
 */
/* func_ov002_0220581c: cls D — table[bit0&1]!=0 gate; if tag6!=0x23 a guard chain.
 * (021ff2c8() || 021bbeac(bit0)) -> require 021ca63c(bit0,1)!=0; else fall to ret 1.
 * f2 [self,#2] held live (lr): bit0 + tag6 from one read. index bit0&1. */
typedef unsigned short u16;
struct F2_0581c { u16 bit0:1; u16 pad:5; u16 tag6:6; u16 rest:4; };
struct S0581c { u16 f0; struct F2_0581c f2; };
extern char data_ov002_022cf17c[];
extern int func_ov002_021ff2c8(void);
extern int func_ov002_021bbeac(int bit0);
extern int func_ov002_021ca63c(int bit0, int one);
int func_ov002_0220581c(struct S0581c *self) {
    if (*(int *)(data_ov002_022cf17c + (self->f2.bit0 & 1) * 0x868) == 0) return 0;
    if (self->f2.tag6 != 0x23) {
        if (func_ov002_021ff2c8() != 0 || func_ov002_021bbeac(self->f2.bit0) != 0) {
            if (func_ov002_021ca63c(self->f2.bit0, 1) == 0) return 0;
        }
    }
    return 1;
}
