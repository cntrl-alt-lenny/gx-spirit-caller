/* CAMPAIGN-PREP candidate for func_0229eedc (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     cnt--/==0 zero; block1 RMW on s->f28 (&s->f28); block2 LOCAL union (&cfg); preserve memory target
 *   risk:       permuter-class+struct-guessed: two near-identical bitfield-RMW blocks differing only in memory target (s->f28 vs stack); mwcc reg-alloc across both rarely byte-matches. Already .s.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov002_0229eedc (ov002, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED. ships-as-.s today (multi-field-RMW wall).
 *   recipe: cnt--; ==0 -> zero a0; first RMW block writes BACK to s->f28 (pass &s->f28);
 *           second block (cnt>1) uses LOCAL union copy + &cfg. Mirror which memory each block hits.
 */
typedef union { unsigned short hw; struct {
    unsigned short b0 : 1; unsigned short f1 : 5; unsigned short f6 : 8;
    unsigned short e : 1;  unsigned short g : 1;
} b; } Cfg28;

typedef struct {
    char   a0;                /* +0x00 */
    char   _pad01[0x13];
    char   _pad14[0x14];      /* +0x14 sub-struct */
    unsigned short f28;       /* +0x28 */
    short  cnt;               /* +0x2a */
} ObjEE;

extern int  func_ov002_021c988c(int, int, int);
extern int  func_ov002_021c9504(int, int, int);
extern void func_ov002_0229d184(void *dst, int id, unsigned short *cfg);

void func_ov002_0229eedc(ObjEE *s) {
    Cfg28 c;
    int v, id;

    s->cnt--;
    if (s->cnt == 0) { s->a0 = 0; return; }

    /* first block: RMW directly on s->f28 */
    v = (((Cfg28 *)&s->f28)->b.f1 == 0xd) ? 0 : (s->cnt - 1);
    ((Cfg28 *)&s->f28)->b.f6 = (unsigned short)v;
    ((Cfg28 *)&s->f28)->b.e = func_ov002_021c988c(((Cfg28 *)&s->f28)->b.b0,
                                 ((Cfg28 *)&s->f28)->b.f1, ((Cfg28 *)&s->f28)->b.f6) & 1;
    ((Cfg28 *)&s->f28)->b.g = 0;
    id = func_ov002_021c9504(((Cfg28 *)&s->f28)->b.b0,
                             ((Cfg28 *)&s->f28)->b.f1, ((Cfg28 *)&s->f28)->b.f6);
    func_ov002_0229d184(s, id, &s->f28);

    if (s->cnt <= 1) return;

    /* second block: LOCAL copy, pass &cfg, dst = &s->sub14 */
    c.hw = s->f28;
    v = (c.b.f1 == 0xd) ? 1 : (s->cnt - 2);
    c.b.f6 = (unsigned short)v;
    c.b.e = func_ov002_021c988c(c.b.b0, c.b.f1, c.b.f6) & 1;
    c.b.g = 0;
    id = func_ov002_021c9504(c.b.b0, c.b.f1, c.b.f6);
    func_ov002_0229d184(&s->_pad14[0], id, &c.hw);
}
