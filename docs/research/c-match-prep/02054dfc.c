/* CAMPAIGN-PREP candidate for func_02054dfc (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     u16 early-return guard + unrolled byte copy + tail call
 *   risk:       the ldrh-guard fold (addeq sp/moveq r0/ldmeq) and loop unroll shape may not match; src struct layout guessed
 *   confidence: low
 */
/* func_02054dfc: like 02054db8 but guarded by a u16 at src+2: if 0, return 0.
 * Then copy 8 bytes (4x2 unrolled), buf[0]=b, func_0206eea0(<r0>,&buf); func_02054ea8(<ret>,-1).
 */

extern int func_0206eea0(int a1, unsigned char *buf);
extern int func_02054ea8(int handle, int v);

typedef struct { unsigned char b0; unsigned char b1; unsigned short n; } Src;

int func_02054dfc(int a1, Src *src, int b) {
    unsigned char buf[8];
    unsigned char *s = (unsigned char *)src;
    int i;
    if (src->n == 0) return 0;
    for (i = 0; i < 4; i++) {
        buf[i*2]   = s[i*2];
        buf[i*2+1] = s[i*2+1];
    }
    buf[0] = (unsigned char)b;
    return func_02054ea8(func_0206eea0(a1, buf), -1);
}
