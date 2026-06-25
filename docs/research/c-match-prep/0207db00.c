/* CAMPAIGN-PREP candidate for func_0207db00 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     align start/end (B), unsigned bound+size check, pass-through tail call, sp3 frame
 *   risk:       ROUTE AS *.legacy_sp3.c. unsigned bhi/bcs need unsigned types; a2 must thread untouched to func_0207dc5c as 3rd arg; aligned-end = base+len order
 *   confidence: med
 */
/* func_0207db00 (main, class B, 0x44) — align bounds, size check, tail call.
 *   push {lr}; sub sp,#4; add r1,r1,r0; add r0,r0,#3; bic r1,r1,#3;
 *   bic r0,r0,#3; cmp r0,r1; bhi .L_2c; sub r3,r1,r0; cmp r3,#0x30;
 *   bcs .L_38;
 * .L_2c: mov r0,#0; pop {pc};
 * .L_38: bl func_0207dc5c; pop {pc}
 * start=(base+3)&~3; end=(base+len)&~3 (both UNSIGNED). If start>end or
 * end-start<0x30 return 0; else func_0207dc5c(start, end, a2) (a2 threads through).
 * 1 saved reg + sub sp #4 + pop {pc} == sp3 -> *.legacy_sp3.c (mwcc 1.2/sp3).
 */

extern void *func_0207dc5c(void *start, unsigned int end, void *a2);

void *func_0207db00(unsigned int base, unsigned int len, void *a2) {
    unsigned int start = (base + 3) & ~3u;
    unsigned int end   = (base + len) & ~3u;
    if (start > end || (end - start) < 0x30) {
        return 0;
    }
    return func_0207dc5c((void *)start, end, a2);
}
