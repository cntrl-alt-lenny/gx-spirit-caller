/* CAMPAIGN-PREP candidate for func_0222cc50 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     reload f2 twice (orig has two ldrh); orr bit0|(field5<<8) accumulator-first
 *   risk:       orig reloads [self+2] twice into r2 and r1 (two ldrh) before the orr; if mwcc CSEs the halfword load to one ldrh, one load diverges. reshape-able (read self->f2 via two separate *(u16*)expressions to force both ldrh).
 *   confidence: med
 */
/* func_ov002_0222cc50: if global d-flag(+0x5a8)!=1 tail 02211b64(self); else
 * pack (f2.bit0 | (f2.field5<<8)) as a u16 and call 021d59cc(bit0, d(+0x5ac),
 * packed, 0x17, 0). */
typedef unsigned short u16;
struct F0222cc50_F2 { u16 bit0:1; u16 field5:5; u16 rest:10; };
extern char data_ov002_022ce288[];
extern void func_ov002_021d59cc(int bit0, int p, int packed, int k, int zero);
extern int  func_ov002_02211b64(void *self);

int func_ov002_0222cc50(struct F0222cc50_F2 *self) {
    if (*(int *)(data_ov002_022ce288 + 0x5a8) != 1)
        return func_ov002_02211b64(self);
    {
        int bit0   = self->bit0;
        int packed = (u16)(bit0 | (self->field5 << 8));
        func_ov002_021d59cc(bit0, *(int *)(data_ov002_022ce288 + 0x5ac), packed, 0x17, 0);
    }
    return 0;
}
