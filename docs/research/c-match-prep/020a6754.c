/* CAMPAIGN-PREP candidate for func_020a6754 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     wrapper with &local u8 (strb/ldrb); call passthrough
 *   risk:       frame setup + arg-shuffle scheduling; callee param types (table is u8* table here) guessed; ip zero-reg reuse
 *   confidence: med
 */
// CRC8 one-shot wrapper: init crc to 0, update, return crc (byte)
extern unsigned char func_020a68a0(unsigned int *table, unsigned char *crc,
                                  const unsigned char *data, unsigned int len);

unsigned char func_020a6754(unsigned int *table, const unsigned char *data,
                            unsigned int len)
{
    unsigned char crc = 0;
    func_020a68a0(table, &crc, data, len);
    return crc;
}
