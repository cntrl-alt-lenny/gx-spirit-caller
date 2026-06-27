/* CAMPAIGN-PREP candidate for func_0204152c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class C: bind self+0x19f4 to one ptr; recompute avail after grow; len-first cmp
 *   risk:       reshape-able: at .L_68 entry orig keeps r0=b->off,r1=avail live from both paths into func_0209150c args; if mwcc reloads b->off post-branch the merge ldr diverges (decl-order/CSE).
 *   confidence: med
 */
/* func_0204152c - main - class C
 * buffer-grow then formatted store; reg-alloc on len/avail
 * r4 = self+0x19f4 (Buf, bound to one local), r5=len, r6=arg1 src
 */
extern unsigned char data_020fe8e8[];
extern int func_020413b0(int self, void *buf, int grow);
extern int func_0209150c(int dst, int avail, void *fmt, void *args); /* vsnprintf-like */
extern int func_020aaddc(void *s);  /* strlen-like */

typedef struct {
    int a;     /* +0x0 */
    int off;   /* +0x4 */
    int end;   /* +0x8 */
} Buf;

int func_0204152c(int self, void *src)
{
    Buf *b;
    int len;
    int avail;

    b = (Buf *)(self + 0x19f4);
    len = func_020aaddc(src);
    avail = b->end - b->off;
    if (len > avail) {
        if (func_020413b0(self, b, (len - avail) + 1) == 0)
            return 1;
        avail = b->end - b->off;
    }
    if (func_0209150c(b->off, avail, data_020fe8e8, src) == len) {
        b->off = b->off + len;
        return 0;
    }
    return 1;
}
