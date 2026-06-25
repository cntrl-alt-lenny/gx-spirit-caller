/* CAMPAIGN-PREP candidate for func_021b2a8c (ov016, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     signed /512 magic => plain '/512'; hoist hdr; orr operand-first for dest reg; counted loop
 *   risk:       reshape-able/permuter-class: stack-temp packing order (str r3@sp / strh r2@sp+4) plus r4=count holding may need a struct buf to fix store-order; the f02005dac arg signature (literals 2,0) is inferred. Loop reg-alloc of sl/r9 increments may rotate.
 *   confidence: low
 */
/* func_ov016_021b2a8c (ov016, class C) — counted loop emitting bit-packed
 * GX command words. clone of 021b2a48.
 * 5th arg on stack (sp+0x30 after 10-reg push). count = arg5 / 512
 * (signed: mov asr#4; add x,(asr#4)>>27; asr#5 == divide by 2^9).
 * Per-iter: pack r3 = 0x80004000 | (r1&0xff>>... actually (sl<<23)>>7)
 * and call f02005dac then f020944a4(stackbuf, ret, 6).
 */
extern int  func_02005dac(int a, int b, int *pkt);
extern void func_020944a4(void *src, int n, int len);

void func_ov016_021b2a8c(unsigned int sl, unsigned int color, int r9, int r8, int arg5) {
    int count = arg5 / 512;
    int i;
    unsigned int hdr;
    unsigned char buf[8];

    if (count <= 0) return;

    hdr = (color & 0xff) | 0x4000u | 0x80000000u;

    for (i = 0; i < count; i++) {
        int ret;
        *(unsigned int *)&buf[0]  = hdr | ((sl << 23) >> 7);
        *(unsigned short *)&buf[4] = (unsigned short)((r9 | 0x800) | (r8 << 12));
        ret = func_02005dac(2, 0, (int *)&buf[0]);
        func_020944a4(&buf[0], ret, 6);
        sl += 0x20;
        r9 += 2;
    }
}
