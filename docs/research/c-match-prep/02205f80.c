/* CAMPAIGN-PREP candidate for func_02205f80 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     021ca2b8(b0) gate; unsigned count>0 -> bls; (uint)i<bound -> bcc; bitfield b0
 *   risk:       loop's count read is unsigned (>0 -> bls) and bound compare unsigned (bcc); if mwcc reads count as signed (>0 -> ble) or i<bound signed (blt), 2 branch-cond bytes diverge. reshape-able (cast unsigned).
 *   confidence: med
 */
/* func_ov002_02205f80: 021ca2b8(b0) gate, then the canonical counted
 * helper loop: count0 = T178[player]; for i < T16c[player].f0xc:
 * if 022536e8(f0,i) ret 1. b0 = lsl31;lsr31 bitfield. */
typedef unsigned short u16;
struct F2 { u16 bit0:1; u16 rest:15; };
struct S02205f80 { u16 f0; struct F2 f2; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf178[];
extern int func_ov002_021ca2b8(unsigned int bit);
extern int func_ov002_022536e8(u16 f0, int i);
int func_ov002_02205f80(struct S02205f80 *self) {
    int i;
    if (func_ov002_021ca2b8(self->f2.bit0) == 0) return 0;
    if (*(unsigned int *)(data_ov002_022cf178 + (self->f2.bit0 & 1) * 0x868) > 0) {
        for (i = 0; i < *(unsigned int *)(data_ov002_022cf16c + (self->f2.bit0 & 1) * 0x868 + 0xc); i++) {
            if (func_ov002_022536e8(self->f0, i) != 0) return 1;
        }
    }
    return 0;
}
