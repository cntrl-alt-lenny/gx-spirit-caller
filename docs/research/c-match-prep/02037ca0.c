/* CAMPAIGN-PREP candidate for func_02037ca0 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     explicit Div() calls (not /-magic); lvl 0/1/2 from flag bits; asr#8 word, u16 half
 *   risk:       VERIFIED: lvl-derive, Div chain, asr#8, table indexing all match. ONE diff: orig smulbb r2,r0; mwcc-2.0/sp1p5 emits plain mul (tried (short)/(short) casts, no effect). NOT reshape-closeable -- instruction-selection; needs SP-rev or .s
 *   confidence: med
 */
/* func_02037ca0 (class D): obj at r0. lvl = 0/1/2 from obj[+0x34] bits
 * 0x1000000 / 0x2000000. if byte+0x28 == 0 return 0. base =
 * (sbyte+0x26 * ubyte+0x27); then chain three signed Div-by-0x7f scalings:
 *   v = Div(base, 0x7f);
 *   v = Div(v * (data_0219b3d0[lvl*4] >> 8), 0x7f);   // word table, asr 8
 *   v = Div(v * (u16)data_0219b3dc[lvl*8], 0x7f);     // halfword table
 * NOTE: orig literally calls the SDK Div(); do not emit a compiler /-magic. */

extern int Div(int num, int den);
extern unsigned char data_0219b3d0[];   /* int[]   indexed lvl*0x10 bytes */
extern unsigned char data_0219b3dc[];   /* short[] indexed lvl*0x10 bytes */

int func_02037ca0(unsigned char *obj) {
    int flags;
    int lvl;
    int v;

    flags = *(int *)(obj + 0x34);
    lvl = 0;
    if (flags & 0x1000000) {
        lvl = 1;
        if (flags & 0x2000000)
            lvl = 2;
    }

    if (obj[0x28] == 0)
        return 0;

    v = (short)(signed char)obj[0x26] * (short)(unsigned char)obj[0x27];
    v = Div(v, 0x7f);
    v = Div(v * (*(int *)(data_0219b3d0 + lvl * 0x10) >> 8), 0x7f);
    v = Div(v * *(unsigned short *)(data_0219b3dc + lvl * 0x10), 0x7f);
    return v;
}
