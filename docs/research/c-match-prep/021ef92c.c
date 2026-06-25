/* CAMPAIGN-PREP candidate for func_021ef92c (ov002, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     :1 bitfield + guard-chain + bind-vs-reload (reload b0)
 *   risk:       self->b0 must reload each use (3 ldrh in orig); if mwcc binds it once, codegen flips.
 *   confidence: med
 */
/* func_ov002_021ef92c: bit0(self->f2) gating + helper chain.
 *   021bc8c8(self->b0)==0           -> return 0
 *   021c1e44(self,player,idx)!=0    -> return 0
 *   021bc618(self->b0)!=0           -> return 1
 *   self->b0 != player              -> return 0
 *   021bc288(player,idx)==0         -> return 0
 *   else return 1
 * self->b0 is bit0 of the u16 at offset 2 (lsl#31;lsr#31), reloaded each use. */

struct self_t { char _pad[2]; unsigned short b0 : 1; unsigned short _r : 15; };

extern int func_ov002_021bc8c8(int x);
extern int func_ov002_021bc618(int x);
extern int func_ov002_021bc288(int player, int idx);
extern int func_ov002_021c1e44(struct self_t *self, int player, int idx);

int func_ov002_021ef92c(struct self_t *self, int player, int idx) {
    if (func_ov002_021bc8c8(self->b0) == 0)
        return 0;
    if (func_ov002_021c1e44(self, player, idx) != 0)
        return 0;
    if (func_ov002_021bc618(self->b0) != 0)
        return 1;
    if (self->b0 != player)
        return 0;
    if (func_ov002_021bc288(player, idx) == 0)
        return 0;
    return 1;
}
