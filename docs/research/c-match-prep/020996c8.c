/* CAMPAIGN-PREP candidate for func_020996c8 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     literal-pool struct initializer (MD5 IV) (A)
 *   risk:       interleave of pool loads vs stores may reorder; tail zero-stores (f14/f18/f1c) could coalesce
 *   confidence: high
 */
/* func_020996c8: initialize an MD5-style state block with the standard IV
 * (A,B,C,D = 0x67452301, 0xefcdab89, 0x98badcfe, 0x10325476) plus a 5th word
 * 0xc3d2e1f0, then zero three trailing counters (f14,f18,f1c). Literal-pool
 * constant initializer in field order. */

typedef struct {
    unsigned int f_0;    /* +0x00 */
    unsigned int f_4;    /* +0x04 */
    unsigned int f_8;    /* +0x08 */
    unsigned int f_c;    /* +0x0c */
    unsigned int f_10;   /* +0x10 */
    unsigned int f_14;   /* +0x14 */
    unsigned int f_18;   /* +0x18 */
    unsigned int f_1c;   /* +0x1c */
} St_020996c8;

void func_020996c8(St_020996c8 *p) {
    p->f_0  = 0x67452301;
    p->f_4  = 0xefcdab89;
    p->f_8  = 0x98badcfe;
    p->f_c  = 0x10325476;
    p->f_10 = 0xc3d2e1f0;
    p->f_14 = 0;
    p->f_18 = 0;
    p->f_1c = 0;
}
