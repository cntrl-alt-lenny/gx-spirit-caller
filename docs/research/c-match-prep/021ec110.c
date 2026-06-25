/* CAMPAIGN-PREP candidate for func_021ec110 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     :1 and :5 self bitfields unpacked into call args; fused-mla index
 *   risk:       two bitfields read from the SAME self->f2 u16: orig does one ldrh then lsl#31/lsl#26 shift pair. If mwcc reloads f2 twice (one per bitfield) an extra ldrh appears. struct-guessed (b0/f5 bit offsets inferred from <<31>>31 and <<26>>27).
 *   confidence: med
 */
/* func_ov002_021ec110 (ov002, class C). args r0=self, r1=a, r2=row.
 * The 3 helper args come from self->f2 bitfields: b0 (:1) and a :5 field at bits[5:1].
 * Order in asm: row<5 guard, then index/f30 guard, then unpack b0+f5 into r2/r3 for the call. */

struct self_t { char _pad[2]; unsigned short b0 : 1; unsigned short f5 : 5; unsigned short _r : 10; };
struct subrow { char _pad[0x30]; unsigned int f30 : 13; unsigned int _hi : 19; };

extern char data_ov002_022cf16c[];
extern int  func_ov002_021b33b0(int a, int row, int b0, int f5);
extern int  func_ov002_021c23ac(int a, int row);

int func_ov002_021ec110(struct self_t *self, int a, int row) {
    struct subrow *sr;
    if (row < 5)
        return 0;
    sr = (struct subrow *)(data_ov002_022cf16c + (a & 1) * 0x868 + row * 20);
    if (sr->f30 == 0)
        return 0;
    if (func_ov002_021b33b0(a, row, self->b0, self->f5) == 0)
        return 0;
    return func_ov002_021c23ac(a, row) == 0 ? 0 : 1;
}
