/* CAMPAIGN-PREP candidate for func_021f0378 (ov002, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     2D-0x868 table read (mla) + compare-tail
 *   risk:       orig fuses parity*0x868 into mla; mwcc may emit mul;add instead, or split idx*20 differently.
 *   confidence: med
 */
/* func_ov002_021f0378: cf1a4 field gate, then compare a helper result to the
 * self header field [+0].
 *   if (cf1a4 field == 0) return 0;
 *   return 021b9ecc(player,idx) == self->f0
 * cf1a4 indexed by (player&1)*0x868 + idx*20 (orig fuses via mla). self in r0
 * is saved to r4 and read as a u16 at offset 0 after the call. */

struct self_t { unsigned short f0; };

extern unsigned short data_ov002_022cf1a4[];
extern int func_ov002_021b9ecc(int player, int idx);

int func_ov002_021f0378(struct self_t *self, int player, int idx) {
    if (*(unsigned short *)((char *)data_ov002_022cf1a4 + (player & 1) * 0x868 + idx * 20) == 0)
        return 0;
    return func_ov002_021b9ecc(player, idx) == self->f0;
}
