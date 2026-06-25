/* CAMPAIGN-PREP candidate for func_02225274 (ov002, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard-chain goto end; 0223de94 byte-split ((u16)x>>8); 5-arg stack call
 *   risk:       reg-alloc on lo/hi temps may flip; stack-arg store of the 0 ok; 0223df38 sig assumed
 *   confidence: med
 */
/* func_ov002_02225274: guard 0223df38(self,0,0); read 0223de94(self,0) and
 * byte-split into lo/hi; guard 0225764c(self,lo,hi); then arg-pack via
 * 021d59cc(lo, hi, self->f0, 3, 0); always return 0. (family 0223a87c) */
typedef unsigned short u16;

extern int  func_ov002_0223df38(void *self, int b, int c);
extern int  func_ov002_0223de94(void *self, int idx);
extern int  func_ov002_0225764c(void *self, int b, int c);
extern int  func_ov002_021d59cc(int a, int b, int c, int d, unsigned short e);

int func_ov002_02225274(void *self) {
    int ret, lo, hi;
    if (func_ov002_0223df38(self, 0, 0) == 0) goto end;
    ret = func_ov002_0223de94(self, 0);
    lo = ret & 0xff;
    hi = ((u16)ret >> 8) & 0xff;
    if (func_ov002_0225764c(self, lo, hi) == 0) goto end;
    func_ov002_021d59cc(lo, hi, *(u16 *)self, 3, 0);
end:
    return 0;
}
