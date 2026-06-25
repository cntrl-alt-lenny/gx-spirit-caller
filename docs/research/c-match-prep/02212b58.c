/* CAMPAIGN-PREP candidate for func_02212b58 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     stack-out param; (u16)>>8 asr byte split; guard chain; return 0
 *   risk:       (u16)v>>8 must yield asr#8 via int promotion (matches sibling 0223a87c); the 4-byte out local must stay int (ldr, not ldrh)
 *   confidence: high
 */
/* func_ov002_02212b58: out-param fetch via func_0223df38(self,0,&v); split v into
 * lo=(u8)v, hi=((u16)v>>8)&0xff; guard func_0225764c(self,lo,hi) then
 * func_021de910(self,lo,hi). Returns 0.
 */
typedef unsigned short u16;

extern int func_ov002_0223df38(void *self, int b, int *out);
extern int func_ov002_0225764c(void *self, int a, int b);
extern int func_ov002_021de910(void *self, int a, int b);

int func_ov002_02212b58(void *self) {
    int v, lo, hi;
    if (func_ov002_0223df38(self, 0, &v) == 0) return 0;
    lo = v & 0xff;
    hi = ((u16)v >> 8) & 0xff;
    if (func_ov002_0225764c(self, lo, hi) == 0) return 0;
    func_ov002_021de910(self, lo, hi);
    return 0;
}
