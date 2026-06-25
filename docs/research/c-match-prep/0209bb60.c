/* CAMPAIGN-PREP candidate for func_0209bb60 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     arg passthrough; fn-ptr arg; store-then-reload-global; .legacy.c
 *   risk:       struct offset 0x20 guessed; the empty `sub sp,#4` frame is a sp2p3 artifact—if it doesn't emit, route to default .c
 *   confidence: med
 */
/* file: src/main/func_0209bb60.legacy.c  (mwcc 1.2/sp2p3)
 * `sub sp,#4` + 2-step `ldmfd {lr}; bx lr` => Style A => .legacy.c.
 * arg0 (r0) is forwarded untouched to func_0209bba4; func_0209b54c is
 * passed by ADDRESS (function pointer). Result is stored to the global
 * field at +0x20, an else-branch fallback call runs when it's 0, and
 * the return value is RE-READ from the global (not the cached reg) —
 * the intervening call forces mwcc to reload it. */

extern void func_0209b54c(void);
extern int  func_0209bba4(int a, void *fp, int z);
extern void func_0209b534(void);

typedef struct { char _pad[0x20]; int field_20; } data_021a8438_t;
extern data_021a8438_t data_021a8438;

int func_0209bb60(int a) {
    int r = func_0209bba4(a, func_0209b54c, 0);
    data_021a8438.field_20 = r;
    if (r == 0) {
        func_0209b534();
    }
    return data_021a8438.field_20;
}
