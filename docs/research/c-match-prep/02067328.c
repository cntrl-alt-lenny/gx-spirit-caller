/* CAMPAIGN-PREP candidate for func_02067328 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     GUARD/BRANCH-TAIL bounds checks + count-store-before-buf-store
 *   risk:       Signed vs unsigned on the 0xfe/1 compares; buf base+index addressing (`strb r1,[r0,r3]`) may need char[] vs ptr; count store ordering.
 *   confidence: med
 */
/* func_02067328: bounds-guarded byte append. If count>=0xfe or
 * v<1 or v>0xfe, bail. Else store incremented count first, then
 * write v at buf[old_count] (matches str-then-strb order). */

typedef struct {
    unsigned char buf[0x100];  /* +0x00 */
    int           count;       /* +0x100 */
} buf_02067328_t;

void func_02067328(buf_02067328_t *p, int v) {
    int n;
    if (p->count >= 0xfe) return;
    if (v < 1) return;
    if (v > 0xfe) return;
    n = p->count;
    p->count = n + 1;
    p->buf[n] = (unsigned char)v;
}
