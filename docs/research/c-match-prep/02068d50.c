/* CAMPAIGN-PREP candidate for func_02068d50 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     signed :16 byteswap (asr#8); orr hi|lo (hi first picks dest); zero-ext to u16 arg
 *   risk:       orig holds a in r5, c in r6, d in r4 across the call to func_02054c0c then reuses; if mwcc reorders eval of the args vs the byteswap the temp regs rotate — permuter-class. +0x4C struct-guessed.
 *   confidence: med
 */
/* func_02068d50 @ 0x02068d50  (cls D, main) — resolve b via func_02054c0c, 16-bit signed
   byteswap of c, forward into func_02069454(&a->f4C, id, swapped, d). */
typedef unsigned char  u8;
typedef unsigned short u16;

extern int  func_02054c0c(const char *name);
extern void func_02069454(u8 *p, int id, u16 sw, int d);

typedef struct S { u8 pad[0x4C]; int f4C; } S; /* +0x4C */

void func_02068d50(S *a, const char *b, short c, int d)
{
    int id = func_02054c0c(b);
    int hi = ((int)c >> 8) & 0xFF;   /* signed short => asr#8 */
    int lo = ((int)c << 8) & 0xFF00;
    u16 sw = (u16)(hi | lo);
    func_02069454((u8 *)a + 0x4C, id, sw, d);
}
