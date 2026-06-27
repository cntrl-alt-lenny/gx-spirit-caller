/* CAMPAIGN-PREP candidate for func_0203cc58 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS C: single reused result local (r5); decl-order result-then-irq; if/else-if chain matches cmp+bcs band split
 *   risk:       In the IRQ arm the asm keeps the result in r5 while OS_RestoreIrq(irq) runs after func_0203c89c; if mwcc spills/reorders the irq(r4) vs result(r5) the two movs swap -- reshape-able via decl-order (declare st before irq).
 *   confidence: med
 */
/* func_0203cc58 - main - class C
 * range-dispatch on a state byte, IRQ save/restore on the low band,
 * single reused result local (asm holds it in r5 across every arm).
 * func_0203c888() -> current state byte; func_0203c89c(int) commits it.
 */
extern unsigned int func_0203c888(void);
extern void func_0203c89c(int);
extern int  func_0203ec1c(void);
extern int  func_0203eb48(void);
extern int  func_0203dae0(void);
extern int  func_0203e2f0(void);
extern int  func_0203f094(void);
extern int  func_0203de80(void);
extern int  func_0203c730(void);
extern void func_0203c7d0(void);
extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int);

int func_0203cc58(void)
{
    int st;
    int irq;

    st = func_0203c888();
    if (st == 1) {
        st = func_0203ec1c();
    } else if (st < 7) {
        irq = OS_DisableIrq();
        st = func_0203eb48();
        func_0203c89c(st);
        OS_RestoreIrq(irq);
    } else if (st < 9) {
        st = func_0203dae0();
    } else if (st < 0xa) {
        st = func_0203e2f0();
    } else if (st < 0x10) {
        st = func_0203f094();
    } else if (st == 0x11) {
        st = func_0203de80();
    }
    func_0203c89c(st);
    if (st == 0x10) {
        irq = func_0203c730();
        func_0203c7d0();
        return irq;
    }
    if (st != 0x12)
        return 0;
    func_0203c7d0();
    return -1;
}
