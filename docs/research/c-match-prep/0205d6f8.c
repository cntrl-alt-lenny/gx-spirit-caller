/* CAMPAIGN-PREP candidate for func_0205d6f8 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind base=*s+0x428 across calls; if-assign count<=0 guards; out-desc by ptr returns desc[0]
 *   risk:       reshape-able: orig holds base in r6 across func_020a6d54 + first func_0205d6bc (bind), and the zero-fill store-order is specific; if mwcc recomputes base or reorders the desc zero stores it diverges. desc layout (which words zeroed) struct-guessed.
 *   confidence: med
 */
/* func_0205d6f8: zero a local descriptor, set its first field, then bracket
 * two func_0205d6bc calls around a func_02054568 side-effect, bumping a
 * counter in the sub-object at (*r0)+0x428. base = *s + 0x428 is computed
 * up front and held in a callee reg across both calls (bind it). Guards:
 * count<=0 logs (func_020a6d54) then if <=0 returns 0. First func_0205d6bc
 * success returns desc[0]; otherwise zero desc, desc[0]=count, run
 * func_02054568(base[0]), base[1]++ , second func_0205d6bc -> return
 * desc[0] on success else 0. */

extern char data_02100d74[];
extern char data_02100d7c[];
extern void func_02054568(int x);
extern int  func_0205d6bc(void *s, int n, void *outdesc);
extern void func_020a6d54(void *a, void *b, int c, int d);

typedef struct Base { int f00; int f04; } Base;

int func_0205d6f8(void *s, int count) {
    Base *base = (Base *)((char *)*(void **)s + 0x428);
    int desc[8];

    if (count <= 0)
        func_020a6d54(data_02100d74, data_02100d7c, 0, 0x2b5);
    if (count <= 0) return 0;

    if (func_0205d6bc(s, count, &desc[0]) != 0)
        return desc[0];

    desc[1] = 0;
    desc[2] = 0;
    desc[3] = 0;
    desc[4] = 0;
    desc[5] = 0;
    desc[6] = 0;
    desc[7] = 0;
    desc[1] = count;
    desc[2] = 0;
    desc[4] = 0;
    desc[5] = 0;
    desc[7] = 0;
    desc[6] = 0;

    func_02054568(base->f00);
    base->f04 = base->f04 + 1;
    if (func_0205d6bc(s, count, &desc[0]) != 0)
        return desc[0];
    return 0;
}
