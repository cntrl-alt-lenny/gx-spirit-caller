/* CAMPAIGN-PREP candidate for func_020a39ec (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     IRQ-bracket; deref+0x1000 gate; guard call; sequential calls
 *   risk:       must route .legacy.c; the `add #0x1000` hop must stay separate (don't fold into one ldr offset); r4 caches OS_DisableIrq result
 *   confidence: high
 */
/* func_020a39ec — IRQ-bracketed conditional init + unconditional dispatch.
 * Style A epilogue (ldmia {r4,lr}; bx lr) -> ROUTE AS *.legacy.c (mwcc 1.2/sp2p3).
 * Direct analog of the matched func_020a1d48.legacy.c IRQ-wrapper pattern.
 * data_021a98fc: ptr; (*ptr + 0x1000)->f_320 (int) gate.
 */

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int saved);
extern void func_02093bfc(void);
extern void func_020a3a2c(void);

typedef struct {
    char _pad[0x1000];
    char _pad2[0x320];
    int  f_1320;            /* (*ptr + 0x1000) + 0x320 */
} region_t;

extern region_t *data_021a98fc;

void func_020a39ec(void)
{
    int saved = OS_DisableIrq();
    if (data_021a98fc->f_1320 == 0)
        func_02093bfc();
    func_020a3a2c();
    OS_RestoreIrq(saved);
}
