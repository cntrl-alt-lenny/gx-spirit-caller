/* CAMPAIGN-PREP candidate for func_0202ba38 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: signed %2 via if-else; nibble byte at idx/2; orr operand-order
 *   risk:       mwcc may emit the signed %2 as the literal lsr#1f/rsb/adds-ror#1f triad and idx/2 as add+asr#1; if it picks sdiv-style helper instead, the divmod block diverges. reshape-able (force int idx, plain % and /).
 *   confidence: med
 */
// func_0202ba38 — write a 4-bit nibble at a computed signed index
// func_0202b0b4 returns the (signed) nibble index; even index -> low nibble, odd -> high nibble.
extern unsigned char data_02105bc0[];
extern int func_0202b0b4(void);

void func_0202ba38(int unused, int val)
{
    int idx = func_0202b0b4();
    if ((idx % 2) == 0) {
        data_02105bc0[idx / 2] = (unsigned char)((data_02105bc0[idx / 2] & 0xf0) | val);
    } else {
        data_02105bc0[idx / 2] = (unsigned char)((data_02105bc0[idx / 2] & 0x0f) | (val << 4));
    }
}
