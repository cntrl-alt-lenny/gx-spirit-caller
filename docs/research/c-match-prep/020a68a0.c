/* CAMPAIGN-PREP candidate for func_020a68a0 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     counted loop; direct byte table lookup (no >>8 xor)
 *   risk:       crc held as u8 (ldrb r4); no shift term so c stays in low byte — promotion to u32 vs u8 may change masking; counter form
 *   confidence: high
 */
// CRC8 update: byte table, crc = table[(crc^byte)&0xff]
unsigned char func_020a68a0(const unsigned char *table, unsigned char *crc,
                            const unsigned char *data, unsigned int len)
{
    unsigned int c = *crc;
    unsigned int i;

    for (i = 0; i < len; i++) {
        c = table[(c ^ data[i]) & 0xff];
    }
    *crc = (unsigned char)c;
    return (unsigned char)c;
}
