/* CAMPAIGN-PREP candidate for func_022a6fec (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     constant-divisor 0x92492493 -> signed /7; :2 bitfield via mask; if-assign clamp
 *   risk:       reshape-able(divmod): 0x92492493+asr#4+signbit is signed /7 — a plain '/7' should regenerate it; if mwcc picks a different magic/shift, force int q=t/7 temp. clamp movle/movgt order kept.
 *   confidence: med
 */
/* func_ov002_022a6fec (ov002, D) — leaf: signed divide-by-7 of an offset, clamp
 * [0,4], parity-flip the base. r1=arg1, r2=arg2. G=cd73c. d=02104f4c.
 * t = ((d.f4 >> 27) & 3) bit0 ? arg2+0x18 : arg2; t -= 0x46; q = t / 7 (smull
 * 0x92492493 + addback + asr#4 + sign = signed /7); clamp q to [0,4];
 * if (arg1 == (G.f4 ^ 1)) return 9 - q; else return q + 5. */
struct Cd73c { char _a[4]; int f4; };
extern struct Cd73c data_ov002_022cd73c;
extern struct Cd73c data_02104f4c;   /* same {char[4]; int f4} shape, f4 at +4 */

int func_ov002_022a6fec(int arg1, int arg2) {
    int t = arg2;
    int q;
    if (((data_02104f4c.f4 >> 27) & 3) & 1)   /* lsl#1b;lsr#1e -> bits27..28; tst #1 */
        t += 0x18;
    t -= 0x46;
    q = t / 7;
    if (q < 0) q = 0;
    if (q > 4) q = 4;
    if (arg1 == (data_ov002_022cd73c.f4 ^ 1))
        return 9 - q;
    return q + 5;
}
