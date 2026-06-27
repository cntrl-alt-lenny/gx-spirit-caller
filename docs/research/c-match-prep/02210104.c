/* CAMPAIGN-PREP candidate for func_02210104 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     reload bit0 each guard (not bound); 2-int stack buf; if-guards not ternary
 *   risk:       reshape-able: orig recomputes buf[1-bit0]/buf[bit0] index per use (ldrh x4); if mwcc CSEs the index/load into one reg, the repeated lsl/ldr diverge -- keep separate self->bit0 reads.
 *   confidence: med
 */
/* func_ov002_02210104: fill a 2-int stack buffer via func_0220eb00(self,&buf),
 * tick func_021e2b3c(), then four sign-guards on buf indexed by player bit0
 * (buf[1-bit0] / buf[bit0]); negative -> func_021df818(self,-v); positive ->
 * func_021e05fc(); finally func_021e2c5c(). Returns 0. self->f2.bit0 is
 * RELOADED for each of the four guards (orig ldrh [r4,#2] x4). */

typedef unsigned short u16;

struct Self02210104 {
    u16 f0;
    u16 bit0 : 1;   /* +2 bit0 = player */
};

extern void func_ov002_0220eb00(struct Self02210104 *self, int *buf);
extern void func_ov002_021e2b3c(void);
extern void func_ov002_021df818(struct Self02210104 *self, int v);
extern void func_ov002_021e05fc(void);
extern void func_ov002_021e2c5c(void);

int func_ov002_02210104(struct Self02210104 *self) {
    int buf[2];
    func_ov002_0220eb00(self, buf);
    func_ov002_021e2b3c();
    if (buf[1 - self->bit0] < 0)
        func_ov002_021df818(self, -buf[1 - self->bit0]);
    if (buf[self->bit0] < 0)
        func_ov002_021df818(self, -buf[self->bit0]);
    if (buf[self->bit0] > 0)
        func_ov002_021e05fc();
    if (buf[1 - self->bit0] > 0)
        func_ov002_021e05fc();
    func_ov002_021e2c5c();
    return 0;
}
