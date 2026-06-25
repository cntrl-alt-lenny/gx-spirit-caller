/* CAMPAIGN-PREP candidate for func_020a66e8 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     branch-tail/tail-call wrapper; bind sentinel via &local; mvn=~
 *   risk:       frame layout (sub sp,#4 + stmfd {lr}) and the lr/ip arg shuffle may schedule differently; signatures of callee guessed
 *   confidence: med
 */
// CRC32 one-shot wrapper: init crc to ~0, update, return ~crc
extern unsigned int func_020a6788(unsigned int *table, unsigned int *crc,
                                  const unsigned char *data, unsigned int len);

unsigned int func_020a66e8(unsigned int *table, const unsigned char *data,
                           unsigned int len)
{
    unsigned int crc = ~0u;
    func_020a6788(table, &crc, data, len);
    return ~crc;
}
