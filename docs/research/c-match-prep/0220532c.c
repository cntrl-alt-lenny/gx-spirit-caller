/* CAMPAIGN-PREP candidate for func_0220532c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bitfield extracts; bind call1 result as index; (1-b0)&1 last table; final !=0
 *   risk:       f2 reloaded per use (orig holds in r4 across all 3 uses); if mwcc reloads ldrh[+2] each bitfield read, multiple ldrh diverge. reshape-able (read f2 union into one local).
 *   confidence: low
 */
/* func_ov002_0220532c: guard chain over per-player tables.
 * f2.b0 (1-bit), f4 mid 9-bit field, f0; chain of helper-guards each
 * returning 0, ending in a (1-bit0)-indexed table != 0 test.
 * Bitfields: b0 = lsl31;lsr31, f4.mid9 (p6 w9) = lsl17;lsr23. */
typedef unsigned short u16;
struct F2 { u16 bit0:1; u16 rest:15; };
struct F4 { u16 lo6:6; u16 mid9:9; u16 hi1:1; };
struct S0220532c { u16 f0; struct F2 f2; struct F4 f4; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf178[];
extern int func_ov002_021b99b4(unsigned int bit, unsigned int field9);
extern int func_ov002_021b3fd8(unsigned int bit, int k, u16 f0, unsigned int field9);
int func_ov002_0220532c(struct S0220532c *self) {
    int r;
    r = func_ov002_021b99b4(self->f2.bit0, self->f4.mid9);
    if (r < 0) return 0;
    if (((*(unsigned int *)(data_ov002_022cf16c + (self->f2.bit0 & 1) * 0x868 + r * 4 + 0x418) >> 17) & 1) == 0)
        return 0;
    if (func_ov002_021b3fd8(self->f2.bit0, 0xb, self->f0, self->f4.mid9) != 0)
        return 0;
    return *(int *)(data_ov002_022cf178 + ((1 - self->f2.bit0) & 1) * 0x868) != 0;
}
