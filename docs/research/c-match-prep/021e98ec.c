/* CAMPAIGN-PREP candidate for func_021e98ec (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     if/else on b0 (the bne split); single-read mla; both arms !=0 bool
 *   risk:       branch shape: asm reads header [+2] AFTER the 021c1ef0 call and bne-splits; if mwcc hoists self->b0 before the call or emits movcc instead of the two-block branch, layout diverges — reshape-able (read self->b0 only inside the if)
 *   confidence: med
 */
/* func_ov002_021e98ec (ov002, class C) — brief, batch p_0071.
 * UNVERIFIED build-free draft. Drop into src/, ninja+objdiff, tweak per risk.
 * Guards idx>=5, f30==0, 021c1ef0()==0; THEN an if/else on header bit0:
 *   if (self->b0 == player) return 021c1a2c(player,idx,f0) != 0;
 *   else                    return 021c2084(self,player,idx,1) != 0;
 * Single read => mla. The branch is the structural feature (bne .L_88).
 */
struct self_t { unsigned short f0; unsigned short b0 : 1; unsigned short _r : 15; };
struct subrow { char _pad[0x30]; unsigned int f30 : 13; unsigned int _hi : 19; };

extern char data_ov002_022cf16c[];
extern int func_ov002_021c1ef0(void);
extern int func_ov002_021c1a2c(int player, int idx, int v);
extern int func_ov002_021c2084(struct self_t *self, int player, int idx, int flag);

int func_ov002_021e98ec(struct self_t *self, int player, int idx) {
    struct subrow *sr;
    if (idx >= 5)
        return 0;
    sr = (struct subrow *)(data_ov002_022cf16c + (player & 1) * 0x868 + idx * 20);
    if (sr->f30 == 0)
        return 0;
    if (func_ov002_021c1ef0() == 0)
        return 0;
    if (self->b0 == player)
        return func_ov002_021c1a2c(player, idx, self->f0) != 0;
    return func_ov002_021c2084(self, player, idx, 1) != 0;
}
