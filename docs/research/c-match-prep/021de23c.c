/* CAMPAIGN-PREP candidate for func_021de23c (ov004, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Thumb indirect-call thunk via global fn-ptr, tail-forward arg
 *   risk:       MUST be *.thumb.c (mwcc 1.2/sp2p3 emits the push{lr};sub sp,#4 ... add sp,#4;pop{r3};bx r3 frame). blx via the global ptr must come from a non-inlined indirect call
 *   confidence: med
 */
/* func_ov004_021de23c: free-thunk — load the function pointer at data_ov004_022923dc
 * and tail-call it with the incoming arg (sibling of 021de250=alloc). Ships as
 * func_ov004_021de23c.thumb.c (mwcc 1.2/sp2p3 emits the ARMv4T interworking frame). */
#pragma thumb on
extern void (*const data_ov004_022923dc)(int x);
void func_ov004_021de23c(int x) {
    data_ov004_022923dc(x);
}
