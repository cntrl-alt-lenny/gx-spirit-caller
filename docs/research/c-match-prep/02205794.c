/* CAMPAIGN-PREP candidate for func_02205794 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     tag6/bit0 bitfields; (1-bit0)&1 table index (rsb;and); branch-merge to shared ret 1
 *   risk:       reshape-able: the (1-bit0)&1 index must emit rsb;and (not bit0&1). Risk the gate block re-extracts bit0 after tag6 (orig reuses the same r0 read); reload would add a ldrh.
 *   confidence: med
 */
/* func_ov002_02205794: cls D — tag6!=0x23 gate-call; then table[(1-bit0)&1]!=0
 * short-circuits to 1, else 021c3bdc()!=0. f2 [self,#2]: tag6 bits6-11, bit0.
 * table index uses (1-bit0)&1 (rsb;and) NOT bit0 — that sign matters. */
typedef unsigned short u16;
struct F2_05794 { u16 bit0:1; u16 pad:5; u16 tag6:6; u16 rest:4; };
struct S05794 { u16 f0; struct F2_05794 f2; };
extern char data_ov002_022cf178[];
extern int func_ov002_021bb90c(int bit0, int magic);
extern int func_ov002_021c3bdc(void);
int func_ov002_02205794(struct S05794 *self) {
    if (self->f2.tag6 != 0x23) {
        if (func_ov002_021bb90c(self->f2.bit0, 0x159d) == 0) return 0;
    }
    if (*(int *)(data_ov002_022cf178 + ((1 - self->f2.bit0) & 1) * 0x868) != 0)
        return 1;
    return func_ov002_021c3bdc() != 0;
}
