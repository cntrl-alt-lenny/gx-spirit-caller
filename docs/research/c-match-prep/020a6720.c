/* CAMPAIGN-PREP candidate for func_020a6720 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     wrapper with &local u16 (strh/ldrh); call passthrough
 *   risk:       frame setup + arg-shuffle (mov lr,r1 / mov r3,r2) scheduling; ip=#0 vs reuse may flip; callee sig guessed
 *   confidence: med
 */
// CRC16 one-shot wrapper: init crc to 0, update, return crc (halfword)
extern unsigned short func_020a6810(unsigned int *table, unsigned short *crc,
                                   const unsigned char *data, unsigned int len);

unsigned short func_020a6720(unsigned int *table, const unsigned char *data,
                             unsigned int len)
{
    unsigned short crc = 0;
    func_020a6810(table, &crc, data, len);
    return crc;
}
