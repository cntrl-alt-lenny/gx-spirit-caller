/* CAMPAIGN-PREP candidate for func_020469b0 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     null-guard + stack out-param + tail call; sp3 tier
 *   risk:       out-param type void** assumed; if func_020469f0 writes a non-pointer, [sp] reload arg type harmless but signature guessed.
 *   confidence: high
 */
/* func_020469b0: guard on global pointer data_0219da0c; then build a
 * stack out-param via func_020469f0 and tail-call func_020465b0 with
 * (out, a5c_result). sp3 routing.
 *
 *     ldr r0,=data_0219da0c; ldr r0,[r0]; cmp r0,#0
 *     moveq r0,#0; return            ; if(!*daec) return 0
 *     add r0,sp,#0 ; bl func_020469f0 ; r = a5c(&out)
 *     mov r1,r0 ; ldr r0,[sp]         ; arg0=out, arg1=r
 *     bl func_020465b0 ; return       ; tail call */

extern void *data_0219da0c;      /* tested for NULL only */
extern int   func_020469f0(void **out);
extern int   func_020465b0(void *out, int r);

int func_020469b0(void) {
    void *out;
    if (data_0219da0c == 0) return 0;
    {
        int r = func_020469f0(&out);
        return func_020465b0(out, r);
    }
}
