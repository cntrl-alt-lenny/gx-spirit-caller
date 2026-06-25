/* CAMPAIGN-PREP candidate for func_021c34c0 (ov006, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind handle r4 + caller-saved r5/r6/r7 across 7 calls; decl r5,r7,r6 order; ==1 ternary
 *   risk:       permuter-class: r5/r6/r7 are callee-saved holds chosen by alloc order (orig r5=0x8c1, r7=cmp, r6=call). Which value lands in which callee-saved reg is a coin-flip a C reshape rarely pins.
 *   confidence: low
 */
/* func_ov006_021c34c0 — linear setter: open self->f8's channel, probe two
 * predicates (02034784/02034810) to pick three caller-saved values, then push
 * a fixed list of (field,value) pairs to the channel. ret 1. */
extern int  func_02021660(int a, int b, int c);
extern int  func_020216b0(int a, int b, int c);
extern int  func_02034784(void);
extern int  func_02034810(void);

int func_ov006_021c34c0(int *self) {
    int h = func_02021660(self[2], 5, 0);   /* self+0x8 */
    int r5, r6, r7;
    if (func_02034784()) {
        r5 = 0x8c1;
        r7 = (func_02034784() == 1) ? 0 : 1;
        r6 = func_02034810();
    } else {
        r5 = 0;
        r7 = 0;
        r6 = 0;
    }
    func_020216b0(h, 3, 0xf8);
    func_020216b0(h, 4, 8);
    func_020216b0(h, 0x11, 0);
    func_020216b0(h, 0x12, 0);
    func_020216b0(h, 0xc, r7);
    func_020216b0(h, 0xd, r6);
    func_020216b0(h, 0, r5);
    return 1;
}
