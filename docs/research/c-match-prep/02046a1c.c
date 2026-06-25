/* CAMPAIGN-PREP candidate for func_02046a1c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     null-guard + stack out-param + tail call; sp3 tier
 *   risk:       out-param type void** assumed; if func_02046a5c writes a non-pointer, [sp] reload arg type harmless but signature guessed.
 *   confidence: high
 */
/* func_02046a1c: guard on global pointer data_0219daec; then build a
 * stack out-param via func_02046a5c and tail-call func_02046658 with
 * (out, a5c_result). sp3 routing.
 *
 *     ldr r0,=data_0219daec; ldr r0,[r0]; cmp r0,#0
 *     moveq r0,#0; return            ; if(!*daec) return 0
 *     add r0,sp,#0 ; bl func_02046a5c ; r = a5c(&out)
 *     mov r1,r0 ; ldr r0,[sp]         ; arg0=out, arg1=r
 *     bl func_02046658 ; return       ; tail call */

extern void *data_0219daec;      /* tested for NULL only */
extern int   func_02046a5c(void **out);
extern int   func_02046658(void *out, int r);

int func_02046a1c(void) {
    void *out;
    if (data_0219daec == 0) return 0;
    {
        int r = func_02046a5c(&out);
        return func_02046658(out, r);
    }
}
