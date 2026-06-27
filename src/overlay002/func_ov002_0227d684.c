/* CAMPAIGN-PREP candidate for func_0227d684 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: (u8) byte-pack lever => and;and;orr lsl#8 (NOT (x&0xff) which gives lsl#24;lsr#16); 1-a in r4
 *   risk:       the (u8)lo|((u8)hi<<8) cast is the verified byte-pack steer (brief 356/358); residual risk is the (u16) result truncation emitting lsl#16;lsr#16 (orig does) and whether mwcc keeps alt(=1-a) in a callee-saved reg across both calls. reshape-able (drop outer (u16) if it double-truncates).
 *   confidence: med
 */
/* func_ov002_0227d684 (ov002, class D) — two-path byte-pack. Confirmed sig from
 * sibling 0227d6f8.c: func_ov002_0227d684(int a, int b, int c) -> int (b unused).
 * Tries 0228cdc0(1-a, c, 0); on success packs (u16)((1-a)&0xff | (res&0xff)<<8).
 * Else tries 0228d0ac(a, c, 1); on <0 return -1; else pack (a&0xff|(res&0xff)<<8). */
typedef unsigned char  u8;
typedef unsigned short u16;

extern int func_ov002_0228cdc0(int a, int b, int c);
extern int func_ov002_0228d0ac(int a, int b, int c);

int func_ov002_0227d684(int a, int b, int c)
{
    int r;
    int alt = 1 - a;
    r = func_ov002_0228cdc0(alt, c, 0);
    if (r >= 0)
        return (u16)((u8)alt | ((u8)r << 8));
    r = func_ov002_0228d0ac(a, c, 1);
    if (r < 0)
        return -1;
    return (u16)((u8)a | ((u8)r << 8));
}
