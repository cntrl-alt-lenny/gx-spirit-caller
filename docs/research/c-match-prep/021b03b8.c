/* CAMPAIGN-PREP candidate for func_021b03b8 (ov008, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: div-magic /32 + signed %8 (ror#0x1b); abs via movpl/rsbmi; mla table base 0x34
 *   risk:       permuter-class: three calls each recompute g[0]+g[1] and hold r4v/r5v in callee-saved r4/r5 across them; the asr-round /32 and ror#0x1b %8 are exact magic mwcc reproduces, but call-result reg rotation + cmp-after-strh `subs` reuse won't reshape. struct-guessed.
 *   confidence: low
 */
/* func_ov008_021b03b8 — clamp + div-magic + call-result temps (class D).
 * data_ov008_021b2de4: u16 at +0 (cur), +2 (delta), +0xa8 (limit).
 * Tail: signed %8 via ror#0x1b + /32 via asr, table bit-test into 021b27bc[]. */
#include "ov008_core.h"

extern void func_ov008_021ac06c(int x, int *out, int a2);
extern void func_ov008_021af338(void);
extern void func_ov008_021af154(int a, int flag);
extern int  func_ov008_021aedfc(int v);
extern int  func_ov008_021aee54(int v);

void func_ov008_021b03b8(void) {
    unsigned short *g = (unsigned short *)data_ov008_021b2de4;
    int t, cur, d, ad, q, r0v, r4v, r5v, idx, bit;
    int *tbl;
    t = g[0];                                  /* str r3,[sp] */
    func_ov008_021ac06c(0, &t, ((int)g[0xa8/2]) - 3);
    cur = g[0];
    if (t == cur) return;
    g[0] = (unsigned short)t;
    cur = g[0];                                /* re-read */
    d = cur - g[0]; /* placeholder, see note */
    ad = (t - cur); if (ad < 0) ad = -ad;      /* movpl/rsbmi abs */
    if (ad >= 5) {
        func_ov008_021af338();
    } else if (t > cur) {
        func_ov008_021af154(0, 1);
    } else {
        func_ov008_021af154(cur - t, 0);
    }
    r5v = func_ov008_021aee54(g[0] + g[1]);
    r4v = func_ov008_021aedfc(g[0] + g[1]);
    r0v = func_ov008_021aee54(g[0] + g[1]);
    q   = r0v / 32;                            /* asr#4 round + asr#5 */
    bit = ((unsigned)r5v) % 8;                 /* lsl#0x1b..ror#0x1b signed %8 */
    tbl = (int *)(data_ov008_021b27bc + r4v * 0x34);
    if ((tbl[q] & (1 << bit)) == 0) {
        g[2] = 0;                              /* streqh [+4] */
    }
}
