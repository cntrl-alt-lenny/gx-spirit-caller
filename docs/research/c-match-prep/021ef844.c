/* CAMPAIGN-PREP candidate for func_021ef844 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     early fa early-return; :5/:1 self bitfields; shifted-or operand-first; row<5 (inverted) guard
 *   risk:       b0 is computed once (for `a != self->b0`) and REUSED as func_021b33b0's r2 arg; if mwcc recomputes b0 a second ldrh/shift appears. Also the `(a&0xFF)|((row&0xFF)<<8)` operand order must keep a&0xFF as the orr Rn. reshape-able (operand order) / struct-guessed (f5 offset, fa at +0xa).
 *   confidence: med
 */
/* func_ov002_021ef844 (ov002, class C/D). args r0=self, r1=a, r2=row.
 * Early `if (self->fa) return func_021e7748(self);`. Then b0/row guards, index+f30 guard,
 * unpack a :5 field of self->f2 into func_021b33b0's r3 (b0 reused in r2 from the earlier compare),
 * then func_021c23ac, then pack (a&0xFF)|((row&0xFF)<<8) as a u16 and call 02257888 with &021e7748. */

struct self_t { unsigned short f0; unsigned short b0 : 1; unsigned short f5 : 5; unsigned short _r : 10; char _pad6[4]; unsigned short fa; };
struct subrow { char _pad[0x30]; unsigned int f30 : 13; unsigned int _hi : 19; };

extern char data_ov002_022cf16c[];
extern int func_ov002_021e7748(struct self_t *self);
extern int func_ov002_021b33b0(int a, int row, int b0, int f5);
extern int func_ov002_021c23ac(int a, int row);
extern int func_ov002_02257888(struct self_t *self, int (*fn)(struct self_t *), unsigned short packed);

int func_ov002_021ef844(struct self_t *self, int a, int row) {
    struct subrow *sr;
    if (self->fa != 0)
        return func_ov002_021e7748(self);
    if (a != self->b0)
        return 0;
    if (row < 5)
        return 0;
    sr = (struct subrow *)(data_ov002_022cf16c + (a & 1) * 0x868 + row * 20);
    if (sr->f30 == 0)
        return 0;
    if (func_ov002_021b33b0(a, row, self->b0, self->f5) == 0)
        return 0;
    if (func_ov002_021c23ac(a, row) == 0)
        return 0;
    return func_ov002_02257888(self, func_ov002_021e7748,
                               (unsigned short)((a & 0xFF) | ((row & 0xFF) << 8))) != 0;
}
