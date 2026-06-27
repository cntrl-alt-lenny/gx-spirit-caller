/* CAMPAIGN-PREP candidate for func_020808b8 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: store-order EXACT — f4,f8,fc,f0,f14,f18,f1c,f10 (interleaved stack reloads); fc is a byte store
 *   risk:       reshape-able: keep statements in this precise order (f0 stored AFTER fc; f10 stored LAST) or mwcc reorders the str/ldr interleave. p0..pc are extra stack params; if their declared types/widths are wrong the ldr offsets shift.
 *   confidence: med
 */
/* func_020808b8: scatter the marshalled arg block into a struct in the asm's
 * exact store order. r0 dst, r1 a, r2 b, r3 c, then 4 stack words at sp+0/4/8/c
 * (the caller-pushed extra args) plus packed byte at sp+0 -> dst+0xc. */
typedef struct {
    int   f0;    /* +0x00 <- r1 */
    int   f4;    /* +0x04 <- r2 */
    int   f8;    /* +0x08 <- r3 */
    unsigned char fc; /* +0x0c <- (byte) sp+0 */
    unsigned char pad_d[3];
    int   f10;   /* +0x10 <- sp+0x10 */
    int   f14;   /* +0x14 <- sp+0x4 */
    int   f18;   /* +0x18 <- sp+0x8 */
    int   f1c;   /* +0x1c <- sp+0xc */
} Rec;

void func_020808b8(Rec *dst, int a, int b, int c, int p0, int p4, int p8, int pc, int p10) {
    dst->f4 = b;
    dst->f8 = c;
    dst->fc = (unsigned char)p0;
    dst->f0 = a;
    dst->f14 = p4;
    dst->f18 = p8;
    dst->f1c = pc;
    dst->f10 = p10;
}
