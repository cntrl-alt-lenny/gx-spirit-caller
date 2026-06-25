/* CAMPAIGN-PREP candidate for func_0209eee0 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind r5=arg0,r4=ctx; ternary->movcc selector; inline early-returns; guard order preserved
 *   risk:       reshape-able: orig threads arg0 in r5 across 3 calls and emits inline bxne per-guard; if mwcc routes guards to one shared epilogue or reloads, branch/restore shape diverges (decl-order/epilogue).
 *   confidence: med
 */
/* func_0209eee0 (main, class C): pre-flight guard chain then a sequence
 * of calls; r5=arg0 held across calls, r4=arg1 used for many field reads.
 * args: r0=arg0 (opaque handle/int passed through), r1=ctx pointer.
 */

typedef struct {
    int   f_0;     /* 0x00: pointer/handle, guarded for cache-clean */
    short f_4;     /* 0x04: u16 count/flag */
    char  _pad6[0x14 - 0x6];
    short f_14;    /* 0x14: u16 selector -> picks 0x2a / 0x6 deltas */
    char  _pad16[0x34 - 0x16];
    short f_34;    /* 0x34: u16 x coord */
    short f_36;    /* 0x36: u16 y coord */
} ctx_0209eee0_t;

extern void func_020928e8(void *addr, int len);
extern int  func_0209db88(int a, int b);
extern int  func_0209dd30(int a, int b, void *p);
extern void func_0209de5c(int idx, int b);
extern void func_0209ee90(ctx_0209eee0_t *c);

int func_0209eee0(int arg0, ctx_0209eee0_t *c) {
    int r0;
    int x, y;

    if (func_0209db88(1, 2) != 0) return 0;
    if (c == 0) return 6;
    if (c->f_4 != 0) {
        if (c->f_0 == 0) return 6;
    }

    x = c->f_34 + (c->f_14 != 0 ? 0x2a : 0);
    if (x > 0x200) return 6;
    y = c->f_36 + (c->f_14 != 0 ? 0x6 : 0);
    if (y > 0x200) return 6;

    func_0209ee90(c);
    func_0209de5c(7, arg0);
    func_020928e8(c, 0x40);
    if (c->f_4 != 0) {
        func_020928e8((void *)c->f_0, 0x40);
    }
    r0 = func_0209dd30(7, 1, c);
    if (r0 == 0) return 2;
    return r0;
}
