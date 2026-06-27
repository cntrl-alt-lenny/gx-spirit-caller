/* CAMPAIGN-PREP candidate for func_022ae430 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     smull /25 as plain /0x19; lsl;lsr bitfields as &mask; range if-chains
 *   risk:       struct-guessed AND permuter-class: out-param layout of func_ov002_022a6e04 (which sp slots hold ix/iy/h) is inferred from later ldr offsets; the signed span/2 and /25 divides plus many cmp branches risk scheduling drift.
 *   confidence: low
 */
/* func_ov002_022ae430: hit-test. Early-out if [r6]==0 or [r6+0x3c]<=0.
 * Reads a global u16 at g+0x90, unpacks four bitfields, calls
 * func_ov002_022a6e04 (fills sp+8.. with ix/iy), recomputes from
 * [r6+0x3c]*0x19, then range-checks (r4 against ix-0x26..+0x18-... and
 * r5 against iy bands) returning a quotient+1, 0, or falling through. */

struct ht6 {
    unsigned short f0;      /* 0x00 */
    char pad02[0x3c - 0x02];
    int  f3c;               /* 0x3c */
};

extern int  data_ov002_022d1410[];  /* g; u16 at +0x90 */
extern int  data_ov002_022d1910[];
extern int  func_ov002_022a6e04(int *out, int a, int b, int c, int d);

int func_ov002_022ae430(struct ht6 *o, int px, int py) {
    int outbuf[8];   /* sp+0 region: [0]=arg, [2]=ix, [3]=iy passthrough */
    int ix;
    int iy;
    int count;
    int span;
    int lo;
    int q;
    unsigned int h;

    if (o->f0 == 0)
        return -1; /* asm: beq .L_140 (final fallthrough returns r0 undefined; modeled 0) */
    if (o->f3c <= 0)
        return -1;

    h = *(unsigned short *)((char *)data_ov002_022d1410 + 0x90);
    outbuf[0] = (h >> 6) & 0x3f;         /* (h<<0x12)>>0x18 */
    /* args: bit0 (h<<1f>>1f), 5-bit (h<<1a>>1b), full h stored at sp+4 */
    func_ov002_022a6e04(outbuf, (h >> 0) & 1, (h >> 2) & 0x1f, (int)h, 0);

    ix = outbuf[2];
    iy = outbuf[3];
    count = o->f3c;
    span = count * 0x19;
    lo = iy - 0x26;
    q = ix - (span / 2);            /* sub r2, ip, (count*0x19)/2 */

    if (py >= lo && py < lo + 0x18) {
        int d = px - q;
        if (d < 0 || d >= span)
            return -1;
        return d / 0x19 + 1;        /* smull magic /25; +1 */
    }
    if (py >= iy - 0xe && py < iy + 0xd) {
        unsigned int hh = ((unsigned int)(unsigned short)outbuf[1] >> 2) & 0x1f;
        if (hh < 0xa) {
            if (px < ix - 0xd || px >= ix + 0xd) return -1;
            return 0;
        }
        if (px < ix - 0xa || px >= ix + 0xa) return -1;
        return 0;
    }
    return -1;
}
