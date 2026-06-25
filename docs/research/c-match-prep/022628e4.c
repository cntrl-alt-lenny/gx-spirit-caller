/* CAMPAIGN-PREP candidate for func_022628e4 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     linear guard-chain of calls; (player&1)*0x868 stride; -1 from shared lit
 *   risk:       021bae7c third arg -1 may emit mvn vs orig sub-from-0x14ff-in-reg; per-player index addressing reg-alloc may shift.
 *   confidence: med
 */
/* func_ov002_022628e4: readiness gate. Require 021b3ecc(player,11,0x14ff)
 * non-zero, the cf178[(player&1)*0x868] event-count to be 0, neither
 * 021bbf50/021bcf00 pending, and the flipped player to clear 021c3ae4
 * else 021bae7c. */

extern char data_ov002_022cf178[];
extern int  func_ov002_021b3ecc(int player, int kind, int code);
extern int  func_ov002_021bae7c(int player, int code, int arg);
extern int  func_ov002_021bbf50(int player);
extern int  func_ov002_021bcf00(int player);
extern int  func_ov002_021c3ae4(int player, int code);

int func_ov002_022628e4(int player) {
    if (func_ov002_021b3ecc(player, 0xb, 0x14ff) == 0)
        return 0;
    if (*(int *)(data_ov002_022cf178 + (player & 1) * 0x868) != 0)
        return 0;
    if (func_ov002_021bbf50(player) != 0)
        return 0;
    if (func_ov002_021bcf00(player) != 0)
        return 0;
    player = 1 - player;
    if (func_ov002_021c3ae4(player, 0x14ff) != 0)
        return 1;
    if (func_ov002_021bae7c(player, 0x14ff, -1) == 0)
        return 0;
    return 1;
}
