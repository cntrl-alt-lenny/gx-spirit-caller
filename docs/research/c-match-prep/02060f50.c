/* CAMPAIGN-PREP candidate for func_02060f50 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Class D: store-order e514/e524/e510; bind first global, reload second; mvn -1 compare.
 *   risk:       reshape-able: orig binds the handle in r0 across the cmp into func_02054e54 (no reload) but RELOADS for func_02054e70; if mwcc reloads the first call too, one ldr diverges — bind/reload split as written should match.
 *   confidence: med
 */
/* func_02060f50 — guarded teardown + multiple global stores (class D: store-order).
 * _LIT0=data_02101354, _LIT1=data_0219e514, _LIT2=data_0219e524, _LIT3=data_0219e510.
 * Final three zero-stores must emit in order: e514, e524, e510.
 */
extern int data_02101354;
extern int data_0219e510;
extern int data_0219e514;
extern int data_0219e524;

extern void func_020453b4(void);
extern void func_02054e54(int handle, int mode);
extern void func_02054e70(int handle);
extern void func_02060520(void);

void func_02060f50(void)
{
    int h = data_02101354;
    if (h != -1) {
        func_02054e54(h, 2);
        func_02054e70(data_02101354);
    }

    data_02101354 = -1;
    func_02060520();

    if (data_0219e514 == 0)
        return;

    func_020453b4();
    data_0219e514 = 0;
    data_0219e524 = 0;
    data_0219e510 = 0;
}
