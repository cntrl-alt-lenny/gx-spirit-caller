/* CAMPAIGN-PREP candidate for func_0223df38 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     shared slot/record vocabulary; raw asymmetric shifts; min/max via if-assign; signed mod
 *   risk:       extreme liveness (78 insns, ip/lr juggled): even with correct logic the register colouring will diverge. Also _LIT1/_LIT3 (0x868 / cf16c / d0250 indexing) struct-guessed. permuter-class + struct-guessed.
 *   confidence: low
 */
/* func_ov002_0223df38: resolve a slot (arr8[idx] or ce720[(f18+idx-5)%%128]),
 * optionally export its (bit0,bits1-4) pair to *out, then a multi-stage
 * validity predicate over the per-player record. Returns 1/0. Dense liveness. */
typedef unsigned char  u8;
typedef unsigned short u16;

struct Node0223df38 {
    u16 f0;
    u16 f2;
    u16 f4;
    struct { u16 lo:8; u16 hi:8; } hdr;   /* +6 */
    u16 arr8[5];                          /* +8 */
    u16 f18;                              /* +0x12 */
};

extern u16  data_ov002_022ce720[];
extern char data_ov002_022cf16c[];
extern u16  data_ov002_022d0250[];

int func_ov002_0223df38(struct Node0223df38 *self, int idx, int *out) {
    u16 *p;
    u16 sv;
    int b1_4, bit0, hi, lo, mx;
    int rec, w, cmpv, exp;
    char *base;
    if (idx < 5) {
        p = &self->arr8[idx];
    } else {
        int n = (self->f18 + idx - 5) % 128;
        p = &data_ov002_022ce720[n];
    }
    if (out != 0) {
        sv = *p;
        *out = (u16)(((unsigned)((u16)sv << 31) >> 31) | (((unsigned)((u16)sv << 27) >> 28) << 8));
    }
    hi = (unsigned)((u16)self->hdr << 16) >> 24;
    lo = (unsigned)((u16)self->hdr << 24) >> 24;
    mx = hi;
    if (hi <= lo) mx = lo;
    if (idx >= mx) return 0;
    sv = *p;
    b1_4 = (unsigned)((u16)sv << 27) >> 28;
    if (b1_4 > 10) return 0;
    bit0 = (unsigned)((u16)sv << 31) >> 31;
    base = data_ov002_022cf16c + (bit0 & 1) * 0x868;
    rec = *(int *)(base + b1_4 * 20 + 0x30);
    if (((unsigned)(rec << 19) >> 19) == 0) return 0;
    w = *(int *)(base + 0x30 + b1_4 * 20);
    exp = (unsigned)((u16)sv << 18) >> 23;
    cmpv = ((unsigned)((u16)w << 2) >> 24) * 2 + ((unsigned)((u16)w << 18) >> 31);
    if (exp != cmpv) return 0;
    w = (unsigned)((u16)data_ov002_022d0250[exp << 1] << 17) >> 30;
    if (((unsigned)((u16)sv << 16) >> 30) == w) return 1;
    return 0;
}
