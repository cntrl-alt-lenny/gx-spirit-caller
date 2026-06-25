/* CAMPAIGN-PREP candidate for func_0225bcf4 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard-chain + call + reload global + inline-predicate const
 *   risk:       Inline movne #0x800 may branch-vs-predicate differ (reg-mirror class, sibling of walled 02267f90); 0x1c/[0] offsets guessed.
 *   confidence: low
 */
/* func_ov002_0225bcf4: guard sum<=4, gate on 021bc8c8, then return 0x800
 * unless (arg0 == data[0] && data->f_1c == sum). Reloads data_022cd3f4. */

extern char data_ov002_022cd3f4[];
extern int  func_ov002_021bc8c8(void *a, int b, int c);

int func_ov002_0225bcf4(int arg0, int arg1, int arg2) {
    int sum = arg1 + arg2;
    if (sum > 4)
        return 0;
    if (func_ov002_021bc8c8(*(void **)data_ov002_022cd3f4, arg0, sum) == 0)
        return 0;
    if (arg0 == *(int *)data_ov002_022cd3f4 &&
        *(int *)(data_ov002_022cd3f4 + 0x1c) == sum)
        return 0;
    return 0x800;
}
