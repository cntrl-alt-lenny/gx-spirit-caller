/* CAMPAIGN-PREP candidate for func_021b44d4 (ov017, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     counted MMIO-build loop; hoist hdr; 6-byte desc; func_02005dac 2-arg then func_020944a4 copy
 *   risk:       TWO diffs: (a) reshape-able: divisor is NOT /0x200 — target is asr#4 then /32, try `(p4>>4)/0x20` or `(p4/16)/32`; (b) permuter-class: mwcc strength-reduces (p0<<23); target re-shifts advancing sl.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov017_021b44d4 (ov017, class C, MED) — batch p_0138.
 * DISASM-CHECKED: NOT a match yet. Two divergences seen vs target (see risk):
 * (1) my `p4/0x200` emitted asr#8/lsr#23/asr#9 but target uses asr#4/lsr#27/asr#5;
 * (2) mwcc strength-reduced my (p0<<23) into a +0x10000000 accumulator, but target
 *     re-shifts the advancing sl each iteration. */

typedef unsigned int   u32;
typedef unsigned short u16;

extern int  func_02005dac(int a, int b);
extern void func_020944a4(void *dst, int src, int len);

void func_ov017_021b44d4(int p0, int p1, int p2, int p3, int p4) {
    int n;
    int i;
    int hdr;
    int ret;
    struct { u32 lo; u16 hi; } desc;

    n = p4 / 0x200;
    if (n <= 0) {
        return;
    }
    hdr = (p1 & 0xff) | 0x4000 | 0x80000000u;
    i = 0;
    do {
        desc.lo = hdr | (((u32)(p0 << 0x17)) >> 7);
        desc.hi = (u16)(p2 | (p3 << 0xc));
        ret = func_02005dac(2, 0);
        func_020944a4(&desc, ret, 6);
        i++;
        p0 += 0x20;
        p2 += 2;
    } while (i < n);
}
