/* CAMPAIGN-PREP candidate for func_02267f90 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     eor-guard + single call + inline-predicate const 0x800
 *   risk:       KNOWN reg-alloc/inline-vs-branch WALL: already shipped as whole-function .s (briefs 354/356/358); permuter plateaued. C will near-miss by reg-mirror.
 *   confidence: low
 */
/* func_ov002_02267f90: guard sum<=10 and arg0 == (data->f_cec ^
 * data->f_d24); then return 0x800 iff 021b9e00(arg0,sum) nonzero, else 0.
 * NOTE: this function is a documented reg-mirror wall, shipped as .s. */

extern char data_ov002_022d016c[];
extern int  func_ov002_021b9e00(int a, int b);

int func_ov002_02267f90(int arg0, int arg1, int arg2) {
    int sum = arg1 + arg2;
    if (sum > 10)
        return 0;
    if (arg0 != (*(int *)(data_ov002_022d016c + 0xcec) ^
                 *(int *)(data_ov002_022d016c + 0xd24)))
        return 0;
    if (func_ov002_021b9e00(arg0, sum) != 0)
        return 0x800;
    return 0;
}
