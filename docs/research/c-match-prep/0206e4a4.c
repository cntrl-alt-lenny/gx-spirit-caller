/* CAMPAIGN-PREP candidate for func_0206e4a4 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     <=0 bounds guard + single call, boolean negate result
 *   risk:       ble (signed) needs signed param; movne/return-0 vs return-1 branch stable
 *   confidence: high
 */
/* func_0206e4a4: validity check.
 *   if (n <= 0) return 1;                  ; cmp;ble -> success path
 *   if (func_0206e504(&data_0219ed48) != 0) return 0;
 *   return 1;
 * Signed compare (ble) -> n is a signed int.
 */

extern int   func_0206e504(void *list);
extern void *data_0219ed48;

int func_0206e4a4(int n) {
    if (n <= 0) return 1;
    if (func_0206e504(&data_0219ed48) != 0) return 0;
    return 1;
}
