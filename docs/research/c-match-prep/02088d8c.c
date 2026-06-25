/* CAMPAIGN-PREP candidate for func_02088d8c (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     global null-guard + clear-flag + two global-arg calls (reload globals)
 *   risk:       globals modeled as scalars; func_0209256c/02091af4 arg types guessed (ptr vs int)
 *   confidence: high
 */
/* func_02088d8c: if global data_021a5204 is set, clear it then
 * notify two subsystems. The three globals are distinct symbols,
 * each loaded from its own pool word (reload, not bound).
 */

extern int  data_021a5204;
extern void *data_021a520c;
extern void *data_021a5340;

extern void func_02091af4(void *p);
extern void func_0209256c(void *p, int a, int b);

void func_02088d8c(void) {
    if (data_021a5204 == 0) return;

    data_021a5204 = 0;
    func_0209256c(data_021a520c, 0, 1);
    func_02091af4(data_021a5340);
}
