/* CAMPAIGN-PREP candidate for func_022033cc (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     || short-circuit; self->r4 + f2 reload; (x>>17)&1 raw (not bitfield); ==0 map
 *   risk:       The trailing func_021b3ecc result still has bit0 live in r0 (orig reuses param reg) — fine. Main risk: the bit17 test must stay `lsr#17;tst#1`; if mwcc lifts it to a `:1` bitfield (lsl;lsr) it diverges. reshape-able (keep `(x>>17)&1`, never a bitfield member, for the lsr+tst pair).
 *   confidence: med
 */
/* func_ov002_022033cc (cls C): two-flag OR guard + per-player bit test + helper.
 * if (func_021bb90c(bit0,0x1433) || func_021bb90c(bit0,0x1434)) {
 *   if bit17 of data_022cf288[bit0*0x868] set -> return 0;
 *   return func_021b3ecc(bit0,0xb,0x12f3) == 0;
 * } else return 0.
 * self pinned in a callee-saved reg (r4) across the calls; f2 reloaded each
 * read. bit17 test is `(word>>17)&1` (lsr#17;tst#1), NOT a bitfield. */

typedef unsigned short u16;

struct F022033cc_F2 { u16 bit0 : 1; u16 rest : 15; };
struct F022033cc_Self { u16 f0; struct F022033cc_F2 f2; };

extern char data_ov002_022cf288[];
extern int  func_ov002_021bb90c(int player, int code);
extern int  func_ov002_021b3ecc(int player, int kind, int code);

int func_ov002_022033cc(struct F022033cc_Self *self) {
    if (func_ov002_021bb90c(self->f2.bit0, 0x1433) ||
        func_ov002_021bb90c(self->f2.bit0, 0x1434)) {
        if ((*(unsigned int *)(data_ov002_022cf288 + self->f2.bit0 * 0x868) >> 17) & 1)
            return 0;
        return func_ov002_021b3ecc(self->f2.bit0, 0xb, 0x12f3) == 0;
    }
    return 0;
}
