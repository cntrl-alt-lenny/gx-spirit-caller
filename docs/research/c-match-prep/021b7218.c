/* CAMPAIGN-PREP candidate for func_021b7218 (ov010, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     explicit divmod helper (var divisor); /2 signed plain; bind f8; (hi<<8)|lo pack; subs-mi if-clamp
 *   risk:       reshape-able: f8 must bind into both subtract and divisor (orig single ldr r1); if mwcc reloads B+8 a 2nd ldr diverges -- keep the f8 local.
 *   confidence: med
 */
/* func_ov010_021b7218: subtract-clamp a counter, then drive sub-engine BLDCNT/BLDALPHA
 * (0x04001040/0x44) from a divmod-by-helper + /2 pack; branch tail clears B->f8.
 *
 *   subs r0,[A+0x18],arg ; str ; if(<0) B->fc=0
 *   q = func_020b3870((B->f8 - B->fc)*0x97, B->f8); h = q/2 (signed)
 *   *0x04001040 = 0x4e4 ; *0x04001044 = ((0x6f-h)<<8 &0xff00)|((h+0x6f)&0xff)
 *   if (B->fc) return 0; else 2nd MMIO pair + B->f8=0; return 1
 */

extern int func_020b3870(int a, int b);          /* signed div, quotient in r0 */
extern char data_ov010_021b9884[];               /* A: field +0x18 */
extern char data_ov010_021b9890[];               /* B: fields +0x8, +0xc */

int func_ov010_021b7218(int delta) {
    int v;
    int f8, fc, q, h;
    v = *(int *)(data_ov010_021b9884 + 0x18) - delta;
    *(int *)(data_ov010_021b9884 + 0x18) = v;
    if (v < 0) *(int *)(data_ov010_021b9890 + 0xc) = 0;
    f8 = *(int *)(data_ov010_021b9890 + 0x8);
    fc = *(int *)(data_ov010_021b9890 + 0xc);
    q = func_020b3870((f8 - fc) * 0x97, f8);
    h = q / 2;
    *(volatile unsigned short *)0x04001040 = 0x4e4;
    *(volatile unsigned short *)0x04001044 =
        (unsigned short)((((0x6f - h) << 8) & 0xff00) | ((h + 0x6f) & 0xff));
    if (*(int *)(data_ov010_021b9890 + 0xc) != 0) return 0;
    *(volatile unsigned short *)0x04001040 = 0x4e4;
    *(volatile unsigned short *)0x04001044 = 0x24bb;
    *(int *)(data_ov010_021b9890 + 0x8) = 0;
    return 1;
}
