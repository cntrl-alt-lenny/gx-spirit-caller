/* CAMPAIGN-PREP candidate for func_021b9e08 (ov006, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: signed /10 & %10 magic via plain / and %; abs via if; LSB-first store then reversed glyph read
 *   risk:       permuter-class: orig recomputes v/10 with TWO smulls (one for %, one for /) per iter and holds the 0x66666667 const in r7 across the loop; mwcc may CSE the divide to one smull or reload the const, diverging the loop body.
 *   confidence: low
 */
/* func_ov006_021b9e08: format a signed integer into a halfword glyph string.
 * abs(n) is broken into base-10 digits (LSB-first) on a 16-int stack buffer,
 * then re-emitted MSB-first as glyphs from data_ov006_021cbbc8[0][digit];
 * a leading minus glyph (index 10) is written when n<0. NUL-terminates;
 * returns 1. (class D: smull div/mod by 10 + store-order.) */
extern void *data_ov006_021cbbc8[];

int func_ov006_021b9e08(int unused, unsigned short *out, int n) {
    int buf[16];
    int count;
    int sign;
    int v;
    int i;
    unsigned short *glyphs;

    v = (n < 0) ? -n : n;
    sign = (n < 0) ? 1 : 0;
    count = 0;
    do {
        buf[count] = v % 10;
        v = v / 10;
        count++;
    } while (v > 0 && count < 16);

    if (n < 0) {
        glyphs = (unsigned short *)data_ov006_021cbbc8[0];
        out[0] = glyphs[10];
    }

    if (count > 0) {
        glyphs = (unsigned short *)data_ov006_021cbbc8[0];
        for (i = 0; i < count; i++) {
            out[i + sign] = glyphs[buf[(count - 1) - i]];
        }
    }
    *(unsigned char *)&out[count + sign] = 0;
    return 1;
}
