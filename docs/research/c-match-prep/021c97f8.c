/* CAMPAIGN-PREP candidate for func_021c97f8 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     switch jump-table cases 0xb..0xf; mla parity*0x868+sum*0x14 index; bind sum
 *   risk:       reshape-able: the in-range default-case body (.L438) must be emitted before the case-0xc..f .L_430 stub; if mwcc orders the empty cases first the jump-table bodies swap. struct-guessed cd3f4 f_0/f_1c offsets.
 *   confidence: med
 */
/* func_ov002_021c97f8 (ov002, class D, MED) — switch(arg1) cases 0xb..0xf.
 * Default case 0xb (.L_438): adds arg1+arg2; if >0xa do a global-compare
 * branch returning a u16 field; else mla-index a per-parity table and load u16.
 * cases 0xc..0xf (.L_430) return 0. */
extern unsigned short data_ov002_022cd4b8[];
extern unsigned short data_ov002_022cd4cc[];
extern unsigned short data_ov002_022cf1a2[];
typedef struct { int f_0; char _a[0x18]; int f_1c; } StateCd3f4;
extern StateCd3f4 data_ov002_022cd3f4;

int func_ov002_021c97f8(int arg0, int arg1, int arg2) {
    switch (arg1) {
    case 0xb: {
        int sum = arg1 + arg2;
        if (sum > 0xa) {
            unsigned short *p;
            if (arg0 == data_ov002_022cd3f4.f_0 && arg1 == data_ov002_022cd3f4.f_1c)
                p = data_ov002_022cd4b8;
            else
                p = data_ov002_022cd4cc;
            return *(unsigned short *)((char *)p + 0x6);
        }
        return *(unsigned short *)((char *)data_ov002_022cf1a2
                                   + (arg0 & 1) * 0x868 + sum * 0x14);
    }
    default:
        return 0;
    }
}
