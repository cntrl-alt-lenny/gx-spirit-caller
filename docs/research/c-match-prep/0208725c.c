/* CAMPAIGN-PREP candidate for func_0208725c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     early-return guard; node stores in asm order; strb data_482c before str data_4830
 *   risk:       literal-pool ordering: mwcc must allocate r0=4838 and r1=4844 and emit stores in source order; if it reorders the two node-pairs the 4 str diverge. reshape-able via statement order (already matched).
 *   confidence: med
 */
/* func_0208725c: one-shot init guard. data_021a4834 is the once-flag.
 * Two node-pair stores (4838={func_02087174,0}, 4844={func_02087168,0})
 * in asm order, then strb data_482c=-1 before str data_4830=1. */

extern int  data_021a4834;
extern void *data_021a4838[2];
extern void *data_021a4844[2];
extern char data_021a482c;
extern int  data_021a4830;

extern void func_02087168(void);
extern void func_02087174(void);
extern void func_020872fc(void);
extern void func_02087c34(void);
extern void func_02088d5c(void);
extern void func_020952f8(void);
extern int  func_0209a824(int arg);
extern void func_0209a83c(void);

void func_0208725c(void) {
    if (data_021a4834 != 0) return;
    data_021a4834 = 1;

    func_020952f8();

    data_021a4838[0] = (void *)func_02087174;
    data_021a4838[1] = 0;
    data_021a4844[0] = (void *)func_02087168;
    data_021a4844[1] = 0;

    func_0209a83c();
    func_0209a824((int)data_021a4844);
    func_020872fc();
    func_02088d5c();
    func_02087c34();

    data_021a482c = (char)-1;
    data_021a4830 = 1;
}
