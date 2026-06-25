/* CAMPAIGN-PREP candidate for func_0201c224 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     :16 bitfield insert low16 (mask hi/or lo); id==0x2f guard; tail call passes r7+0xa
 *   risk:       permuter-class / struct-guessed: orig's final call is a raw `.word 0xeb065ba3` = bl into overlay 0x021b30f4, UN-LINKABLE from a main C TU — no C reshape produces that branch, hence already shipped as .s; +0x18 struct layout also inferred.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_0201c224 (main, class C) — UNVERIFIED build-free draft.
 * NOTE: ALREADY shipped as src/main/func_0201c224.s — the original has a hardcoded `.word 0xeb065ba3`
 * which decodes to `bl 0x021b30f4` (a call from arm9-main INTO an overlay). That target is not
 * linkable from a main .c TU, so a normal C build cannot reproduce the branch — this is the reason
 * it ships as .s. C draft below is best-effort for documentation only.
 *   r5=a(ptr,r0), r4=id(r1).
 *   GetSystemWork(); h = func_02019a58(id);                       // returns u16
 *   v = (*(int*)(a+0x18) & ~0xffff) | (u16)h;  *(int*)(a+0x18) = v;  // bitfield insert low16
 *   func_02018a84((u16)v, 1);
 *   r7 = (id==0x2f) ? func_02018cdc(id) : 0;
 *   r6 = func_02018f80(); arg1 = func_02018f90();
 *   *(int*)a = func_021b30f4(r6, arg1, id, r7+0xa);   // the .word bl target
 * The +0x18 low-16 insert is a :16 bitfield; insert order (mask hi, or lo16) must hold. */
extern char *GetSystemWork(void);
extern unsigned short func_02019a58(int id);
extern void func_02018a84(int packed, int one);
extern int func_02018cdc(int id);
extern int func_02018f80(void);
extern int func_02018f90(void);
extern int func_021b30f4(int a, int b, int id, int d);

struct S0201c224 {
    char pad0[0x18];
    unsigned short f18_lo;
    unsigned short f18_hi;
};

void func_0201c224(struct S0201c224 *a, int id) {
    int r7;
    int r6, b;
    GetSystemWork();
    a->f18_lo = func_02019a58(id);
    func_02018a84(a->f18_lo, 1);
    if (id == 0x2f)
        r7 = func_02018cdc(id);
    else
        r7 = 0;
    r6 = func_02018f80();
    b = func_02018f90();
    *(int *)a = func_021b30f4(r6, b, id, r7 + 0xa);
}
