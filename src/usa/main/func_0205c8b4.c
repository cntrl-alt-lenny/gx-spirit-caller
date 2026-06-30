/* CAMPAIGN-PREP candidate for func_0205c8b4 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     straight-line repeated MMIO-toggle calls (fixed masks)
 *   risk:       low; only risk is mwcc reordering the independent calls, but data deps via r4 keep order; mask immediates are MOV-encodable
 *   confidence: high
 */
/* func_0205c8b4: straight-line sequence of toggle calls on arg0.
 *   func_02055190(p, 0x4000); ...0x8000;0x10000;0x20000;0x40000
 *   func_02055144(p, 0x4000); ...0x8000;0x10000
 *   func_020550fc(p); func_020550b4(p)
 */

extern void func_020550b4(void *p);
extern void func_020550fc(void *p);
extern void func_02055144(void *p, int mask);
extern void func_02055190(void *p, int mask);

void func_0205c8b4(void *p) {
    func_02055190(p, 0x4000);
    func_02055190(p, 0x8000);
    func_02055190(p, 0x10000);
    func_02055190(p, 0x20000);
    func_02055190(p, 0x40000);
    func_02055144(p, 0x4000);
    func_02055144(p, 0x8000);
    func_02055144(p, 0x10000);
    func_020550fc(p);
    func_020550b4(p);
}
