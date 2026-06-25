/* CAMPAIGN-PREP candidate for func_021b3fc4 (ov014, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS C: keep r8 base + derived r7(+0xc)/r6(+0x10) by advancing the struct ptr; store f0x14 BEFORE f0x10 (asm order); single zero local reused.
 *   risk:       struct-guessed: stride 0x14 vs sizeof(struct) 0x18 mismatch means mwcc advances by sizeof, not 0x14 — confirm real struct is exactly 0x14 or use char* arithmetic (as shown) so the +0x14 stride is exact.
 *   confidence: med
 */
/* func_ov014_021b3fc4: reset 4 sub-records of an object (stride 0x14): call 0201ef3c
 * with &rec.f0xc and &rec.f0x10, then zero f0x14 then f0x10. Finally run 020058b4
 * and a 2-iter Task_InvokeLocked sweep over a global array. Returns 1. */
extern int  data_ov014_022350e0[];
extern void func_0201ef3c(int a0, void *p1, void *p2);
extern void func_020058b4(void);
extern void Task_InvokeLocked(int task);

struct rec014 { int f0; int f4; int f8; int fc; int f10; int f14; };  /* 0x18, stride used = 0x14 */

int func_ov014_021b3fc4(int obj)
{
    struct rec014 *p = (struct rec014 *)obj;
    int i;
    int zero = 0;

    for (i = 0; i < 4; i++) {
        func_0201ef3c(p->f4, &p->fc, &p->f10);
        p->f14 = zero;
        p->f10 = zero;
        p = (struct rec014 *)((char *)p + 0x14);
    }
    func_020058b4();
    for (i = 0; i < 2; i++) {
        if (data_ov014_022350e0[i] != 0)
            Task_InvokeLocked(data_ov014_022350e0[i]);
    }
    return 1;
}
