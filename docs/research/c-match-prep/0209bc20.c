/* CAMPAIGN-PREP candidate for func_0209bc20 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     arg passthrough; fn-ptr arg; store-then-reload-global; .legacy.c
 *   risk:       struct offset 0x20 guessed; empty `sub sp,#4` frame is a sp2p3 artifact—if absent, route to default .c
 *   confidence: med
 */
/* file: src/main/func_0209bc20.legacy.c  (mwcc 1.2/sp2p3)
 * Identical shape to func_0209bb60 but the inner call is func_0209bc64.
 * `sub sp,#4` + 2-step `ldmfd {lr}; bx lr` => Style A => .legacy.c. */

extern void func_0209b54c(void);
extern int  func_0209bc64(int a, void *fp, int z);
extern void func_0209b534(void);

typedef struct { char _pad[0x20]; int field_20; } data_021a8438_t;
extern data_021a8438_t data_021a8438;

int func_0209bc20(int a) {
    int r = func_0209bc64(a, func_0209b54c, 0);
    data_021a8438.field_20 = r;
    if (r == 0) {
        func_0209b534();
    }
    return data_021a8438.field_20;
}
