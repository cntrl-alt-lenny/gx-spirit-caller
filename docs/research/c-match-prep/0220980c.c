/* CAMPAIGN-PREP candidate for func_0220980c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     leaf: bind p once (ip), reuse for (p&1) and rsb 1-p then &1; dual-table mul-stride select
 *   risk:       reshape-able: orig binds p in ip and reuses for both strides (and ip,#1 / rsb 1,ip then and #1). If mwcc reloads p or drops the redundant &1 on the 1-p path, the and/mul sequence for table B diverges.
 *   confidence: med
 */
/* func_ov002_0220980c (ov002, class D, MED) -- leaf, no stack frame.
 * p = (h2<<31)>>31 bound once; if cf17c[(p&1)*0x868] != 0 return 1;
 * if cf178[((1-p)&1)*0x868] == 0 return 0; return 1. */
typedef unsigned short u16;
typedef unsigned char  u8;

struct Self0220980c {
    u16 f0;                                                /* +0x0 */
    struct { u16 p : 1; u16 b5 : 5; u16 b6 : 6; u16 _t : 4; } f2; /* +0x2 */
};

extern u8 data_ov002_022cf17c[]; /* table A, stride 0x868 */
extern u8 data_ov002_022cf178[]; /* table B, stride 0x868 */

int func_ov002_0220980c(struct Self0220980c *self) {
    int p = self->f2.p;
    if (*(int *)(data_ov002_022cf17c + (p & 1) * 0x868) != 0) return 1;
    if (*(int *)(data_ov002_022cf178 + ((1 - p) & 1) * 0x868) == 0) return 0;
    return 1;
}
