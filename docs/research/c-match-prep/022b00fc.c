/* CAMPAIGN-PREP candidate for func_022b00fc (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     3-bit extract as &7; /2 and &1 from one value; counted accumulator loop
 *   risk:       permuter-class: the q=n/2 vs parity=n&1 are derived from ONE value via shared add/ror temps and the two band branches interleave with movs flag-setting; reshaping to plain n/2,n&1 likely reorders the cmp/movs and diverges.
 *   confidence: low
 */
/* func_ov002_022b00fc: bitfield-extract a 3-bit field n=(g4>>2)&7 from a
 * global, split into q=n/2 and parity n&1 to seed start=(parity? 0:0x10)
 * and an early band check, then a 6-iter accumulator loop over
 * data_ov002_022ca510[] summing widths while bit-testing r3 to find a
 * cell whose [start,start+0x14) span contains r2; returns 0-based hit or
 * -1. */

extern int data_02104f4c[];        /* g; field at +4 */
extern int data_ov002_022ca510[];  /* width table, 6 entries */

int func_ov002_022b00fc(int unused0, int limit, int pos, int mask) {
    int n;
    int start;
    int i;
    int acc;

    n = (((unsigned int)data_02104f4c[1]) >> 2) & 7;
    /* movs r0,(n/2) sets start; adds parity decides which band branch */
    if ((n & 1) != 0) {
        start = 0;
        if (limit > 0xe8)
            goto loop;
        return -1;
    } else {
        start = 0x10;
        if (limit >= 0x18)
            return -1;
        /* falls into loop */
    }
loop:
    for (i = 0; i < 6; i++) {
        if ((mask & (1 << i)) != 0 && pos >= start) {
            if (pos < start + 0x14)
                return i;
        }
        start += data_ov002_022ca510[i];
    }
    return -1;
}
