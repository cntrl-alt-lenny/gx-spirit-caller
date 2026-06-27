/* CAMPAIGN-PREP candidate for func_02020a24 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS C: reload base each block (orig re-ldr _LIT0); if-chain ||; store +0x10 then +0x3c order
 *   risk:       variadic fn-ptr (+0x38) calls + per-block reload-vs-bind of data_02191f40 base; if mwcc binds it in one reg, the repeated `ldr _LIT0` collapse and diverge. permuter-class
 *   confidence: low
 */
/* func_02020a24: field stores + (1||3||5) guard chain + dual tail calls.
 * Global struct at data_02191f40; +0x38 is a fn-ptr called 3 ways.
 * Base is RELOADED each block in the orig (ldr _LIT0 repeats), not bound. */

extern char data_020c65b4[];
extern char data_020c65cc[];
extern char data_020c6810[];
extern char data_02191f40[];
extern char data_02192020[];
extern int  func_0201f138(int x);
extern void func_0201fc6c(void);
extern void func_0201fd24(void);
extern void func_02092904(void *p, int n);
extern void func_02092928(void);
extern void func_02093bfc(void);
extern void func_02094688(void *dst, void *src, int n);

typedef struct {
    char pad00[0x10];
    int  f10;      /* 0x10 */
    char pad14[0x04];
    int  f18;      /* 0x18 */
    char pad1c[0x14];
    int  f30;      /* 0x30 */
    char pad34[0x04];
    void (*f38)();  /* 0x38 fn-ptr */
    int  f3c;      /* 0x3c */
    int  f40;      /* 0x40 */
} S02191f40;

int func_02020a24(int a0, void *a1) {
    S02191f40 *s = (S02191f40 *)data_02191f40;
    if (s->f30 != 1) {
        func_02093bfc();
    }
    s = (S02191f40 *)data_02191f40;
    s->f10 = 0xc0;
    s->f3c = 0x20;
    if (s->f38 != 0) {
        s->f38(data_020c65b4);
    }
    s = (S02191f40 *)data_02191f40;
    if (s->f38 != 0) {
        s->f38(data_020c65cc, s->f3c);
    }
    s = (S02191f40 *)data_02191f40;
    s->f40 = a0;
    func_0201f138(3);
    if (a0 == 1 || a0 == 3 || a0 == 5) {
        func_02094688(a1, data_02192020, 0xc0);
        func_02092904(data_02192020, 0xc0);
        func_02092928();
        s = (S02191f40 *)data_02191f40;
        if (s->f18 != 0) {
            func_0201fc6c();
        } else {
            func_0201fd24();
        }
        return 0;
    }
    s = (S02191f40 *)data_02191f40;
    if (s->f38 != 0) {
        s->f38(data_020c6810, a0);
    }
    return 0;
}
