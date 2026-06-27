/* CAMPAIGN-PREP candidate for func_0201bddc (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     store-order zero fields; bic/orr field-set RMW; orr-accumulate then eq-guard flag
 *   risk:       reshape-able: orig accumulates s via three separate orr (r5|=...) then orrs sets Z; if mwcc reloads or short-circuits, reorder/use plain |= and one if(s==0) — keep all three calls eager (no &&).
 *   confidence: med
 */
/* func_0201bddc (main, class D) — init: GetSystemWork tick, zero 3 fields in
 * store-order (0x10,0x8,0x0), two bic/orr field-set RMW on f1c, call, then
 * conditional flag-set on f18 when three sub-results all zero. */
extern char *GetSystemWork(void);
extern void func_020186c8(char *a);
extern void func_02018a2c(void);
extern void func_0201b7e0(char *a);
extern int  func_0201b82c(char *a);
extern int  func_0201bbc8(char *a);
extern int  func_0201bd30(char *a);

void func_0201bddc(char *a) {
    int t;
    int s;
    GetSystemWork();
    func_02018a2c();
    func_0201b7e0(a);
    *(int *)(a + 0x10) = 0;
    *(int *)(a + 0x8)  = 0;
    *(int *)(a + 0x0)  = 0;
    t = *(int *)(a + 0x1c);
    t = (t & ~0xff00)   | 0xff00;
    t = (t & ~0x1f0000) | 0x1f0000;
    *(int *)(a + 0x1c) = t;
    func_020186c8(a);
    if (*(int *)(a + 0x8) != 0)
        return;
    s  = func_0201b82c(a);
    s |= func_0201bbc8(a);
    s |= func_0201bd30(a);
    if (s == 0) {
        *(int *)(a + 0x18) |= 0x1000000;
    }
}
