/* CAMPAIGN-PREP candidate for func_0204ce3c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     two accessor results (a/b) + halfword read + stack-arg call + clear f204
 *   risk:       f24/fa4(u16)/f204 offsets; a held in r4 across second acc(); ret returned
 *   confidence: med
 */
/* func_0204ce3c: a=acc(); b=acc();
 * r = func_0204ead0(5, a0, a->f24, b->fa4, 0, 0); (last two args on stack)
 * acc()->f204 = 0; return r.  fa4 is a u16 (ldrh). a's f24 read via the
 * first accessor result held across the second accessor call. */

typedef struct {
    char           _pad0[0x24];
    int            f24;  /* +0x24 */
    char           _pad1[0x7c];
    unsigned short fa4;  /* +0xa4 (halfword) */
    char           _pad2[0x15e];
    int            f204; /* +0x204 */
} State0204ce3c;

extern State0204ce3c *func_020498f0(void);
extern int func_0204ead0(int a, int b, int c, int d, int e, int f);

int func_0204ce3c(int a0) {
    State0204ce3c *a = func_020498f0();
    int r = func_0204ead0(5, a0, a->f24, func_020498f0()->fa4, 0, 0);
    func_020498f0()->f204 = 0;
    return r;
}
