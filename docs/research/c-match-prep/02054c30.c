/* CAMPAIGN-PREP candidate for func_02054c30 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     byte marshal around call + reload + tail call
 *   risk:       func_02054ea8/func_0206eb4c return types assumed int; *a2 store width (str) vs strb
 *   confidence: high
 */
/* func_02054c30: copy low byte of *a2 into *a1, call func_0206eb4c(a0),
 * reload the byte from *a1 and store it (zero-extended) back into *a2,
 * then tail func_02054ea8(result, -1). a1 byte is RELOADED after the
 * call. */

extern int func_0206eb4c(int a0);
extern int func_02054ea8(int a0, int a1);

int func_02054c30(int a0, unsigned char *a1, int *a2) {
    int r;

    *a1 = (unsigned char)*a2;
    r = func_0206eb4c(a0);
    *a2 = *a1;
    return func_02054ea8(r, -1);
}
