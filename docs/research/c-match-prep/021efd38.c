/* CAMPAIGN-PREP candidate for func_021efd38 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     dispatch switch (if-chain) + void tail calls
 *   risk:       orig forms 0x1709 as lit+3 (cmp;add;cmp); a plain switch may materialize 0x1709 directly instead.
 *   confidence: med
 */
/* func_ov002_021efd38: dispatch on header field [+0xa].
 *   == 0x1706 -> tail 021e99a4
 *   == 0x1709 -> tail 021eb964
 *   else      -> tail 021ea390
 * All three are void tail-calls taking the same args (self,player,idx in r0-r2,
 * untouched). The 0x1709 case is encoded as 0x1706+3 in the orig. */

struct self_t { char _pad[10]; unsigned short fA; };

extern void func_ov002_021e99a4(struct self_t *self, int player, int idx);
extern void func_ov002_021eb964(struct self_t *self, int player, int idx);
extern void func_ov002_021ea390(struct self_t *self, int player, int idx);

void func_ov002_021efd38(struct self_t *self, int player, int idx) {
    switch (self->fA) {
    case 0x1706:
        func_ov002_021e99a4(self, player, idx);
        return;
    case 0x1709:
        func_ov002_021eb964(self, player, idx);
        return;
    default:
        func_ov002_021ea390(self, player, idx);
        return;
    }
}
