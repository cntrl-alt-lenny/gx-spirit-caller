/* CAMPAIGN-PREP candidate for func_02090114 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     call result asr#4 -> u16 LUT[v>>4]<<12; ordered stores (raw 021a6344 first, shifted 021a6340)
 *   risk:       v>>4 must be signed (asr) so v is int; data_020c3188 must be u16[] for ldrh+lsl#1 stride; store order fixed
 *   confidence: high
 */
/* CAMPAIGN-PREP candidate for func_02090114 (main, class A) - p_0033.
 * UNVERIFIED build-free draft: drop into src/, run ninja+objdiff, tweak per risk.
 *   recipe: call result -> asr#4 halfword-table lookup; two ordered global stores (raw first, shifted second)
 */
/* func_02090114: read a value, stash it raw at data_021a6344, then index
 * a u16 LUT (data_020c3188) by (value>>4), shift the entry left 12 and
 * store at data_021a6340. asr#4 -> signed shift; lsl#1 -> u16 stride. */

extern int func_0208ced4(void);
extern unsigned short data_020c3188[];
extern int data_021a6344;
extern int data_021a6340;

void func_02090114(void) {
    int v = func_0208ced4();
    data_021a6344 = v;
    data_021a6340 = (int)data_020c3188[v >> 4] << 12;
}
