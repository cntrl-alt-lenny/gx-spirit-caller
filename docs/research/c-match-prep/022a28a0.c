/* CAMPAIGN-PREP candidate for func_022a28a0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     switch(f4) sets G_D44 then tail-call; signed range-dispatch with early returns; (1<<(n+1)); store G before call
 *   risk:       permuter-class+struct-guessed: deep nested range-ladder (>5,>=0x4b,>=0x48,6<st<0x49,==6) — my C nesting may emit cmp/branch order differing from orig's flat cmp+bge/blt ladder; f68/f8-low16 offsets inferred. Already .s.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov002_022a28a0 (ov002, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED. large branchy dispatch + many tail calls; ships-as-.s.
 *   recipe: switch on s->f4 (5 / 6|9 / else) sets a global word at +0xd44; then sign/range
 *           dispatch on s->f4 with early ldmia returns; store-order of g.f_d44 before each call.
 */
extern char data_ov002_022d016c[];               /* base; word at +0xd44 */
extern int  func_ov002_021afaf0(void);
extern void func_ov002_021afb64(int);
extern void func_ov002_021aff4c(int);
extern void func_ov002_0229f788(void *s);
extern int  func_ov002_022abf88(void *s, int idx);

#define G_D44 (*(int *)(data_ov002_022d016c + 0xd44))

typedef struct {
    int f0;
    int f4;          /* +0x04 state */
    int f8;          /* +0x08 (low 16 = limit) */
    int fc;          /* +0x0c bitmask */
    char _pad10[0x10];
    int f20;         /* +0x20 index */
    char _pad24[0x28];
    int f4c;         /* +0x4c */
    char _pad50[0x18];
    int *f68;        /* +0x68 ptr table */
} ObjA28;

void func_ov002_022a28a0(ObjA28 *s) {
    int st = s->f4;
    if (st == 5) {
        G_D44 = s->f20 + 1;
        func_ov002_0229f788(s);
    } else if (st == 6 || st == 9) {
        s->fc |= (1 << (s->f20 + 1));
        s->f4c++;
        if (s->f4c >= (unsigned short)s->f8) {
            G_D44 = s->fc;
            func_ov002_0229f788(s);
        }
    } else {
        G_D44 = s->f20;
        func_ov002_0229f788(s);
    }

    st = s->f4;
    if (st >= 0) return;
    st = -st;
    if (st > 5) {
        if (st >= 0x4b) {
            G_D44 = func_ov002_022abf88(s, s->f20);
            func_ov002_0229f788(s);
        } else if (st >= 0x48) {
            G_D44 = s->f4c;
            func_ov002_0229f788(s);
        } else if (st > 6 && st < 0x49) {
            if (func_ov002_021afaf0() == 1) {
                s->f4c++;
                func_ov002_021aff4c(s->f68[s->f20]);
            }
            G_D44 = s->f4c;
            func_ov002_0229f788(s);
        } else {
            /* st==6 falls here (st>5 but not >6): handled below */
            if (st < 6) return;
            {
                int v = s->f68[s->f20];
                G_D44 = 1;
                func_ov002_021afb64(v);
                s->f4c++;
                func_ov002_021aff4c(v);
                func_ov002_0229f788(s);
            }
        }
    } else {
        func_ov002_0229f788(s);
    }
}
