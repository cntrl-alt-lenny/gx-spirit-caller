/* CAMPAIGN-PREP candidate for func_021efc64 (ov002, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     2D-0x868 table + :13/:1 bitfields + guard-chain
 *   risk:       (player&1) recomputed twice in orig (two separate &1); if CSE'd into one reg, address-calc insns differ.
 *   confidence: high
 */
/* func_ov002_021efc64: opponent/idx guards + subrow f30 + cf1a2 field, then
 * inverted-bool tail.
 *   player == self->b0   -> return 0
 *   idx >= 5             -> return 0
 *   subrow.f30 == 0      -> return 0
 *   cf1a2 field == 0     -> return 0
 *   return 021c1e44(self,player,idx) == 0
 * Tables: cf16c base (+0x30 :13 id), cf1a2 u16 field, both 0x868-strided. */

struct self_t { char _pad[2]; unsigned short b0 : 1; unsigned short _r : 15; };
struct subrow { char _pad[0x30]; unsigned int f30 : 13; unsigned int _hi : 19; };

extern char data_ov002_022cf16c[];
extern unsigned short data_ov002_022cf1a2[];
extern int func_ov002_021c1e44(struct self_t *self, int player, int idx);

int func_ov002_021efc64(struct self_t *self, int player, int idx) {
    struct subrow *sr;
    if (player == self->b0)
        return 0;
    if (idx >= 5)
        return 0;
    sr = (struct subrow *)(data_ov002_022cf16c + (player & 1) * 0x868 + idx * 20);
    if (sr->f30 == 0)
        return 0;
    if (*(unsigned short *)((char *)data_ov002_022cf1a2 + (player & 1) * 0x868 + idx * 20) == 0)
        return 0;
    return func_ov002_021c1e44(self, player, idx) == 0;
}
