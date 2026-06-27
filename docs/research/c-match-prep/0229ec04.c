/* CAMPAIGN-PREP candidate for func_0229ec04 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     +0x28 :1/:5/:8 bitfield decompose; counter/10 magic; min if-assign; eor parity flags; switch RMW
 *   risk:       permuter-class: orig interleaves f1/b0 extraction, eq_c/eq_p, and counter/10 before the switch; reg-coloring/scheduling of that interleave drives the diff (ships as .s).
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov002_0229ec04 (ov002, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED. ships-as-.s today; first build unlikely 100%.
 *   recipe: +0x28 :1/:5/:8 bitfield struct decomposed for helper call; counter/10 magic
 *           clamped via if-assign min; two equality flags eor'd; switch(q) cases 1/2/3 RMW pair.
 */
typedef struct {
    unsigned short b0 : 1;   /* bit0      -> helper arg0 */
    unsigned short f1 : 5;   /* bits[5:1] -> helper arg1 */
    unsigned short f6 : 8;   /* bits[13:6]-> helper arg2 */
    unsigned short e  : 1;
    unsigned short g  : 1;
} Cfg28;

typedef struct {
    char _pad00[0x28];
    Cfg28 cfg;               /* +0x28 */
    short cnt;               /* +0x2a, signed counter */
} ObjEC;

extern int  data_ov002_022cd73c[];                 /* [+0x4] parity flag */
extern void func_ov002_0229ea40(int *out2, int a, int b);

void func_ov002_0229ec04(int *res, ObjEC *s) {
    int buf[4];
    int out0, out1;
    int q, t, eq_c, eq_p, x;

    func_ov002_0229ea40(buf, s->cfg.b0, s->cfg.f1);
    out0 = buf[0];
    out1 = buf[1];

    q = s->cnt / 10;
    if (q > 3) q = 3;

    eq_c = (s->cfg.f1 == 0xc);
    eq_p = ((data_ov002_022cd73c[1] ^ 1) == (int)s->cfg.b0);
    x = eq_c ^ eq_p;

    if (q == 1) {
        out1 -= 1;
    } else if (q == 2) {
        t = x ? -1 : 1;
        out0 += t;
        out1 -= 2;
    } else if (q == 3) {
        t = x ? -1 : 1;
        out0 += t;
        out1 -= 3;
    }
    res[0] = out0;
    res[1] = out1;
}
