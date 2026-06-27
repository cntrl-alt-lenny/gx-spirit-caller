/* CAMPAIGN-PREP candidate for func_0202a1cc (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Fill32 init; mul-by-0xec; Task_PostLocked; duplicate-symbol .word reloc tail
 *   risk:       reshape-able(reloc-only): the only known diff is the 2nd .word data_0219a934 emitted as a literal to dodge patcher trim — a .s-tail concern; the C body matches at 95.8%+. May need GLOBAL_ASM literal.
 *   confidence: high
 */
/* CAMPAIGN-PREP candidate for func_0202a1cc (main, class C) — brief p_0010.
 * UNVERIFIED build-free draft. KNOWN canary @95.83% fuzzy (brief 206) — the
 * residual is the duplicate-data-symbol reloc (.word literal trim), NOT codegen.
 *   recipe:     Fill32(0,&g,8); store arg; guard g[0]; mul 0xec; Task_PostLocked; store handle; Fill32 clear
 *   risk:       duplicate .word data_0219a934 reloc record (objdiff-only); codegen body itself should match
 *   confidence: high
 */
extern void Fill32(int value, void *dst, int size);
extern void *Task_PostLocked(int size, int a, int b);
extern void func_0202a998(void);

extern int data_0219a934;     /* g[0]=handle(0x0), g[1]=count(0x4); arg stored at 0x219a938 (+0x4) */

int func_0202a1cc(void *arg) {
    int *g = &data_0219a934;

    Fill32(0, g, 0x8);
    *(void **)((char *)0x0219a934 + 0x4) = arg;   /* str r5 [r0,#0x4] with r0=&data */
    if (g[0] == 0) {
        int n = g[1] * 0xec;
        void *h = Task_PostLocked(n, 0x4, 0x0);
        g[0] = (int)h;
        Fill32(0, h, n);
    }
    func_0202a998();
    return 1;
}
