/* CAMPAIGN-PREP candidate for func_021ab5c8 (ov022, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     divmod: plain / and % by 360/255/60 emit the smull magics; switch returning per-channel regs -> jump-table; r0/r1/r3 outputs
 *   risk:       8 chained smull divisions: mwcc's instruction-scheduling interleave across them is a coin-flip (permuter-class). Also .L_260 pack tail is truncated in target so PackRGB555 shape is inferred (struct-guessed).
 *   confidence: low
 */
/* ov022 021ab5c8 — class D: HSV->RGB, 8x smull divmod + 6-way hue jump-table.
 * Clone of ov020 021adb8c. Tail .L_260 (truncated in target) packs r0,r1,r3.
 * Divisors derived from asr shifts: 360 (s8), 255 (s7), 60 (s5).
 * r0=hue r1=sat r2=val ; outputs flow through r0/r1/r3 to common pack tail. */

extern unsigned short PackRGB555(int r0, int r1, int r3); /* .L_260 tail (not shown) */

unsigned short func_ov022_021ab5c8(int h, int s, int v) {
    int hh = h * 6;                                 /* mul r7,r0,#6 */
    int F = hh - (hh / 360) * 360;                  /* hh % 360  (kept as F, not modulo op, to force the explicit q*360 sub) */
    int sector = ((h << 8) / 60) >> 8;              /* discriminant: ((h<<8)/60)>>8 */

    int VAL1 = (v * (255 - s)) / 255;               /* r1 */
    int VAL4 = (v * (255 - (s * F) / 360)) / 255;   /* r4 */
    int VAL7 = (v * (255 - (s * (360 - F)) / 360)) / 255; /* r7 */

    int r0, r1, r3;
    r1 = VAL1;                                       /* r1 default holds VAL1 across cases 0/1 */

    switch (sector) {
    case 0: r0 = v;    r3 = VAL7; break;            /* .L_1fc */
    case 1: r0 = VAL4; r3 = v;    break;            /* .L_208 */
    case 2: r0 = VAL1; r3 = v;    r1 = VAL7; break; /* .L_214 */
    case 3: r0 = VAL1; r3 = VAL4; r1 = v;    break; /* .L_224 */
    case 4: r0 = VAL7; r3 = VAL1; r1 = v;    break; /* .L_234 */
    case 5: r0 = v;    r3 = VAL1; r1 = VAL4; break; /* .L_244 */
    default: r0 = sector; r3 = (255 - (s * (360 - F)) / 360); break; /* .L_254 */
    }
    return PackRGB555(r0, r1, r3);
}
