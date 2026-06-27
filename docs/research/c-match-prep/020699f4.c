/* CAMPAIGN-PREP candidate for func_020699f4 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: early-return guard; strb-in-order marshal; reload as halfword+word; -1 compare
 *   risk:       reshape-able: orig stages buf4 at sp+4 and buf2 at sp+0 (buf2 lower) — local decl order (buf2 before buf4) may need swapping to match the two stack slots; src[5] via add-r3 may differ if written src[5].
 *   confidence: med
 */
/* func_020699f4 — guard len>=6, marshal a 6-byte record onto the stack
 * (4 bytes -> halfword/word slots), look it up, and if found run a callback.
 *   if (len < 6) return 4;
 *   buf4[0..3] = src[0..3]; buf2[0..1] = src[4], src[5];
 *   h = *(u16*)buf2; w = *(u32*)buf4;
 *   if (func_0206b6fc(ctx, h, w) == -1) return 0;
 *   func_0206b670(ctx); return 0;
 * src[5] is read as *(src+4 +1) in the orig (add r3,r1,#4 ; ldrb [r3,#1]).
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

extern int func_0206b6fc(void *ctx, int h, int w);
extern int func_0206b670(void *ctx);

int func_020699f4(void *ctx, u8 *src, int len)
{
    u8 buf4[4];
    u8 buf2[2];
    if (len < 6)
        return 4;
    buf4[0] = src[0];
    buf4[1] = src[1];
    buf4[2] = src[2];
    buf4[3] = src[3];
    buf2[0] = src[4];
    buf2[1] = (src + 4)[1];
    if (func_0206b6fc(ctx, *(u16 *)buf2, *(u32 *)buf4) == -1)
        return 0;
    func_0206b670(ctx);
    return 0;
}
