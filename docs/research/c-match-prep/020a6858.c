/* CAMPAIGN-PREP candidate for func_020a6858 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     nested counted loops; halfword store (n<<1); poly^ first
 *   risk:       store index computed as r2=lr<<1 before strh — addr-calc scheduling may differ; inner predication ordering
 *   confidence: high
 */
// CRC16 table generation: 256 halfword entries, 8-bit poly fold
void func_020a6858(unsigned short *table, unsigned int poly)
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
        table[n] = (unsigned short)c;
    }
}
