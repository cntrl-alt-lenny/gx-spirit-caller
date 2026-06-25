/* CAMPAIGN-PREP candidate for func_021fb17c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bitfield f6@6 guard; counted i<4; per-player mla (bit0&1)*0x868; movs/bmi idx>=0
 *   risk:       orig holds cf16c base in r5 / 0x868 in r9 / be12c in r6 across the loop (4 ldr-pool hoists). mwcc may reload per-iter -> extra ldr. reshape-able via binding bases to locals before the loop.
 *   confidence: med
 */
/* func_ov002_021fb17c (ov002, cls C): counted loop i=0..3 with per-player mla
 * base. Guard 6-bit field@6 of self->f2 == 0x23 -> return 1. Pre/post hooks
 * 021e2b3c / 021e2c5c. Per iter: idx via 021c2e34(bit0, table[i]); if >=0,
 * compute base = cf16c + (bit0&1)*0x868 + 0x18 + 0x400 + idx*4 and pass to
 * 021d8128(bit0, .., r4, base). r4 stays 0 throughout. */

typedef unsigned short u16;

struct Self21fb17c { u16 f0; u16 b0 : 1; u16 : 5; u16 f6 : 6; };

extern char data_ov002_022cf16c[];   /* per-player base (0x868 stride) */
extern int  data_ov002_022be12c[];   /* per-i index table */

extern void func_ov002_021e2b3c(void);
extern void func_ov002_021e2c5c(void);
extern int  func_ov002_021c2e34(int bit0, int tableval);
extern void func_ov002_021d8128(int bit0, int b, int c, int base);

int func_ov002_021fb17c(struct Self21fb17c *self) {
    int i;
    if (self->f6 == 0x23) return 1;
    func_ov002_021e2b3c();
    for (i = 0; i < 4; i++) {
        int idx = func_ov002_021c2e34(self->b0, data_ov002_022be12c[i]);
        if (idx >= 0) {
            char *base = data_ov002_022cf16c + (self->b0 & 1) * 0x868
                         + 0x18 + 0x400 + idx * 4;
            func_ov002_021d8128(self->b0, 0, 0, (int)base);
        }
    }
    func_ov002_021e2c5c();
    return 1;
}
