/* CAMPAIGN-PREP candidate for func_020874a4 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Cache arg in r4; null-guard early return; 1<<field; zero-arg mirror; field clear
 *   risk:       Zero-mirror (mov r1,#0; mov r2,r1; mov r3,r1) ordering and shift temp reg may differ
 *   confidence: med
 */
/* func_020874a4: default tier (stmdb {r4,lr}; ldmia {r4,pc}). Cache arg0
 * in r4; guard on self->f8; if non-zero call
 * func_02094f3c(1 << self->f0, 0, 0, 0) then clear self->f8.
 * The single 0 is materialized once (r1) and mirrored into r2/r3.
 */

struct Func0208758cSelf { int f0; int pad4; int f8; };

extern void func_02094f3c(int a, int b, int c, int d);

void func_020874a4(struct Func0208758cSelf *self) {
    if (self->f8 == 0) return;
    func_02094f3c(1 << self->f0, 0, 0, 0);
    self->f8 = 0;
}
