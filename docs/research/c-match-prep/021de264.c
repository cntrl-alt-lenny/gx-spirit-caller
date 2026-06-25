/* CAMPAIGN-PREP candidate for func_021de264 (ov004, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     thumb null-check then indirect call, return 0
 *   risk:       pointer bound to one local for cmp+blx; thumb frame mwcc-emitted; call discards result and returns 0
 *   confidence: high
 */
#pragma thumb on

/* Load the function pointer at data_ov004_022923d4; if non-null, call it
 * (result discarded); always return 0. Sibling of func_ov004_021de250. */
extern char data_ov004_022923d4[];

int func_ov004_021de264(void) {
    int (*f)(void) = *(int (**)(void))data_ov004_022923d4;
    if (f)
        f();
    return 0;
}
