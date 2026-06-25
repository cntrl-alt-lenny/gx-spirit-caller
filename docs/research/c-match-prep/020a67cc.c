/* CAMPAIGN-PREP candidate for func_020a67cc (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     nested counted loops; ands/eorne/moveq predication; poly^ operand-first
 *   risk:       if/else predication (eorne+moveq) vs ternary should match; inner counter ip=r3 seeding and store [r0,n<<2] order
 *   confidence: high
 */
// CRC32 table generation: 256 entries, 8-bit poly fold
void func_020a67cc(unsigned int *table, unsigned int poly)
{
    unsigned int n;

    for (n = 0; n < 256; n++) {
        unsigned int c = n;
        int k;
        for (k = 0; k < 8; k++) {
            if (c & 1)
                c = poly ^ (c >> 1);
            else
                c = c >> 1;
        }
        table[n] = c;
    }
}
