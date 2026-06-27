/* CAMPAIGN-PREP candidate for func_022b0444 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: divmod by 0x20; bind base+word; (1<<bit)|tbl store-order.
 *   risk:       shifted-or operand-order: asm is `orr r0,r3,r1 lsl r0` = (1<<bit)|tbl, written so; if mwcc reverses to tbl|(1<<bit) dest-reg flips. Same /0x20 divisor uncertainty as 022b03f4. reshape-able.
 *   confidence: low
 */
/* func_ov002_022b0444 - bit-table SET (OR in bit n). Mirror of the GET
 * at 022b03f4 but only the low guard (cmp#7 -> early return), then
 * tbl[word] |= 1 << (n%32). orr-shift store: (1u << bit) | tbl[word].
 * Holds the base (lr) and word index (ip) across the load+store -> single
 * local for each. data_021064a8 is a u32 bit-array. */

extern unsigned int data_021064a8[];

void func_ov002_022b0444(int n)
{
    unsigned int *base;
    int word;
    if (n <= 7) return;
    base = data_021064a8;
    word = n / 0x20;
    base[word] = base[word] | (1u << (n % 0x20));
}
