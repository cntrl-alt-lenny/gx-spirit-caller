/* CAMPAIGN-PREP candidate for func_0209d4ec (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     if/else predicated ptr-select + deref; IRQ bracket; .legacy.c
 *   risk:       the str/ldr [sp] spill round-trip (sub sp,#8) may not reproduce from a plain local — likeliest divergence; ptr/deref shape solid
 *   confidence: low
 */
/* file: src/main/func_0209d4ec.legacy.c  (mwcc 1.2/sp2p3)
 * `sub sp,#8` + 2-step `ldmia {r4,lr}; bx lr` (incl. ldmeqia guard) =>
 * Style A => .legacy.c. Read a u16 flag at 0x027ffc10; pick one of two
 * system-region pointers (0x027ff800 if zero, else 0x027ffc00) via an
 * if/else (NOT a ternary) so mwcc emits the predicated `ldreq/ldrne`
 * address load + a single deref. Compare the loaded word to arg; equal
 * => return. Else IRQ-bracket a call to func_0209d5e4(0xe,0x11,0).
 * The orig spills the compared value to [sp] and reloads it (hence
 * sub sp,#8) — reproduced by holding it in a plain local. */

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int saved);
extern void func_0209d5e4(int a, int b, int c);

void func_0209d4ec(int arg) {
    int *p;
    int v;
    int saved;
    if (*(volatile unsigned short *)0x027ffc10 == 0) {
        p = (int *)0x027ff800;
    } else {
        p = (int *)0x027ffc00;
    }
    v = *p;
    if (arg == v) return;
    saved = OS_DisableIrq();
    func_0209d5e4(0xe, 0x11, 0);
    OS_RestoreIrq(saved);
}
