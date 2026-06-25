/* CAMPAIGN-PREP candidate for func_021de250 (ov004, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     thumb indirect-call thunk via global fn-ptr, tail return
 *   risk:       thumb frame (sub sp,#4 / pop {r3}; bx r3) is mwcc-emitted; signature of the called fn-ptr is a guess (void->int)
 *   confidence: high
 */
#pragma thumb on

/* Indirect-call thunk: load the function pointer stored at
 * data_ov004_022923d0, call it with no arguments, return its result.
 * Sibling of func_ov004_021dbf48 which calls through the same global. */
extern char data_ov004_022923d0[];

int func_ov004_021de250(void) {
    return (*(int (**)(void))data_ov004_022923d0)();
}
