/* CAMPAIGN-PREP candidate for func_0206b06c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     null-default (movs/ldreq) + strlen+1 + memcpy + advance two cursors
 *   risk:       None observed: byte-exact under sp3. func_020aaddc=strlen / func_020a7368=memcpy inferred from usage. Route .legacy_sp3.c.
 *   confidence: high
 */
/* func_0206b06c -> route as func_0206b06c.legacy_sp3.c (mwcc 1.2/sp3).
 * Copy a NUL-terminated string and advance two cursors: if src is null use
 * the default string data_02101df8; n = strlen(src)+1; memcpy(*pdst, src, n);
 * *padv += n; *pdst += n. VERIFIED byte-exact under sp3, incl. the
 * movs r7,r1 / ldreq r7,=data idiom and the literal pool. */
extern char data_02101df8[];
extern int  func_020aaddc(char *s);                       /* strlen */
extern void func_020a7368(char *dst, char *src, int n);   /* memcpy */

void func_0206b06c(char **pdst, char *src, int *padv) {
    int n;
    if (src == 0) src = data_02101df8;
    n = func_020aaddc(src) + 1;
    func_020a7368(*pdst, src, n);
    *padv += n;
    *pdst += n;
}
