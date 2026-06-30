/* CAMPAIGN-PREP candidate for func_02087470 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     sp3-routing; null-guard early return; 1<<field shift; pass-through + const-0 arg
 *   risk:       Must compile as .legacy_sp3.c (1.2/sp3) for sub-sp/pop-pc shape; r1 vs r2 temp reg-alloc may flip
 *   confidence: med
 */
/* func_02087470: sp3-routing tier (stmfd {lr}; sub sp,#4; ... ldmfd {pc}).
 * Guard on self->f8; if non-zero call func_02094e20(1 << self->f0, arg, 0).
 * Sibling of func_02087440 (.legacy_sp3.c) but with a 3rd const-0 arg.
 * NOTE: filename must be func_02087470.legacy_sp3.c to route through mwcc 1.2/sp3.
 */

struct Func02087558Self { int f0; int pad4; int f8; };

extern void func_02094e20(int x, int arg, int z);

void func_02087470(struct Func02087558Self *self, int arg) {
    if (self->f8 == 0) return;
    func_02094e20(1 << self->f0, arg, 0);
}
