/* CAMPAIGN-PREP candidate for func_02090330 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     call result *6 stride -> 3 parallel u16 LUT[idx*3]<<12; idx-store first then 3 shifted stores
 *   risk:       idx*3 halfword index may emit add/lsl instead of the mul r0,#6; tables must be u16[]; the four store order is fixed
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_02090330 (main, class B) - p_0033.
 * UNVERIFIED build-free draft: drop into src/, run ninja+objdiff, tweak per risk.
 *   recipe: call result *6-byte-stride; 3 parallel u16 LUT reads <<12; idx-store first then 3 shifted stores
 */
/* func_02090330: read an index, then from three parallel u16 tables
 * (data_020c3198/319a/319c, stride 6 bytes = idx*3 halfwords) fetch a
 * triple, shift each <<12. Store idx at data_021a6348 first, then the
 * three shifted values at 021a633c / 021a634c / 021a6350. */

extern int func_0208cee8(void);
extern unsigned short data_020c3198[];
extern unsigned short data_020c319a[];
extern unsigned short data_020c319c[];
extern int data_021a6348;
extern int data_021a633c;
extern int data_021a634c;
extern int data_021a6350;

void func_02090330(void) {
    int idx = func_0208cee8();
    int i = idx * 3;
    data_021a6348 = idx;
    data_021a633c = (int)data_020c3198[i] << 12;
    data_021a634c = (int)data_020c319a[i] << 12;
    data_021a6350 = (int)data_020c319c[i] << 12;
}
