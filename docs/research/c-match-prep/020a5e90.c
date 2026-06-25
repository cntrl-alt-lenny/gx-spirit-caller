/* CAMPAIGN-PREP candidate for func_020a5e90 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     infinite for(;;) poll, IRQ save into struct, two break-returns
 *   risk:       reload of arg1->f0 after store, and hoisting r4=1/r5=0x027fffe8; loop-exit reg-alloc may flip
 *   confidence: low
 */
/* func_020a5e90: poll loop. Each pass: save IRQ to arg1->f4, read+mask
 * IRQ-flag MMIO into arg1->f0; bail if set; bail if func_02090990(arg0)
 * is 0; else restore IRQ, WaitByLoop(1), repeat. sp2p3 (.legacy.c).
 *
 *   for (;;) {
 *       arg1->f4 = OS_DisableIrq();
 *       arg1->f0 = func_020908f0(0x027fffe8) & 0x40;
 *       if (arg1->f0 != 0) return;
 *       if (func_02090990(arg0) == 0) return;
 *       OS_RestoreIrq(arg1->f4);
 *       WaitByLoop(1);
 *   }
 */

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int saved);
extern void WaitByLoop(int count);
extern int  func_020908f0(unsigned int addr);
extern int  func_02090990(int arg);

typedef struct {
    int f0;   /* +0x0 : masked IRQ flag */
    int f4;   /* +0x4 : saved IRQ state */
} poll_020a5e90_t;

void func_020a5e90(int arg0, poll_020a5e90_t *st) {
    for (;;) {
        st->f4 = OS_DisableIrq();
        st->f0 = func_020908f0(0x027fffe8) & 0x40;
        if (st->f0 != 0) return;
        if (func_02090990(arg0) == 0) return;
        OS_RestoreIrq(st->f4);
        WaitByLoop(1);
    }
}
