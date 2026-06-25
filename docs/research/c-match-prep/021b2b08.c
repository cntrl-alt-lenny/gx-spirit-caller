/* CAMPAIGN-PREP candidate for func_021b2b08 (ov010, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     dense switch->jump-table (addls pc,pc) returning call results
 *   risk:       mwcc must pick jump-table not cmp-chain for 8 dense cases; case->fn order is correct as written
 *   confidence: high
 */
/* func_ov010_021b2b08: 8-case jump-table dispatcher, each case tail-returns
 * a distinct helper; default returns 0. Dense 0..7 -> addls pc,pc,r0,lsl#2. */

extern int func_0208dd9c(void);
extern int func_0208ddec(void);
extern int func_0208de4c(void);
extern int func_0208de94(void);
extern int func_0208deec(void);
extern int func_0208df0c(void);
extern int func_0208df40(void);
extern int func_0208df60(void);

int func_ov010_021b2b08(int sel) {
    switch (sel) {
    case 0: return func_0208df60();
    case 1: return func_0208df0c();
    case 2: return func_0208de94();
    case 3: return func_0208ddec();
    case 4: return func_0208df40();
    case 5: return func_0208deec();
    case 6: return func_0208de4c();
    case 7: return func_0208dd9c();
    default: return 0;
    }
}
