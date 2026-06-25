/* CAMPAIGN-PREP candidate for func_02093454 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS C: movs-test obj||obj->cb; store order 1c,20,cb,arg5; 64-bit adds/adc via u64 pair
 *   risk:       struct-guessed: arg5 is 5th stack param at [sp,#0x18]; field offsets +0/+4/+1c/+20 inferred. Also sumhi(adc r2) is computed but unused by call — confirm caller ABI / whether r2 is a hidden 3rd arg.
 *   confidence: low
 */
// func_02093454 — re-init timer/alarm: optional reset, then IRQ-guarded 64-bit deadline setup
// r6=obj(param0); r5=lo(param1); r4=hi(param2); r7=cb(param3); arg5@[sp,#0x18]

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int);
extern void func_020934cc(void *obj, int lo_sum);
extern int  func_02093bfc(void);

typedef struct { unsigned int lo; unsigned int hi; } u64pair;
extern u64pair func_020930b0(void); // returns 64-bit now() in r0(lo)/r1(hi)

typedef struct {
    int  cb;     // 0x0   (r7 param3)
    int  arg5;   // 0x4
    char pad[0x14];
    int  x1c;    // 0x1c
    int  x20;    // 0x20
} Obj;

void func_02093454(Obj *obj, int lo, int hi, int cb, int arg5) {
    int save;
    u64pair now;
    int sumlo, sumhi;

    if (obj == 0 || obj->cb == 0)
        func_02093bfc();
    save = OS_DisableIrq();
    obj->x1c = 0;
    obj->x20 = 0;
    obj->cb = cb;
    obj->arg5 = arg5;
    now = func_020930b0();
    sumlo = lo + now.lo;
    sumhi = hi + now.hi;
    func_020934cc(obj, sumlo);
    (void)sumhi;
    OS_RestoreIrq(save);
}
