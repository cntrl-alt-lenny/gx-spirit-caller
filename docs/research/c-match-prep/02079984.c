/* CAMPAIGN-PREP candidate for func_02079984 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     do/while(i<n) guarded by if(n>0); mla via u16*u32+carry; tail memset
 *   risk:       tail `if(i<count){dst[i]=carry;i++;}` is fully PREDICATED in orig (movlt/addlt/strlth with `sub count-i` interleaved); if mwcc branches instead of if-converting, the whole tail diverges. permuter-class (scheduling/if-conversion).
 *   confidence: med
 */
/* func_02079984: scalar*vector multiply with 16-bit carry propagate.
 * r0=dst(r7), r1=src(r6), r2=scalar(r5), r3=count(r4).
 * n = func_02079e20(src, count);   // n = significant halfword length
 * for(i=0;i<n;i++){ acc = src[i]*scalar + carry; dst[i]=acc; carry=acc>>16; }
 * if(i<count){ dst[i]=carry; i++; }
 * func_020945f4(dst+i, 0, (count-i)*2);   // zero remaining halfwords
 */
extern int func_02079e20(unsigned short *src, int count);
extern void func_020945f4(void *p, int b, int n);

void func_02079984(unsigned short *dst, unsigned short *src, unsigned int scalar, int count) {
    int n;
    int i;
    unsigned int carry;

    n = func_02079e20(src, count);
    carry = 0;
    i = 0;
    if (n > 0) {
        do {
            unsigned int acc = (unsigned int)src[i] * scalar + carry;
            dst[i] = (unsigned short)acc;
            i++;
            carry = acc >> 16;
        } while (i < n);
    }
    if (i < count) {
        dst[i] = (unsigned short)carry;
        i++;
    }
    func_020945f4(dst + i, 0, (count - i) * 2);
}
