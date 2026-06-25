/* CAMPAIGN-PREP candidate for func_02093acc (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     scalar-clear + counted halfword-array zero loop (index*2 addressing)
 *   risk:       data_021a66f8/fc must be distinct symbols (assumed from extern list); loop shape (lsl#1 index, pre-cmp post-inc) should match.
 *   confidence: high
 */
/* func_02093acc: clears a status word then zeroes a 9-entry u16 array. */
extern unsigned long data_021a66f8;
extern unsigned short data_021a66fc[];

void func_02093acc(void) {
    int i;
    data_021a66f8 = 0;
    for (i = 0; i < 9; i++)
        data_021a66fc[i] = 0;
}
