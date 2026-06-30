/* CAMPAIGN-PREP candidate for func_0207dd84 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     magic-compare validator: two early-out guards + ==0x100 bool, leaf
 *   risk:       two literal-pool words must land in order (0x4352414e, 0x0000fffe); ldrh sign/zero of f4 read; movne/moveq bool tail shape; field offsets guessed
 *   confidence: med
 */
/* func_0207dd84 (main, class A, 0x44) — magic-compare validator returning bool.
 *   ldr r2,[r0]; ldr r1,=0x4352414e; cmp r2,r1; movne r0,#0; bxne lr;
 *   ldrh r2,[r0,#4]; ldr r1,=0x0000fffe; cmp r2,r1; movne r0,#0; bxne lr;
 *   ldrh r0,[r0,#6]; cmp r0,#0x100; moveq r0,#1; movne r0,#0; bx lr
 * return hdr->magic==0x4352414e && hdr->ver==0xfffe && hdr->n==0x100.
 * Leaf, no frame -> default .c (mwcc 2.0/sp1p5).
 */

typedef struct {
    unsigned int    magic;          /* +0x00 */
    unsigned short  ver;            /* +0x04 */
    unsigned short  n;              /* +0x06 */
} hdr_0207de6c_t;

int func_0207dd84(hdr_0207de6c_t *hdr) {
    if (hdr->magic != 0x4352414e) {
        return 0;
    }
    if (hdr->ver != 0xfffe) {
        return 0;
    }
    return hdr->n == 0x100;
}
