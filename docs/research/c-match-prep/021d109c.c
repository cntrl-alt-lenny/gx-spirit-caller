/* CAMPAIGN-PREP candidate for func_021d109c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     store-order verbatim (cec,cf0,d1c,d20,cf8); eor^1 toggle; if-assign cmp (movlt); rsb 1-flag; load (x&1) row first
 *   risk:       reshape-able: store-order and the parity `mul r,(x&1),0x868` must not be reordered/CSE'd; risk is mwcc binding `data_022cf16c` once vs reloading, or hoisting the d016c stores. flag moveq is placed late in orig — interleave may differ (permuter-class tail).
 *   confidence: med
 */
/* func_ov002_021d109c: frame setup. Toggles d016c+0xcec, bumps +0xcf0, clears
 * +0xd1c/+0xd20, sets +0xcf8=7; then reads x=022d016c... actually a@022cd73c+4,
 * compares the two parity rows of cf16c (stride 0x868), posts 0x38(cmp) and
 * 5(1-flag). flag = ce950 sign bit. STORE ORDER preserved. */

extern char data_ov002_022ce950[];
extern char data_ov002_022cd73c[];
extern char data_ov002_022cf16c[];
extern char data_ov002_022d016c[];
extern int  func_ov002_021b0b54(int a, int b);
extern int  func_ov002_0229ade0(int cmd, int a, int b, int c);

void func_ov002_021d109c(void) {
    int flag = (*(unsigned short *)data_ov002_022ce950 & 0x8000) ? 1 : 0;
    char *p = data_ov002_022d016c;
    int x, ra, rb, cmp;

    *(int *)(p + 0xcec) = *(int *)(p + 0xcec) ^ 1;
    *(int *)(p + 0xcf0) = *(int *)(p + 0xcf0) + 1;
    *(int *)(p + 0xd1c) = 0;
    *(int *)(p + 0xd20) = 0;
    *(int *)(p + 0xcf8) = 7;

    x = *(int *)(data_ov002_022cd73c + 4);
    ra = *(int *)(data_ov002_022cf16c + (x & 1) * 0x868);
    rb = *(int *)(data_ov002_022cf16c + (x ^ 1) * 0x868);
    cmp = 0;
    if (ra < rb) cmp = 1;

    func_ov002_021b0b54(0x38, cmp);
    func_ov002_0229ade0(5, 1 - flag, 0, 0);
    *(int *)(data_ov002_022ce950 + 0x80c) = 0;
}
