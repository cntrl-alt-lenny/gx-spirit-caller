/* CAMPAIGN-PREP candidate for func_02070ddc (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Family-F IRQ wrapper: field-store call result + bracketed 2-arg call (.legacy.c)
 *   risk:       Field offsets guessed; relies on mwcc CSEing the shared const 1 across self->f4 store and the 2nd call arg; sp2p3 routing.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_02070ddc (main, class A).
 * UNVERIFIED build-free draft. Route -> src/main/func_02070ddc.legacy.c
 * (mwcc 1.2/sp2p3): stmdb{r4,r5,lr}+sub sp,#4 + 2-step (ldmia{r4,r5,lr};
 * bx lr) epilogue => Style A. This is the Family-F IRQ critical-section
 * shell: OS_DisableIrq result parked in callee-saved r4.
 *   recipe:     init: store call result to field, set fields, IRQ bracket
 *               around a 2-arg call (shared const 1 CSE for f4 store + arg)
 */
/* func_02070ddc: self->f28 = func_02070f54(); self->f8 = 1;
 * old = OS_DisableIrq(); self->f4 = 1; func_020919a4(0, 1);
 * OS_RestoreIrq(old). r0 = self. */

typedef int OSIntrMode;

typedef struct Self {
    char _pad04[0x4];
    int           f4;       /* +0x4  (str) */
    unsigned char f8;       /* +0x8  (strb = 1) */
    char _pad28[0x28 - 0x9];
    int           f28;      /* +0x28 (str = call result) */
} Self;

extern OSIntrMode OS_DisableIrq(void);
extern OSIntrMode OS_RestoreIrq(OSIntrMode old);
extern int  func_02070f54(void);
extern void func_020919a4(int a, int b);

void func_02070ddc(Self *self) {
    OSIntrMode old;
    self->f28 = func_02070f54();
    self->f8 = 1;
    old = OS_DisableIrq();
    self->f4 = 1;
    func_020919a4(0, 1);
    OS_RestoreIrq(old);
}
