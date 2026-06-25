/* CAMPAIGN-PREP candidate for func_02221fc0 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     bitfield bit2 guard + guard-chain + byte-extract
 *   risk:       bit2 guard may emit cmp#0 vs orig movs lsr#0x1f; otherwise proven idiom
 *   confidence: high
 */
/* func_ov002_02221fc0: bit2@4 early-return guard, then one guard-chain (df38/2576)
 * with byte-extract firing 021d6c98(self,b0,b1). Returns 0. */
typedef unsigned short u16;
extern int func_ov002_0223df38(void *a, int b, int c);
extern u16 func_ov002_0223de94(void *node, int idx);
extern int func_ov002_0225764c(void *a, int b, int c);
extern void func_ov002_021d6c98(void *a, int b, int c);

struct Self21fc0 { u16 _0; u16 _2; u16 :2; u16 b2:1; u16 :13; };

int func_ov002_02221fc0(struct Self21fc0 *arg0) {
    int ret, b0, b1;
    if (arg0->b2) return 0;
    if (func_ov002_0223df38(arg0, 0, 0) == 0) goto end;
    ret = func_ov002_0223de94(arg0, 0);
    b0 = ret & 0xff;
    b1 = ((u16)ret >> 8) & 0xff;
    if (func_ov002_0225764c(arg0, b0, b1) == 0) goto end;
    func_ov002_021d6c98(arg0, b0, b1);
end:
    return 0;
}
