/* CAMPAIGN-PREP candidate for func_020341b0 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Class D: &0x7ff mask + u16 (lsl16;lsr16) truncation; (x+3)&~3 align
 *   risk:       Orig binds rec=buf+off (r5) once and reuses for both the +4 load and the call; if mwcc recomputes buf+off the add diverges. The padded-size is computed twice (call+stride) — must NOT CSE into one. Both reshape-able via explicit rec local; arg2/arg3 of func_0203251c struct/sig-guessed.
 *   confidence: med
 */
/* func_020341b0: iterate variable-stride records inside a buffer of length
 * `len` (must be > 8). Each record at byte-offset off: hdr.id = halfword&0x7ff;
 * if id!=0 call func_02032350() then func_0203251c(id2, ctx, &rec, len2) where
 * len2 = ((rec.size + 3) & ~3) + 8 (u16). Advance off by that same padded size;
 * loop while off+8 < len. The +3/&~3/+8 padding appears twice (call arg + stride)
 * and is a u16 (lsl#16;lsr#16) each time.
 */
extern int func_02032350(void);
extern void func_0203251c(int a, void *ctx, void *rec, unsigned short n);

struct Rec_20341b0 {
    unsigned short id;     /* +0x0, masked with 0x7ff */
    unsigned short size;   /* +0x4 ... but +0x4 read, see note */
};

int func_020341b0(void *ctx, unsigned char *buf, unsigned int len) {
    unsigned int off = 0;
    if (len <= 8) return 0;
    do {
        unsigned char *rec = buf + off;
        unsigned short id = (unsigned short)(*(unsigned short *)(buf + off) & 0x7ff);
        unsigned short pad;
        if (id != 0) {
            func_02032350();
            pad = (unsigned short)(((*(unsigned short *)(rec + 4) + 3) & ~3) + 8);
            func_0203251c(pad, ctx, rec, pad);
        }
        off += ((*(unsigned short *)(rec + 4) + 3) & ~3) + 8;
    } while (off + 8 < len);
    return 0;
}
