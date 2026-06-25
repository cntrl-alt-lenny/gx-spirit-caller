/* CAMPAIGN-PREP candidate for func_021d81d4 (ov002, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     arg-pack tail-call with shared (arg0&1) reg-mirror temp
 *   risk:       KNOWN reg-mirror wall (core.h flags 021d81d4): mwcc may not share the lo temp into the same regs
 *   confidence: low
 */
/* func_ov002_021d81d4: arg-pack tail-call func_021d479c(0x3f, packed, lo|0x5c, 0)
 * where lo=(arg0&1) is SHARED (reg-mirror) between packed and arg2, and
 * packed=(u16)(lo | 0x1e | ((arg1 & 0x3ff) << 6)). */
typedef unsigned short u16;
extern int func_ov002_021d479c(int packed, int a, int b, int c);

int func_ov002_021d81d4(int arg0, int arg1) {
    int lo = arg0 & 1;
    return func_ov002_021d479c(0x3f,
                               (u16)(lo | 0x1e | ((unsigned)(arg1 << 22) >> 16)),
                               lo | 0x5c, 0);
}
