/* CAMPAIGN-PREP candidate for func_021b8e4c (ov006, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     branch-on-mode store; conditional Fill+bounded(0x40) build loop; tail call
 *   risk:       _LIT0 fn-ptr reused across func_020a97b8 AND func_02005a60 (both load _LIT0 = same fn); also loop bound is min(0x40, count) with count RELOADED from p+0xca94 each iter — if mwcc binds it the ldr count diverges (permuter-class reg-alloc + struct-guessed offsets).
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov006_021b8e4c (ov006, class C) — MED tier.
 * UNVERIFIED build-free draft. Largest/hardest in batch; tail call past 0x124 may be a fallthrough.
 *   recipe: early branch on arg2; else compute/store fields at p+0xca90.., then conditional (arg3) Fill32 + bounded counted loop building entries via func_021b7240, two summary stores, tail call.
 * Sig: r0=p, r1=arg1(handle/id), r2=mode(arg2), r3=arg3(flag). Note many globals via (char*)p+0xc000+off. */

extern int  func_0202b4f4(int a, int b);
extern int  func_02005a60(int a, int b, int n, void *fn);
extern void func_020a97b8(int a, int b, int n, void *fn);
extern int  func_ov006_021b7240(void *p, int kind, int a2, int hword, int flag);
extern void func_ov006_021b7bb0(void *p, int sel);
extern void func_ov006_021b843c(void *p, int sel, int flag);
extern int  func_ov006_021b8f88(void *p, int i);
extern int  func_ov006_021b9c88(void);

int func_ov006_021b8e4c(char *p, int arg1, int mode, int arg3) {
    if (mode != 0) {
        *(int *)(p + 0xc000 + 0xa94) = (func_0202b4f4(arg1, 0) != 0) ? 1 : 0;
        return 1;
    }
    *(int *)(p + 0xc000 + 0xa94) = func_0202b4f4(arg1, *(int *)(p + 0xc000 + 0xa90));
    func_020a97b8(*(int *)(p + 0xc000 + 0xa90), *(int *)(p + 0xc000 + 0xa94), 2, (void *)func_ov006_021b9c88);
    *(int *)(p + 0xc000 + 0xa94) =
        func_02005a60(*(int *)(p + 0xc000 + 0xa90),
                      (unsigned short)*(int *)(p + 0xc000 + 0xa94), 2, (void *)func_ov006_021b9c88);
    if (arg3 != 0) {
        int i = 0;
        func_ov006_021b843c(p, 4, 0);
        if (*(int *)(p + 0xc000 + 0xa94) > 0) {
            for (i = 0; i < 0x40 && i < *(int *)(p + 0xc000 + 0xa94); i++) {
                int h = func_ov006_021b8f88(p, i);
                func_ov006_021b7240(p, 4, -1, h, 1);
            }
        }
        *(unsigned short *)(p + 0x8100 + 0x68) = (unsigned short)*(int *)(p + 0xc000 + 0xa94);
        *(unsigned short *)(p + 0x8100 + 0x72) = (unsigned short)*(int *)(p + 0xc000 + 0xa94);
        func_ov006_021b7bb0(p, 4);
    }
    return 1;
}
