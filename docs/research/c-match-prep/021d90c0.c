/* CAMPAIGN-PREP candidate for func_021d90c0 (ov002, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     arg-pack tail-call; flag-map; (u8) byte; arg2 lo/hi split
 *   risk:       KNOWN scheduling near-miss (core.h line 305): the r2 lsr#16 high-half extract is hoisted early -> 1-insn lsr/and swap, permuter-class
 *   confidence: low
 */
/* func_ov002_021d90c0: arg-pack tail-call func_021d479c(kind 0x3a +0x8000 when
 * arg0; (u8)arg1; arg2 split lo/hi u16). Sibling of 021d90fc but plain (u8)arg1
 * with no |0x100. */
typedef unsigned short u16;
extern void func_ov002_021d479c(u16 a, u16 b, u16 c, u16 d);

void func_ov002_021d90c0(int arg0, int arg1, unsigned int arg2) {
    int v = (arg0 != 0) ? 0x8000 : 0;
    func_ov002_021d479c((u16)(v | 0x3a), (u8)arg1, (u16)arg2, (u16)(arg2 >> 16));
}
