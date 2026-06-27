/* CAMPAIGN-PREP candidate for func_0200b250 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     counted loop; Fill32(0,dst,0x20) then field stores in asm order; strb/ldrsh field types
 *   risk:       store-order is fixed but the loop's pointer strength-reduction (first field via [base,i,lsl#5], rest via formed ptr) and the -1 (mvn) reg may rotate. struct-guessed (0x20 strides, pad word). reshape-able.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_0200b250 (main, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED.
 *   recipe:     Fill32(0,dst,0x20) then store fields in asm order; strb f0, ldrsh f4/f6; +arg2 on f8/f10
 *   risk:       see risk note
 */
/* func_0200b250: for i in [0,count): zero a 0x20-byte dst slot then copy/transform
   fields from src[i] into dst[i]; return 1. */

typedef struct {                /* dst slot, size 0x20 */
    unsigned char d0;           /* strb (byte of src word) */
    short d4;                   /* strh */
    short d6;                   /* strh */
    int   d8;                   /* arg2 + src.s8 */
    int   dc;
    int   d10;                  /* arg2 + src.s10 */
    int   d14;
    int   d18;                  /* = -1 */
    int   d1c;                  /* = src.s18 */
} Dst_b250;

typedef struct {                /* src slot, stride 0x20 */
    int   s0;                   /* ldr (low byte taken into dst.d0) */
    short s4;                   /* ldrsh */
    short s6;                   /* ldrsh */
    int   s8;
    int   sc;
    int   s10;
    int   s14;
    int   s18;
    int   pad;                  /* pad to 0x20 stride (lsl#5) */
} Src_b250;

extern void Fill32(int val, void *dst, int n);

int func_0200b250(Dst_b250 *dst, Src_b250 *src, int arg2, int count)
{
    int i;
    for (i = 0; i < count; i++) {
        Dst_b250 *d = &dst[i];
        Src_b250 *s = &src[i];
        Fill32(0, d, 0x20);
        d->d0  = (unsigned char)s->s0;
        d->d4  = s->s4;
        d->d6  = s->s6;
        d->d8  = arg2 + s->s8;
        d->dc  = s->sc;
        d->d10 = arg2 + s->s10;
        d->d14 = s->s14;
        d->d18 = -1;
        d->d1c = s->s18;
    }
    return 1;
}
