/* CAMPAIGN-PREP candidate for func_0220717c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     unsigned count>0 -> bls skip; (uint)i<reloaded bound -> bcc; explicit (b0&1)*0x868
 *   risk:       orig keeps 0x868 (r6) + data_022cf16c (r7) reg-bound across loop while reloading ldrh[+2] each iter; if mwcc hoists b0 or doesn't reload bound, the per-iter mla/ldr sequence diverges. reshape-able-or-permuter (reg-alloc).
 *   confidence: med
 */
/* func_ov002_0220717c: bare canonical counted helper loop.
 * count0 = T178[player]; for i < T16c[player].field0xc:
 * if 022536e8(f0,i) ret 1; else 0. b0 = lsl31;lsr31 bitfield. */
typedef unsigned short u16;
struct F2 { u16 bit0:1; u16 rest:15; };
struct S0220717c { u16 f0; struct F2 f2; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf178[];
extern int func_ov002_022536e8(u16 f0, int i);
int func_ov002_0220717c(struct S0220717c *self) {
    int i;
    if (*(unsigned int *)(data_ov002_022cf178 + (self->f2.bit0 & 1) * 0x868) > 0) {
        for (i = 0; i < *(unsigned int *)(data_ov002_022cf16c + (self->f2.bit0 & 1) * 0x868 + 0xc); i++) {
            if (func_ov002_022536e8(self->f0, i) != 0) return 1;
        }
    }
    return 0;
}
