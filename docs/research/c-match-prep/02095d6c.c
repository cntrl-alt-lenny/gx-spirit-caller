/* CAMPAIGN-PREP candidate for func_02095d6c (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: if-assign clamp [-723,0], threshold-cascade bucket, table[idx], shifted-or, (u16) cast (lsl16;lsr16)
 *   risk:       reshape-able: keep clamp as movlt/movgt if-assigns (not ternary); table load `data_020c32f8[c+723]` is hoisted into the cascade; `byte | (bucket<<8)` is byte-first shifted-or; final (unsigned short) gives lsl16;lsr16. Possible movge/movgt edge on the >0 clamp.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_02095d6c (main, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED.
 *   recipe: if-assign clamp, threshold cascade, table lookup, byte-first shifted-or, (u16) cast.
 *   risk:   reshape-able clamp (if-assign vs ternary) + cascade/branch order; final lsl16;lsr16 = u16 cast.
 *   confidence: med
 */
/* func_02095d6c: clamp x to [-723,0]; look up data_020c32f8[x+723]; bucket x
 * by thresholds (-240/-120/-60 -> 3/2/1/0); return (u16)(table_byte |
 * (bucket<<8)). */

extern unsigned char data_020c32f8[];

unsigned short func_02095d6c(int x) {
    int b;
    unsigned char t;
    if (x < -723)
        x = -723;
    else if (x > 0)
        x = 0;
    t = data_020c32f8[x + 723];
    if (x < -240)
        b = 3;
    else if (x < -120)
        b = 2;
    else if (x < -60)
        b = 1;
    else
        b = 0;
    return (unsigned short)(t | (b << 8));
}
