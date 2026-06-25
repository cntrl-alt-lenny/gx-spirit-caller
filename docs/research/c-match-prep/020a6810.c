/* CAMPAIGN-PREP candidate for func_020a6810 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     counted loop; u16 table (index*2, ldrh); commutative eor order
 *   risk:       table u16* gives lsl#1+ldrh as asm shows; crc held as u16 (ldrh r4) vs u32 promotion may alter masking; counter form
 *   confidence: high
 */
// CRC16 update: halfword table, crc = table[(crc^byte)&0xff] ^ (crc>>8)
unsigned short func_020a6810(unsigned short *table, unsigned short *crc,
                             const unsigned char *data, unsigned int len)
{
    unsigned int c = *crc;
    unsigned int i;

    for (i = 0; i < len; i++) {
        c = table[(c ^ data[i]) & 0xff] ^ (c >> 8);
    }
    *crc = (unsigned short)c;
    return (unsigned short)c;
}
