/* CAMPAIGN-PREP candidate for func_02095344 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard early-return; volatile MMIO reload; !=0 cmov boolean
 *   risk:       OS_DisableIrq return value (saved-IRQ token) not passed back to RestoreIrq; may need to thread r0 through.
 *   confidence: med
 */
// func_02095344 — IRQ-guarded MMIO flag read
// Recipe: guard early-return, reload MMIO, != boolean via cmov pair.

extern int func_02092380(void);
extern void OS_DisableIrq(void);
extern void OS_RestoreIrq(void);

int func_02095344(void)
{
    int v;

    if (func_02092380() == 0) {
        return 1;
    }

    OS_DisableIrq();
    *(volatile unsigned int *)0x04fff200 = 0x10;
    v = *(volatile unsigned int *)0x04fff200;
    OS_RestoreIrq();

    return v != 0 ? 1 : 0;
}
