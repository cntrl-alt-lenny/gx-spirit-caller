/* CAMPAIGN-PREP candidate for func_021fa8d4 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bitfield bit14^bit0; bind cap(r4) across guard; (flag&1)*0x868 stride; mvnle return -1
 *   risk:       orig holds cap in r4 and flag in r5 across two bl's; if mwcc spills/re-colours the surviving regs the saved-reg set or reload count diverges. reshape-able via decl-order (flag before cap result).
 *   confidence: med
 */
/* func_ov002_021fa8d4 (ov002, cls C): parity-flag predicate. flag = bit14 ^
 * bit0 of self->f2; cap = 021f3458(); guard 021ff3bc(self, arg1); compare
 * cf16c[(flag&1)*0x868] (a per-player count) against cap, return -1 if <=;
 * else r = 021f4a84(self, arg1); if r==1 call 021df780(flag, cap); return r. */

typedef unsigned short u16;

struct Self21fa8d4 { u16 f0; u16 b0 : 1; u16 : 13; u16 b14 : 1; };

extern char data_ov002_022cf16c[];   /* per-player count table (0x868 stride) */

extern int func_ov002_021f3458(void);
extern int func_ov002_021ff3bc(struct Self21fa8d4 *self, int arg1);
extern int func_ov002_021f4a84(struct Self21fa8d4 *self, int arg1);
extern int func_ov002_021df780(int flag, int cap);

int func_ov002_021fa8d4(struct Self21fa8d4 *self, int arg1) {
    int flag = self->b14 ^ self->b0;
    int cap = func_ov002_021f3458();
    int r;
    if (func_ov002_021ff3bc(self, arg1) == 0) return -1;
    if (*(int *)(data_ov002_022cf16c + (flag & 1) * 0x868) <= cap) return -1;
    r = func_ov002_021f4a84(self, arg1);
    if (r == 1) func_ov002_021df780(flag, cap);
    return r;
}
