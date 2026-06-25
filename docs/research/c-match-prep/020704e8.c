/* CAMPAIGN-PREP candidate for func_020704e8 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl-order obj/r; reuse live arg regs a,b; bind active once
 *   risk:       Tail 'if(abort)return 0;else return r' may fold to a cmovne r0,#0 (movne) instead of orig branch-to-L_950; reshape-able via goto-zero idiom if it diverges.
 *   confidence: med
 */
/* func_020704e8: state-dispatch over manager->active object.
 * Loads obj = data_021a63d0.mgr->active (mgr at +0x4, active at +0xa4).
 * state byte +0x8: 0xa and 0xb route to two paired-call workers that
 * return b+d; any other state routes (by the +0x9 flag) to one of two
 * fall-through workers whose result is gated by the global abort flag
 * data_0219eec0[0] (non-zero abort => return 0).
 *
 * KEY: on the 0xa/0xb paths the first call reuses the LIVE arg regs
 * r0=a,r1=b (never spilled) -> pass the original params a,b unchanged;
 * the second call uses cached c,d. On the default path a,b,c flow
 * straight through to the 4-arg worker (obj passed on the stack).
 */

typedef struct Obj {
    char  _pad08[0x8];
    unsigned char state;   /* +0x8 */
    unsigned char flag9;   /* +0x9 */
} Obj;

typedef struct Mgr {
    char  _pad_a4[0xa4];
    Obj  *active;          /* +0xa4 */
} Mgr;

typedef struct Root {
    char  _pad04[0x4];
    Mgr  *mgr;             /* +0x4 */
} Root;

extern Root data_021a63d0;
extern unsigned char data_0219eec0;
extern int func_020705d4(int a, int b, int c, Obj *obj);
extern void func_02072f00(int a, int b, Obj *obj);
extern void func_02073040(int a, int b, Obj *obj);
extern int func_020747e0(int a, int b, int c, Obj *obj);

int func_020704e8(int a, int b, int c, int d) {
    Obj *obj = data_021a63d0.mgr->active;
    int r;

    if (obj == 0) return 0;

    if (obj->state == 0xa) {
        if (b != 0) func_02072f00(a, b, obj);
        if (d != 0) func_02072f00(c, d, obj);
        r = b + d;
    } else if (obj->state == 0xb) {
        if (b != 0) func_02073040(a, b, obj);
        if (d != 0) func_02073040(c, d, obj);
        r = b + d;
    } else if (obj->flag9 != 0) {
        r = func_020747e0(a, b, c, obj);
    } else {
        r = func_020705d4(a, b, c, obj);
    }

    if (data_0219eec0 != 0) return 0;
    return r;
}
