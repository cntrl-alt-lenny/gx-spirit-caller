/* CAMPAIGN-PREP candidate for func_020481c8 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     fn-pointer-arg call + global-reload field stores; sp3 tier
 *   risk:       func_02047b94 first arg is the func ADDRESS (decays from name) — must not be called. Reload between the two stores must match (two ldr [p]).
 *   confidence: high
 */
/* func_020481c8: call func_02047b94(&func_02047e14, 0) (passes the
 * address of func_02047e14 as a callback), then set fields of
 * *data_0219db98: f_4 = 1, f_30 = 0. sp3 routing.
 *
 *     ldr r0,=func_02047e14 ; mov r1,#0 ; bl func_02047b94
 *     ldr r0,=data_0219db98 ; mov r3,#1 ; ldr r2,[r0]
 *     mov r1,#0 ; str r3,[r2,#0x4]          ; (*p)->f_4 = 1
 *     ldr r0,[r0] ; str r1,[r0,#0x30]       ; (*p)->f_30 = 0
 *
 * func_02047e14 is passed by address (a function pointer literal in
 * the pool). The struct base &data_0219db98 is held while *p is
 * reloaded for the second store. */

typedef struct {
    char _pad0[0x4];
    int  f_4;           /* +0x4 */
    char _pad1[0x28];
    int  f_30;          /* +0x30 */
} state_0204823c_t;

extern void func_02047e14(void);
extern void func_02047b94(void (*cb)(void), int arg);
extern state_0204823c_t *data_0219db98;

void func_020481c8(void) {
    func_02047b94(func_02047e14, 0);
    data_0219db98->f_4 = 1;
    data_0219db98->f_30 = 0;
}
