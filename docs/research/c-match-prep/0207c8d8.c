/* CAMPAIGN-PREP candidate for func_0207c8d8 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     IRQ wrapper + null early-return + signed count guard; sp2p3 tier
 *   risk:       p kept in r0 across count-load (asm doesn't reload) - mwcc may rebind; && skip vs branch order
 *   confidence: high
 */
/* func_0207c8d8: IRQ-bracketed guarded call to func_020945f4. base fetched
 * before DisableIrq; saved mask kept in a callee reg (calls follow).
 * Style A epilogue, push {r4,lr}, no sub-sp -> `.legacy.c` (mwcc 1.2/sp2p3).
 * Early-return-on-null (duplicated RestoreIrq) matches func_0207c86c form.
 * func_020945f4(f2270_ptr, 0); count guard is SIGNED >0 (cmp #0; ble). */

typedef struct {
    char  _pad[0x2270];
    void *p;                     /* +0x2270 */
    int   count;                /* +0x2274 (signed) */
} ctx_c8d8_t;

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int saved);
extern ctx_c8d8_t *func_0207b538(void);
extern void func_020945f4(void *p, int arg);

void func_0207c8d8(void) {
    int saved = OS_DisableIrq();
    ctx_c8d8_t *base = func_0207b538();
    if (base == 0) {
        OS_RestoreIrq(saved);
        return;
    }
    {
        void *p = base->p;
        if (p != 0 && base->count > 0) {
            func_020945f4(p, 0);
        }
    }
    OS_RestoreIrq(saved);
}
