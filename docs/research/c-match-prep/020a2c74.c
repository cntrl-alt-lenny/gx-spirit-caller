/* CAMPAIGN-PREP candidate for func_020a2c74 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     checksum loop; commutative add-accumulator; u16 fold/eor tail
 *   risk:       down-count loop reg-alloc (n/sum) may flip; literal-pool 0xffff placement; loop test ble/bgt shape
 *   confidence: med
 */
/* func_020a2c74 — one's-complement checksum fold over a halfword run.
 * Leaf (no push/pop) -> default mwcc 2.0/sp1p5 routing (plain .c).
 */

unsigned short func_020a2c74(const unsigned short *p, int len)
{
    int n = len >> 1;
    int sum = 0;
    int fold;

    while (n > 0) {
        sum += *p++;
        n--;
    }

    fold = (sum & 0xffff) + ((unsigned int)sum >> 16);
    fold = fold + ((unsigned int)fold >> 16);
    return (unsigned short)(fold ^ 0xffff);
}
