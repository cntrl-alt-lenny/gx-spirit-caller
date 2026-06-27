/* CAMPAIGN-PREP candidate for func_02010eb8 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     blx fn-ptr guard; 4x4-on-stack then ordered 4x3 field copy
 *   risk:       struct-guessed: func_0208ecd8 9-arg/stacked-arg shape and Mtx44 stack frame inferred from sp offsets; stacked-arg build order likely diverges, confirm signature/struct.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_02010eb8 (main, class C) — prep batch p_0004.
 * UNVERIFIED build-free draft. Drop into src/, run ninja+objdiff, tweak per risk.
 *   recipe: blx-guard via [0xac] fn-ptr; build MtxFx44 on stack; copy to MtxFx43 in exact store-order
 */
/* func_02010eb8: obj=r0(->r4). If obj->fn_ac != 0 call it (no-arg blx).
 * Build a 4x4 fixed-point matrix on the stack via func_0208ecd8 (out=&m at sp+0x14)
 * then copy its first 3 columns of each of 4 rows (4x3 = 12 words, skipping every
 * 4th stack word at +0x20/+0x30/+0x40) into obj+0x00..0x2c IN THIS ORDER. Then
 * func_02011178(obj). Returns 1. The args to func_0208ecd8 are fixed FX32 consts:
 * (-0x70000, 0x70000, -0x80000, 0x80000) + stacked {-0x400000,0x400000,0x400000,1,&m}. */
extern void func_0208ecd8(int a, int b, int c, int d, int e, int f, int g, int h, void *out);
extern void func_02011178(void *obj);

typedef struct { int m[4][4]; } Mtx44;

int func_02010eb8(void *obj) {
    Mtx44 m;
    void (*fn)(void);
    int *o = (int *)obj;
    fn = *(void (**)(void))((char *)obj + 0xac);
    if (fn) fn();
    func_0208ecd8(-0x70000, 0x70000, -0x80000, 0x80000,
                  -0x400000, 0x400000, 0x400000, 1, &m);
    o[0]  = m.m[0][0];
    o[1]  = m.m[0][1];
    o[2]  = m.m[0][2];
    o[3]  = m.m[1][0];
    o[4]  = m.m[1][1];
    o[5]  = m.m[1][2];
    o[6]  = m.m[2][0];
    o[7]  = m.m[2][1];
    o[8]  = m.m[2][2];
    o[9]  = m.m[3][0];
    o[10] = m.m[3][1];
    o[11] = m.m[3][2];
    func_02011178(obj);
    return 1;
}
