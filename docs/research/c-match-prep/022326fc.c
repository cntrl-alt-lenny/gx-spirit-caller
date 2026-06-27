/* CAMPAIGN-PREP candidate for func_022326fc (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bitfield-shift decode; parallel parity*0x868 tables; rsb-as-unary-negate; store-order
 *   risk:       struct-guessed: three parallel table bases (cf16c/cf1a4/cf1a8) and the parity*0x868 stride are inferred from disasm; if real layout is one struct the index math diverges.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_022326fc (ov002, class D) - brief 494.
 * UNVERIFIED build-free draft. Cleanest canonical decode: parity=f2&1,
 * slot=(f2>>1)&0x1f, A=(f4>>6)&0x1ff; three PARALLEL parity*0x868-strided tables
 * (cf16c rec +0x30, cf1a4 guard u16, cf1a8 val int); negate val -> 021d93e0.
 */
typedef unsigned short u16;

extern char data_ov002_022cf16c[];   /* record table, +0x30 (int)        */
extern char data_ov002_022cf1a4[];   /* guard  table (u16)               */
extern char data_ov002_022cf1a8[];   /* value  table (int)              */
extern void func_ov002_021d93e0(int negval);
extern int  func_ov002_0220e594(void);

int func_ov002_022326fc(char *obj) {
    u16 f2, f4;
    int parity, slot, rec, A, B;

    if (func_ov002_0220e594() == 0)
        return 0;
    f2 = *(u16 *)(obj + 2);
    f4 = *(u16 *)(obj + 4);
    parity = (f2 << 0x1f) >> 0x1f;
    slot = (f2 << 0x1a) >> 0x1b;
    rec = *(int *)(data_ov002_022cf16c + parity * 0x868 + 0x30 + slot * 0x14);
    A = (f4 << 0x11) >> 0x17;
    B = ((rec << 2) >> 0x18) * 2 + ((rec << 0x12) >> 0x1f);
    if (A != B)
        return 0;
    if (*(u16 *)(data_ov002_022cf1a4 + parity * 0x868 + slot * 0x14) == 0)
        return 0;
    func_ov002_021d93e0(-*(int *)(data_ov002_022cf1a8 + parity * 0x868 + slot * 0x14));
    return 0;
}
