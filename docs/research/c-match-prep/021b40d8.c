/* CAMPAIGN-PREP candidate for func_021b40d8 (ov017, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: smull 0x66666667 -> signed /10 & %10; two loop bodies; tile (d+0x27c)|0x1400
 *   risk:       permuter-class: the two near-identical bodies allocate r6/r7/fp(=0/2/sp) in SWAPPED registers between modes - whole-function register rotation across r6..fp will likely diverge even with matching C. Also `add fp,sp,#0` vs `add r0,sp,#0` for the 020944a4 buf arg differs per mode. /10 div recipe itself should match.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov017_021b40d8 (ov017, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED.
 *   recipe: CLASS D: smull 0x66666667 -> plain signed '/10' and '%10'; two near-identical loop bodies (count==0 -> while(val>0); else -> for count); pack tile = digit+0x27c|0x1400; pack word hdr|((x<<23)>>7).
 */
/* func_ov017_021b40d8: render the decimal digits of `val`(r1) as 6-byte sprite
 * tile commands, advancing an X field (r2) left by 8 each digit. arg4&0xff is
 * a palette/flags byte ORed with 0x40000000 into the word header. If count
 * (arg5 @ sp) == 0, emit every digit until val reaches 0; else emit exactly
 * `count` digits. Returns the final X (r9). */

extern int  func_02005dac(int a, int b);                 /* build/alloc, ret handle */
extern void func_020944a4(void *src, int handle, int len);

int func_ov017_021b40d8(int a0, int val, int x, int flags, int count)
{
    unsigned char buf[8];   /* sp: word @0, halfword @4 */
    int hdr;

    if (count == 0) {
        hdr = (flags & 0xff) | 0x40000000;
        do {
            int digit = val % 10;
            int ret;
            *(unsigned short *)&buf[4] = (unsigned short)((digit + 0x27c) | 0x1400);
            x -= 8;
            *(unsigned int *)&buf[0] = hdr | (((unsigned int)(x << 23)) >> 7);
            val = val / 10;
            ret = func_02005dac(2, 0);
            func_020944a4(buf, ret, 6);
        } while (val > 0);
    } else {
        hdr = (flags & 0xff) | 0x40000000;
        do {
            int digit = val % 10;
            int ret;
            *(unsigned short *)&buf[4] = (unsigned short)((digit + 0x27c) | 0x1400);
            val = val / 10;
            x -= 8;
            *(unsigned int *)&buf[0] = hdr | (((unsigned int)(x << 23)) >> 7);
            ret = func_02005dac(2, 0);
            func_020944a4(buf, ret, 6);
        } while (--count > 0);
    }
    return x;
}
