/* CAMPAIGN-PREP candidate for func_020621dc (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     flag r3 via nested if; movhi overflow tests; advance+re-arm; bool tail movne
 *   risk:       orig reuses r2 for both state_c (first cmp) and f20 (the >0 test) — decl/CSE of state_c vs f20 may not coincide; and (now-f1c)>lim emitted unsigned (cmp+movhi). If mwcc picks signed cmp the movhi->movgt diverges. reshape-able (cast to unsigned, already done).
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_020621dc (main, class C) — brief 496.
 * UNVERIFIED build-free draft. MED tier: byte-match not expected first build.
 *   recipe: build flag r3 via nested if; movhi for the two overflow tests; bool tail
 */
/* func_020621dc: timeout/advance check. If state (+0xc) >= 5 return 1. Else
 * build a 'fire' flag: if +0x10 set, require +0x20 != 0 and (now - +0x1c) >
 * +0x20; if +0x10 clear, require state < 4 and (now - +0x1c) > 60000. When
 * fired, advance (func_020628fc, func_02061fa4) and re-arm via
 * func_02061c5c(p,6,0,0); return 0 if that reports done, else 1. */

extern void func_02061fa4(void *p);
extern void func_020628fc(void *p);
extern int  func_02061c5c(void *p, int a, int b, int c);

typedef struct Obj {
    char _pad_00[0xc];
    int  state_c;     /* +0xc */
    int  f10;         /* +0x10 */
    char _pad14[0x1c - 0x14];
    int  f1c;         /* +0x1c */
    int  f20;         /* +0x20 */
} Obj;

int func_020621dc(Obj *p, int now) {
    int fire;
    if (p->state_c < 5) {
        fire = 0;
        if (p->f10 != 0) {
            int lim = p->f20;
            if (lim != 0) {
                if ((unsigned int)(now - p->f1c) > (unsigned int)lim) fire = 1;
            }
        } else if (p->state_c < 4) {
            if ((unsigned int)(now - p->f1c) > 0xea60) fire = 1;
        }
        if (fire) {
            func_020628fc(p);
            func_02061fa4(p);
            if (func_02061c5c(p, 6, 0, 0) == 0) return 0;
        }
    }
    return 1;
}
