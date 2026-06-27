/* CAMPAIGN-PREP candidate for func_020a33a8 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     u8 count accumulate (and #0xff); mask&(2<<bit) mask-first; ordered byte/half/byte stores; f4b4++ RMW
 *   risk:       reshape-able: count as unsigned char gives the addne/andne #0xff accumulate; risk is the loop's `2<<bit` strength-reducing to a running mask (add r1,r1) vs the orig's per-iter lsl. struct-guessed offsets.
 *   confidence: med
 */
/* func_020a33a8 (main, class C) — call a helper, count set bits 1..15 of a
 * mask, then write a small block of struct fields.
 *   r0 = base, r1 = arg1, r2 = mask, r3 = arg3
 *
 * asm shape:
 *   func_020944a4(arg1, &base->f35e, 0x14a);   // 0x35e, 0x14a are .word consts
 *   count = 1;                                  // u8
 *   for (bit = 0; bit < 15; bit++)
 *       if (mask & (2 << bit)) count++;
 *   base->f358 = count;                          // byte
 *   base->f35a = (unsigned short)(mask | 1);     // half  (0x300+0x5a)
 *   base->f35c = (unsigned short)arg3;           // half  (0x300+0x5c)
 *   base->f4b4++;                                // byte
 *
 * count(r7) starts at 1 and accumulates as (count+1)&0xff -> u8.
 */

typedef struct {
    char           _pad000[0x358];
    unsigned char  f358;   /* +0x358 */
    char           _pad359;
    unsigned short f35a;   /* +0x35a */
    unsigned short f35c;   /* +0x35c */
    char           f35e;   /* +0x35e (passed by &) */
    char           _pad35f[0x4b4 - 0x35f];
    unsigned char  f4b4;   /* +0x4b4 */
} a33a8_base;

extern void func_020944a4(void *arg1, char *dst, int n);

void func_020a33a8(a33a8_base *base, void *arg1, int mask, int arg3)
{
    unsigned char count;
    int           bit;

    func_020944a4(arg1, &base->f35e, 0x14a);

    count = 1;
    for (bit = 0; bit < 15; bit++)
        if (mask & (2 << bit))
            count++;

    base->f358 = count;
    base->f35a = (unsigned short)(mask | 1);
    base->f35c = (unsigned short)arg3;
    base->f4b4++;
}
