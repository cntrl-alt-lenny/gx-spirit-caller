/* CAMPAIGN-PREP candidate for func_021b3f98 (ov015, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     if-assign r1 default-0 before ble; ldrsh->short[idx]; div helper quotient; bind g.
 *   risk:       permuter-class: three mid-body early-return tails (ldmneia/ldmltia) reuse r6/r7; mwcc's epilogue-merge and the r1-live-across-ble choice are a scheduling coin-flip a C reshape may not fix.
 *   confidence: low
 */
/* func_ov015_021b3f98: clamp a counter via 021ac9c8, if positive scale a
 * (short-0x24) by it through the signed-divide helper, then a chain of
 * early-return guards on a mode word; on the matching path either set a
 * flag bit or run a teardown + spawn.
 *
 *   r5 = func_ov005_021ac9c8(g->f894); r1=0;
 *   if (r5>0) r1 = func_020b3870((short)p->f2 - 0x24, r5);   (quotient)
 *   if (g->f0 != 2) return;
 *   if (((short)p->f6 - (short)p->f2) < r5) return;
 *   if (r1 == g->f8dc) { g->fa84 |= 8; return; }
 *   func_ov015_021b3520(&g->f880);
 *   func_02037208(0x38, -1, 0, 1); g->f4 = a;   (str r6 before the call)
 */

typedef struct {
    int  f_0;
    int  f_4;
    char _pad8[0x878];
    int  f_880;          /* +0x880 base passed to 021b3520 */
    char _pad_884[0x10];
    int  f_894;          /* +0x894 */
    char _pad_898[0x44];
    int  f_8dc;          /* +0x8dc */
    char _pad_8e0[0x1a4];
    int  f_a84;          /* +0xa84 */
} S_ov015_5e28;

extern S_ov015_5e28 data_ov015_021b5e28;
extern int  func_02037208(int a, int b, int c, int d);
extern int  func_020b3870(int a, int b);
extern int  func_ov005_021ac9c8(int x);
extern void func_ov015_021b3520(void *p);

int func_ov015_021b3f98(int a, short *p) {
    S_ov015_5e28 *g = &data_ov015_021b5e28;
    int r5;
    int r1 = 0;

    r5 = func_ov005_021ac9c8(g->f_894);
    if (r5 > 0)
        r1 = func_020b3870((int)p[1] - 0x24, r5);

    if (g->f_0 != 2)
        return 0;
    if ((int)p[3] - (int)p[1] < r5)
        return 0;
    if (r1 == g->f_8dc) {
        g->f_a84 |= 8;
        return 0;
    }

    func_ov015_021b3520(&g->f_880);
    g->f_4 = a;
    func_02037208(0x38, -1, 0, 1);
    return 0;
}
