/* CAMPAIGN-PREP candidate for func_020a1c48 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: branch-table 0-based (cmp #3); global reloaded across bl; store-order kept
 *   risk:       reshape-able: the three duplicated RestoreIrq+return-0 epilogues may merge into one shared block; if so, hoist to a single tail goto. mwcc-version-sensitive.
 *   confidence: med
 */
/* func_020a1c48: IRQ-guarded jump-table dispatch (class D).
 * switch(r1) 0..3 -> (state,val) const pairs, default -> return 0.
 * data_021a98fc is a base ptr, RELOADED each use (across the bl).
 * u32 read at base+(arg-1)*4+0x14e8 ; u16 write at base+(arg-1)*2+0x1754. */
extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int irq);
extern char *data_021a98fc;
extern int  func_020a099c(unsigned int x);

int func_020a1c48(int arg, int sel) {
    int irq;
    int state;
    int val;

    irq = OS_DisableIrq();
    switch (sel) {
    case 0: state = 0xa; val = 4; break;
    case 1: state = 0xa; val = 3; break;
    case 2: state = 0xe; val = 2; break;
    case 3: state = 0x7; val = 5; break;
    default:
        OS_RestoreIrq(irq);
        return 0;
    }

    if (data_021a98fc == 0) {
        OS_RestoreIrq(irq);
        return 0;
    }
    if (func_020a099c(arg) == 0) {
        OS_RestoreIrq(irq);
        return 0;
    }
    if (*(int *)(data_021a98fc + (arg - 1) * 4 + 0x14e8) != state) {
        OS_RestoreIrq(irq);
        return 0;
    }
    *(short *)(data_021a98fc + (arg - 1) * 2 + 0x1754) = (short)val;
    OS_RestoreIrq(irq);
    return 1;
}
