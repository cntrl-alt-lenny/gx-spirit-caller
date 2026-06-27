/* CAMPAIGN-PREP candidate for func_021b768c (ov017, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     leaf layout calc; clamp as if-assign (y init 0); RECOMPUTE func_0202c0c0 arg twice; 2 stack args
 *   risk:       reshape-able: ONE folded instr — target has `addlt r0,r4,r0; sublt r4,r0,#2` but mwcc const-props y==0 to one `sublt`. Defeat the y==0 prop (derive y from an opaque value, or write y=(v>=0x14)?0x14:v-2 and compare).
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov017_021b768c (ov017, class C, MED) — batch p_0138.
 * DISASM-CHECKED: matches the target EXCEPT one folded instruction in the clamp.
 * Target keeps `addlt r0,r4,r0; sublt r4,r0,#2` (two insns); mwcc folds mine to a
 * single `sublt r4,r0,#2` because it proves y==0 there. Everything else (double
 * func_0202c0c0 recompute, stack args, add r3,r4,#6) matches. */

extern char  data_02102c90[];
extern void  func_02001d0c(void *a, int b, int c);
extern int   func_02005088(void *a, int b, void *c, int d, int e, int f);
extern int   func_020054a4(int a, int b);
extern int   func_0202c0c0(int a);
extern char *func_0208df0c(void);
extern void  func_02094504(int val, void *dst, int len);

void func_ov017_021b768c(char *s) {
    int y;
    int v;
    int r;

    func_02094504(0, func_0208df0c() + 0xdc0, 0x500);
    func_02001d0c(data_02102c90, 0x14, 2);
    y = 0;

    r = func_0202c0c0(*(int *)(s + 0x1d4) + 0x36c + 0x400);
    v = 0x90 - func_020054a4(r, 0xc);
    if (v >= 0x14) {
        y = y + 0x14;
    } else {
        v = y + v;
        y = v - 2;
    }

    r = func_0202c0c0(*(int *)(s + 0x1d4) + 0x36c + 0x400);
    func_02005088(data_02102c90, r, func_0208df0c() + 0xdc0, y + 6, 1, 0xc);
}
