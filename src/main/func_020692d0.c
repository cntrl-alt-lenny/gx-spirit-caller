/* CAMPAIGN-PREP candidate for func_020692d0 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     branch-table dispatch; case-order + break for shared default block
 *   risk:       None observed: byte-exact. struct field f0 dispatch value guessed; case labels (0/2/3) are load-bearing for table layout.
 *   confidence: high
 */
/* func_020692d0 (default mwcc 2.0/sp1p5).
 * Probe call then jump-table dispatch on p->f0. VERIFIED byte-exact:
 * the case order (2/3, 0, 1:break) + post-switch `return 0` reproduces
 * the target's dense table (cmp #3; addls pc,pc,r0,lsl#2), the body order
 * (02069634 first, then 0206931c, then ret0), and the shared default/idx1
 * block exactly. */
extern void func_0206b5e8(void *p);
extern int  func_0206931c(void *p);
extern int  func_02069634(void *p);

struct S { int f0; };

int func_020692d0(struct S *p) {
    func_0206b5e8(p);
    switch (p->f0) {
    case 2:
    case 3:
        return func_02069634(p);
    case 0:
        return func_0206931c(p);
    case 1:
        break;
    }
    return 0;
}
