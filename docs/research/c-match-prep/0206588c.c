/* CAMPAIGN-PREP candidate for func_0206588c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     double lazy-init guard + reload globals + split return
 *   risk:       LIT2/LIT5 used as &data (address) vs *data value — chose address; if value, drop the &
 *   confidence: med
 */
/* func_0206588c: double lazy-init. For each of two globals, if zero call
 * func_02065934(*src, cfg) and store the result. Return (g0 && g1)?1:0.
 *
 *   if(data_0219e964==0) data_0219e964 = f(*data_0219e95c, data_021015a0);
 *   if(data_0219e960==0) data_0219e960 = f(*data_0219e958, data_021015bc);
 *   return (data_0219e964 && data_0219e960) ? 1 : 0;
 */

extern void *data_021015a0;
extern void *data_021015bc;
extern void *data_0219e958;
extern void *data_0219e95c;
extern int   data_0219e960;
extern int   data_0219e964;
extern int   func_02065934(void *a, void *cfg);

int func_0206588c(void) {
    if (data_0219e964 == 0) {
        data_0219e964 = func_02065934(data_0219e95c, &data_021015a0);
    }
    if (data_0219e960 == 0) {
        data_0219e960 = func_02065934(data_0219e958, &data_021015bc);
    }
    if (data_0219e964 == 0) return 0;
    if (data_0219e960 == 0) return 0;
    return 1;
}
