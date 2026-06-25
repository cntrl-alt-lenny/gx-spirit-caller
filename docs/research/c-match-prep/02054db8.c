/* CAMPAIGN-PREP candidate for func_02054db8 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     unrolled byte-copy loop + buffer + tail call
 *   risk:       mwcc may not 2x-unroll the loop identically (lr counter, post-inc ldrb/strb pairs); buffer size/scheduling may differ
 *   confidence: low
 */
/* func_02054db8: copy 8 bytes from p1 into an 8-byte stack buffer (unrolled 4x2),
 * overwrite buf[0] with byte b, then func_0206ee40(<r0>, &buf); func_02054ea8(<ret>, -1).
 * Loop reads pairs: strb b at sp AFTER the copy => buf[0]=b.
 */

extern int func_0206ee40(int a1, unsigned char *buf);
extern int func_02054ea8(int handle, int v);

int func_02054db8(int a1, unsigned char *src, int b) {
    unsigned char buf[8];
    int i;
    for (i = 0; i < 4; i++) {
        buf[i*2]   = src[i*2];
        buf[i*2+1] = src[i*2+1];
    }
    buf[0] = (unsigned char)b;
    return func_02054ea8(func_0206ee40(a1, buf), -1);
}
