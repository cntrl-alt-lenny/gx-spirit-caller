/* CAMPAIGN-PREP candidate for func_02212e9c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: contiguous 0x7d-0x80 -> addls jump table; DESCENDING case order (0x80 first) reproduces descending body layout; (1-bit0) via rsb.
 *   risk:       struct-guessed: 021d7970/021e104c arities (3/2 args; trailing regs unset) inferred. Block ordering verified: descending source = exact addls table + body order.
 *   confidence: high
 */
/* func_ov002_02212e9c (ov002, cls D): bit2 guard, contiguous state switch
 * (0x7d..0x80) -> addls jump table; cf178 per-player gate; bit0 / 1-bit0 calls. */
typedef unsigned short u16;

struct S02212e9c {
    u16 f0;
    u16 b0 : 1;           /* +2 bit0 = player */
    u16    : 15;
    u16 b2_2 : 2;         /* +4 bits0-1 */
    u16 b2  : 1;          /* +4 bit2 */
    u16     : 13;
};

extern char data_ov002_022ce288[];   /* +0x5a8 = state int */
extern char data_ov002_022cf178[];   /* per-player table, 0x868 stride */

extern void func_ov002_021d7970(int a, int b, int c);
extern int  func_ov002_021e104c(int a, int b);
extern void func_ov002_021e2b3c(void);
extern void func_ov002_021e2c5c(void);

int func_ov002_02212e9c(struct S02212e9c *self) {
    int state;
    if (self->b2) return 0;
    state = *(int *)(data_ov002_022ce288 + 0x5a8);
    switch (state) {
    case 0x80:
        if (*(int *)(data_ov002_022cf178 + (self->b0 & 1) * 0x868) == 0) return 0x7f;
        func_ov002_021d7970(self->b0, 0, 0);
        return 0x80;
    case 0x7f:
        if (*(int *)(data_ov002_022cf178 + ((1 - self->b0) & 1) * 0x868) == 0) return 0x7e;
        func_ov002_021d7970(1 - self->b0, 0, 1);
        return 0x7f;
    case 0x7e:
        func_ov002_021e2b3c();
        func_ov002_021e104c(self->b0, 5);
        return 0x7d;
    case 0x7d:
        func_ov002_021e104c(1 - self->b0, 5);
        func_ov002_021e2c5c();
        return 0x7c;
    default:
        return 0;
    }
}
