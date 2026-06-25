/* CAMPAIGN-PREP candidate for func_0209a1b8 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     flag-test early return (andne/movne); STORE-ORDER f4,f6,f8,fa exactly as asm
 *   risk:       reshape-able: orig interleaves loads/stores as ldrh f4,ldrh f6,strh,strh,ldrh f8,ldrh fa,strh,strh; if mwcc batches all 4 loads then 4 stores, split into two pairs. Minor; struct-guessed offsets.
 *   confidence: med
 */
/* func_0209a1b8 (main, class C/D) — wait-then-snapshot 4 halfwords.
 * f_02099c38(1); if (g.f34 & 1) return 1;  else copy g.f4,f6,f8,fa into
 * out[0..3] (halfword stores, source order f4->f6->f8->fa) and return 0.
 * g = data_021a8394; out=r0 held in r4 across the call. */

extern void func_02099c38(int);

typedef struct {
    char _p0[0x4];
    unsigned short f4;   /* +0x4 */
    unsigned short f6;   /* +0x6 */
    unsigned short f8;   /* +0x8 */
    unsigned short fa;   /* +0xa */
    char _pc[0x28];
    unsigned short f34;  /* +0x34 */
} Blk_a8394b;

extern Blk_a8394b data_021a8394;

int func_0209a1b8(unsigned short *out) {
    func_02099c38(1);
    if (data_021a8394.f34 & 1)
        return 1;
    out[0] = data_021a8394.f4;
    out[1] = data_021a8394.f6;
    out[2] = data_021a8394.f8;
    out[3] = data_021a8394.fa;
    return 0;
}
