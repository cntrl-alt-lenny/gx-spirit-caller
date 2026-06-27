/* CAMPAIGN-PREP candidate for func_0206a724 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: len guards; ands flag-test branch; strb-in-order; (src+0x400)+0xa8 ldrh path
 *   risk:       struct-guessed/reshape-able: the out2 pointer comes from a 2nd stack arg [sp,#0x10] in orig (not `out`); signature of that out2 and the +0x400/+0xa8 layout are inferred from raw offsets.
 *   confidence: low
 */
/* func_0206a724 — guard len>=5, copy 3 bytes to out, branch on bit 0x10 of src[0].
 *   if (len < 5) return;
 *   flag = src[0] & 0x10;
 *   out[0]=src[1]; out[1]=src[2]; out[2]=src[3]; out[3]=src[4];
 *   if (flag) { if (len-5 < 2) return; out2[0]=src[5]; out2[1]=src[6]; return; }
 *   else      { out2[0] = *(u16*)((char*)src + 0x400 + 0xa8); ... }
 * The flag==0 path reuses (src-region+0x400) base: ldrh [r0,#0xa8] where r0=base+0x400.
 * src[2],src[3] read via add r5,r1,#1 then [r5,#1],[r5,#2],[r5,#3] in the orig.
 */
typedef unsigned char u8;
typedef unsigned short u16;

int func_0206a724(u8 *src, int unused, int len, u8 *out)
{
    u8 *p1 = src + 1;
    int flag;
    if (len < 5)
        return 0;
    flag = src[0] & 0x10;
    out[0] = src[1];
    out[1] = p1[1];
    out[2] = p1[2];
    out[3] = p1[3];
    if (flag == 0) {
        u16 *q = (u16 *)((char *)src + 0x400);
        *(u16 *)out = *(u16 *)((char *)q + 0xa8);
        return 0;
    }
    if (len - 5 < 2)
        return 0;
    out[0] = src[5];
    out[1] = (src + 5)[1];
    return 0;
}
