/* CAMPAIGN-PREP candidate for func_020459c4 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     counted scan loop (loop-rotation guard + do-while), index<<1
 *   risk:       loop rotation may keep a pre-test form; index/return reg sharing normally holds
 *   confidence: med
 */
/* func_020459c4: return index of first zero halfword in arr (count of leading
 * nonzero entries). for-loop rotated by mwcc to: test arr[0], then
 * do{i++}while(arr[i]). i<<1 scales the halfword index; r2 holds i and result. */

int func_020459c4(unsigned short *arr) {
    int i;

    for (i = 0; arr[i] != 0; i++)
        ;
    return i;
}
