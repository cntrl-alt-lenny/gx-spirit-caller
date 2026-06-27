/* CAMPAIGN-PREP candidate for func_020778c4 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     x*10+y => mla (keep 10 in a reg); unsigned cmp for cs/cc; accumulator-first adds for the pack
 *   risk:       permuter-class: 'mla fusion' (note) — mwcc may lower hi*10+lo to add r,lo,hi,lsl#3;add r,r,hi,lsl#1 (shift pair) instead of mov #10;mla, diverging every digit pair.
 *   confidence: low
 */
/* func_020778c4: parse an ASCII-decimal date/time field into a packed int.
 * Each 2-byte pair is hi*10+lo-0x210 (ASCII '0'*11 bias). arg1==0x17 selects
 * a year branch (+0x76c if pair>=0x32 else +0x7d0); else high=pair0*100+pair1.
 * Result packs high<<16 | nextpair<<8 | lastpair (built with add). r0=p. */
int func_020778c4(unsigned char *p, int arg1) {
    int a, b, c, d;
    a = p[0] * 10 + p[1] - 0x210;
    p += 2;
    if (arg1 == 0x17) {
        if ((unsigned int)a >= 0x32) d = a + 0x76c;
        else d = a + 0x7d0;
    } else {
        b = p[0] * 10 + p[1] - 0x210;
        p += 2;
        d = a * 100 + b;
    }
    b = p[0] * 10 + p[1] - 0x210;
    c = p[2] * 10 + p[3] - 0x210;
    return (d << 0x10) + (b << 8) + c;
}
