/* CAMPAIGN-PREP candidate for func_021ef028 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard/branch-tail + tail calls; field accessor
 *   risk:       fC/f0 struct offsets guessed; r4/r5/r6 callee-save spill order may differ; final tail may inline vs bl.
 *   confidence: med
 */
/* func_ov002_021ef028: guard on header field [+0xc]==2, then a 2-stage
 * helper chain (021c1a2c then 021c1e44), else fall through to 021eb300.
 *   field@0xc != 2  -> tail-call 021eb300(self,player,idx)
 *   021c1a2c(player,idx,self->f0)==0 -> return 0
 *   021c1e44(self,player,idx)!=0     -> return 0
 *   else tail-call 021eb300(self,player,idx)
 * Note: 021c1a2c is called as (r0=player,r1=idx,r2=self->f0). */

struct self_t { unsigned short f0; char _pad2[10]; unsigned short fC; };

extern int func_ov002_021c1a2c(int player, int idx, int v);
extern int func_ov002_021c1e44(struct self_t *self, int player, int idx);
extern int func_ov002_021eb300(struct self_t *self, int player, int idx);

int func_ov002_021ef028(struct self_t *self, int player, int idx) {
    if (self->fC == 2) {
        if (func_ov002_021c1a2c(player, idx, self->f0) == 0)
            return 0;
        if (func_ov002_021c1e44(self, player, idx) != 0)
            return 0;
    }
    return func_ov002_021eb300(self, player, idx);
}
