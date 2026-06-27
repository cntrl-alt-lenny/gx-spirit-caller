/* CAMPAIGN-PREP candidate for func_020903d4 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     if-assign in while-cond reuses ands for flags+return; mask-first operand; reload base across calls
 *   risk:       permuter-class: loop-invariant hoist of &data_027e0000[0xffe] into a callee-saved reg (orig holds full ptr r6, reloads base elsewhere) may not match; return-as-masked-bits is a modeled assumption (struct-guessed).
 *   confidence: med
 */
/* func_020903d4 (main, cls C): OS_WaitInterrupt-style IRQ wait.
 * disable; optionally clear mask bits in the IRQ-check reg at
 * data_027e0000+0x3ff8; restore; spin (calling func_02091a8c) until any
 * masked bit is set; return the matched bits.
 * reg index 0xffe = 0x3ff8/4 -> mwcc materializes add #0x3000 + ldr #0xff8. */
extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int saved);
extern int  OSi_IrqCheckBuf;
extern void func_02091a8c(int *buf);
extern unsigned int data_027e0000[];

int func_020903d4(int clear, unsigned int mask)
{
    int v;
    int saved = OS_DisableIrq();
    if (clear)
        data_027e0000[0xffe] &= ~mask;
    OS_RestoreIrq(saved);
    while ((v = mask & data_027e0000[0xffe]) == 0)
        func_02091a8c(&OSi_IrqCheckBuf);
    return v;
}
