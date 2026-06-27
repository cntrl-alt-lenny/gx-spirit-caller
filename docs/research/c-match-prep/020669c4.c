/* CAMPAIGN-PREP candidate for func_020669c4 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     store-order: forwarded a0/a1, ordered len/ptr locals, if-nest matches movne guards
 *   risk:       orig packs ptr0=r4,len0=r7,ptr1=lr,ptr2=ip across blocks (ptr in caller-saved, len in callee-saved); mwcc's reg/decl assignment will likely differ — permuter-class.
 *   confidence: low
 */
/* func_020669c4 @ 0x020669c4  (cls D, main) — 3 unrolled length-prefixed field parses,
   early-return tails when remaining count drops below threshold, then tail-call to a 8-arg sink.
   r0/r1 are passed straight through untouched -> opaque forwarded args.
   Each block: need n>=k; len=*p++; n--; if len==0 leave ptr=0; elif len!=0xFF: ptr=p, p+=len, n-=len.
   Sink: func_02066a88(a0,a1, len0,ptr0, len1,ptr1, len2,ptr2). */
typedef unsigned char u8;
extern void func_02066a88(int a0, int a1, int len0, u8 *ptr0, int len1, u8 *ptr1, int len2, u8 *ptr2);

void func_020669c4(int a0, int a1, u8 *p, int n)
{
    u8 *ptr0 = 0;
    u8 *ptr1 = 0;
    u8 *ptr2 = 0;
    int len0 = 0;
    int len1 = 0;
    int len2 = 0;

    if (n < 3) return;
    len0 = *p++;
    n--;
    if (len0 != 0) {
        if (len0 != 0xFF) {
            ptr0 = p;
            p += len0;
            n -= len0;
        }
    }

    if (n < 2) return;
    len1 = *p++;
    n--;
    if (len1 != 0) {
        if (len1 != 0xFF) {
            ptr1 = p;
            p += len1;
            n -= len1;
        }
    }

    if (n < 1) return;
    len2 = *p;
    n--;
    if (len2 != 0) {
        if (len2 != 0xFF) {
            ptr2 = p + 1;
            n -= len2;
        }
    }

    if (n < 0) return;
    func_02066a88(a0, a1, len0, ptr0, len1, ptr1, len2, ptr2);
}
