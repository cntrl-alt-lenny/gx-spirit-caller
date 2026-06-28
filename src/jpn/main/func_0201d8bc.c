/* CAMPAIGN-PREP candidate for func_0201d8bc (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     GUARD tail-call + jump-table forwarding args; case4=fall-through
 *   risk:       the 0xfff00000 mask must come from rsb of #0x100000; arg-shuffle reg order (r4-r7) may differ
 *   confidence: high
 */
/* func_0201d8bc: early-out wrapper then jump-table dispatch (cmp #8) forwarding
 * (a0, a2, a3) to one of 9 handlers. case 4 + default fall off the end (bare
 * return, value = leftover) -- so NO trailing 'return 0'. First: if the high
 * 12 bits of a2 are set, tail-call func_020943b0(a0, a2, a3). Then an
 * unconditional func_0209281c(a0, a3) before dispatch. */

extern int func_0208f908(int a0, int a1, int a2);
extern int func_0208f970(int a0, int a1, int a2);
extern int func_0208f9d8(int a0, int a1, int a2);
extern int func_0208fa40(int a0, int a1, int a2);
extern int func_0208faa8(int a0, int a1, int a2);
extern int func_0208fb10(int a0, int a1, int a2);
extern int func_0208fb78(int a0, int a1, int a2);
extern int func_0208fbe0(int a0, int a1, int a2);
extern int func_0209281c(int a0, int a1);
extern int func_020943b0(int a0, int a1, int a2);

int func_0201d8bc(int a0, int sel, int a2, int a3) {
    if (a2 & 0xfff00000) {
        return func_020943b0(a0, a2, a3);
    }
    func_0209281c(a0, a3);
    switch (sel) {
    case 0: return func_0208fbe0(a0, a2, a3);
    case 1: return func_0208fb10(a0, a2, a3);
    case 2: return func_0208fa40(a0, a2, a3);
    case 3: return func_0208f970(a0, a2, a3);
    case 5: return func_0208fb78(a0, a2, a3);
    case 6: return func_0208faa8(a0, a2, a3);
    case 7: return func_0208f9d8(a0, a2, a3);
    case 8: return func_0208f908(a0, a2, a3);
    }
    /* case 4 + default: bare return (r0 = func_0209281c result), no mov #0 */
}
