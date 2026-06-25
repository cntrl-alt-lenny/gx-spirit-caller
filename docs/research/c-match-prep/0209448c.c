/* CAMPAIGN-PREP candidate for func_0209448c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     counted halfword-fill loop, byte-offset addressing (strlth predicated)
 *   risk:       mwcc must emit the predicated strlth/addlt/blt form rather than a plain cmp+branch loop; arg width of v (u16) assumed.
 *   confidence: med
 */
/* func_0209448c: counted halfword fill — writes v into the u16 array at p for
 * n bytes (index steps by 2). Single-statement loop -> predicated body. */
void func_0209448c(unsigned short v, void *p, int n) {
    int i;
    for (i = 0; i < n; i += 2)
        *(unsigned short *)((char *)p + i) = v;
}
