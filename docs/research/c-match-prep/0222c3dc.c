/* CAMPAIGN-PREP candidate for func_0222c3dc (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     early-out f4.b2; reuse idx=bit0*0x868 (mul, shared r3); 13-bit field via shift
 *   risk:       021e276c here gets bit0 directly (no rsb), unlike sibling 1-bit0 funcs; if that arg is really 1-self->f2.bit0 the first call diverges. struct-guessed (bit0 polarity) — reshape-able once polarity confirmed against orig.
 *   confidence: med
 */
/* func_ov002_0222c3dc: notify 021e276c(f2.bit0, f0, 1, 0); then a chain of
 * guards on self->f4 bit2, a per-player(bit0) cf26c row u16, and a 13-bit
 * field at cf16c-row+0xf8 == 0x175e; only if all pass tail 02210104(self,arg). */
typedef unsigned short u16;
struct F0222c3dc_F2 { u16 bit0:1; u16 rest:15; };
struct F0222c3dc_F4 { u16 pad2:2; u16 b2:1; u16 rest:13; };
struct F0222c3dc_Self { u16 f0; struct F0222c3dc_F2 f2; struct F0222c3dc_F4 f4; };
extern char data_ov002_022cf16c[];
extern u16  data_ov002_022cf26c[];
extern void func_ov002_021e276c(int notbit0, int f0, int one, int zero);
extern int  func_ov002_02210104(void *self, int arg);

int func_ov002_0222c3dc(struct F0222c3dc_Self *self, int arg) {
    func_ov002_021e276c(self->f2.bit0, self->f0, 1, 0);
    if (self->f4.b2)
        return 0;
    {
        int idx = (self->f2.bit0 & 1) * 0x868;
        if (*(u16 *)((char *)data_ov002_022cf26c + idx) == 0)
            return 0;
        if ((int)((unsigned)(*(int *)(data_ov002_022cf16c + idx + 0xf8)) << 19 >> 19) != 0x175e)
            return 0;
    }
    return func_ov002_02210104(self, arg);
}
