/* CAMPAIGN-PREP candidate for func_021c9a08 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     switch 0xb..0xf accessors via (arg0&1)*0x868; default bit-band &0x1FFF; source order=block order
 *   risk:       reshape-able: case bodies must lay out 0xc,0xd,0xe,0xf,0xb,default to match orig addresses (.L_1a0<.L_200) — if mwcc sorts by value the table indices stay but body order flips; the case-0xb mul (and r0,#1;mul) vs default mla parity index is the only codegen variance.
 *   confidence: med
 */
/* func_ov002_021c9a08 (ov002, class D, MED) — switch(arg1) cases 0xb..0xf.
 * Five near-identical accessors load *(int*)(LITn + (arg0&1)*0x868); the
 * default (.L_218) reads bit-band (word & 0x1FFF)!=0 at a 0x14-stride record.
 * NOTE case order follows orig block layout: 0xc,0xd,0xe,0xf,0xb,default. */
extern unsigned char data_ov002_022cf16c[];
extern unsigned char data_ov002_022cf178[];
extern unsigned char data_ov002_022cf17c[];
extern unsigned char data_ov002_022cf180[];
extern unsigned char data_ov002_022cf184[];
extern unsigned char data_ov002_022cf188[];

int func_ov002_021c9a08(int arg0, int arg1) {
    switch (arg1) {
    case 0xc:
        return *(int *)(data_ov002_022cf184 + (arg0 & 1) * 0x868);
    case 0xd:
        return *(int *)(data_ov002_022cf17c + (arg0 & 1) * 0x868);
    case 0xe:
        return *(int *)(data_ov002_022cf180 + (arg0 & 1) * 0x868);
    case 0xf:
        return *(int *)(data_ov002_022cf188 + (arg0 & 1) * 0x868);
    case 0xb:
        return *(int *)(data_ov002_022cf178 + (arg0 & 1) * 0x868);
    default:
        return (*(unsigned int *)(data_ov002_022cf16c + (arg0 & 1) * 0x868
                                  + arg1 * 0x14 + 0x30) & 0x1FFF) != 0;
    }
}
