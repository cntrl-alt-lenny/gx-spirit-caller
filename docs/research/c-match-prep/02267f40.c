/* CAMPAIGN-PREP candidate for func_02267f40 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard chain + call + inline-predicate const 0x800
 *   risk:       Inline movne #0x800 predicate-vs-branch (reg-mirror class, sibling of walled 02267f90); cec/d28 offsets guessed.
 *   confidence: low
 */
/* func_ov002_02267f40: guard sum<=4 and arg0==data->f_cec, then return
 * 0x800 iff 021bc8c8(arg0,arg0,sum) && data->f_d28 == sum, else 0. */

extern char data_ov002_022d016c[];
extern int  func_ov002_021bc8c8(int a, int b, int c);

int func_ov002_02267f40(int arg0, int arg1, int arg2) {
    int sum = arg1 + arg2;
    if (sum > 4)
        return 0;
    if (arg0 != *(int *)(data_ov002_022d016c + 0xcec))
        return 0;
    if (func_ov002_021bc8c8(arg0, arg0, sum) != 0 &&
        *(int *)(data_ov002_022d016c + 0xd28) == sum)
        return 0x800;
    return 0;
}
