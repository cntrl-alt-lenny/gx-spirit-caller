/* CAMPAIGN-PREP candidate for func_020a6788 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     counted loop; commutative eor operand order (table value first)
 *   risk:       counter pre-increment vs index form may reorder add/cmp; r4 held across loop should match; data[i]/i++ ptr-bump scheduling
 *   confidence: high
 */
// CRC32 update: crc = table[(crc^byte)&0xff] ^ (crc>>8)
unsigned int func_020a6788(unsigned int *table, unsigned int *crc,
                           const unsigned char *data, unsigned int len)
{
    unsigned int c = *crc;
    unsigned int i;

    for (i = 0; i < len; i++) {
        c = table[(c ^ data[i]) & 0xff] ^ (c >> 8);
    }
    *crc = c;
    return c;
}
