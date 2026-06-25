/* CAMPAIGN-PREP candidate for func_0205c928 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     straight-line repeated MMIO-toggle calls (fixed masks)
 *   risk:       low; only risk is mwcc reordering the independent calls, but data deps via r4 keep order; mask immediates are MOV-encodable
 *   confidence: high
 */
/* func_0205c928: straight-line sequence of toggle calls on arg0.
 *   func_02055204(p, 0x4000); ...0x8000;0x10000;0x20000;0x40000
 *   func_020551b8(p, 0x4000); ...0x8000;0x10000
 *   func_02055170(p); func_02055128(p)
 */

extern void func_02055128(void *p);
extern void func_02055170(void *p);
extern void func_020551b8(void *p, int mask);
extern void func_02055204(void *p, int mask);

void func_0205c928(void *p) {
    func_02055204(p, 0x4000);
    func_02055204(p, 0x8000);
    func_02055204(p, 0x10000);
    func_02055204(p, 0x20000);
    func_02055204(p, 0x40000);
    func_020551b8(p, 0x4000);
    func_020551b8(p, 0x8000);
    func_020551b8(p, 0x10000);
    func_02055170(p);
    func_02055128(p);
}
