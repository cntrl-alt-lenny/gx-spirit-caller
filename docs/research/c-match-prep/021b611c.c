/* CAMPAIGN-PREP candidate for func_021b611c (ov017, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     two counted index loops, base = call result + const offset
 *   risk:       loop reg-alloc (callee-saved index/stride spread r4-fp) and the base-add scheduling may diverge
 *   confidence: med
 */
/* func_ov017_021b611c: load two parallel cell tables (via func_0208e120 /
 * func_0208e1cc, each +0x3c0), submit 9 cells of width 0x18 from each at
 * stride 0x40; then a second pass on the +0x3d8+0x800 tables, 9 cells of
 * width 0x28 each.
 */

extern char *func_0208e120(void);
extern char *func_0208e1cc(void);
extern void func_0209448c(int a, void *p, int len);

void func_ov017_021b611c(void) {
    short *t0 = (short *)(func_0208e120() + 0x3c0);
    short *t1 = (short *)(func_0208e1cc() + 0x3c0);
    short *u0;
    short *u1;
    int i;

    for (i = 0; i < 9; i++) {
        func_0209448c(0, t0 + i * 0x20, 0x18);
        func_0209448c(0, t1 + i * 0x20, 0x18);
    }

    u0 = (short *)(func_0208e120() + 0x3d8 + 0x800);
    u1 = (short *)(func_0208e1cc() + 0x3d8 + 0x800);
    for (i = 0; i < 9; i++) {
        func_0209448c(0, u0 + i * 0x20, 0x28);
        func_0209448c(0, u1 + i * 0x20, 0x28);
    }
}
