/* CAMPAIGN-PREP candidate for func_021cb778 (ov004, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     signed /0x20,/2,/0x80 as plain '/'; held base r7; manual 2-word store-order
 *   risk:       permuter-class: two in-loop signed divides (acc/2, p/0x80) plus held base each emit add-shift-asr triples whose reg pairing is a coin-flip — sibling 021cde38/021ceb84 already walled to .s in brief 302.
 *   confidence: low
 */
/* func_ov004_021cb778 (ov004, class C): counted sprite loop, two signed divides.
 * n = a4/0x20; if(n<=0) return; base = ((a2*a4)<<4)/2 + 0xc80;
 * attrlo = (a1&0xff)|0x4000|0x80000000.  loop i:0..n-1, acc(=r5)+=0x200:
 *   p = base + acc/2; t = p/0x80;
 *   rec.attr01 = attrlo | ((a0&0x1ff)<<16); a0 += 0x20;
 *   rec.attr2  = t | 0x800 | (a3<<12);
 *   slot = func_02005dac(2,0); slot[0]=rec.attr01; slot[1]=rec.attr2 (manual 2-word). */
extern void *func_02005dac(int which, int idx);

void func_ov004_021cb778(int a0, int a1, int a2, int a3, int a4) {
    int n = a4 / 0x20;
    if (n > 0) {
        int attrlo = (a1 & 0xff) | 0x4000 | 0x80000000u;
        int base = ((a2 * a4) << 4) / 2 + 0xc80;
        int acc = 0;
        int i;
        for (i = 0; i < n; i++) {
            int p = base + acc / 2;
            int t = p / 0x80;
            unsigned int attr01 = attrlo | (((unsigned int)a0 & 0x1ff) << 16);
            unsigned int attr2  = (t | 0x800) | (a3 << 12);
            unsigned int *slot = (unsigned int *)func_02005dac(2, 0);
            slot[0] = attr01;
            slot[1] = attr2;
            a0 += 0x20;
            acc += 0x200;
        }
    }
}
