/* CAMPAIGN-PREP candidate for func_022b9388 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: mla table index (c&1)*0x868 + d*0x14; lsr#0xa/tst bit; branch tail.
 *   risk:       5th arg d at [sp,#0x10] - cannot express as a clean param via pointer hack; the &&-guard short-circuit order (0202e234 then c>=0 then d>=0) and the conditional-load of d must match. struct-guessed/permuter-class on the stack-arg + guard chain.
 *   confidence: low
 */
/* func_ov002_022b9388 - table-indexed bit test + paired update calls.
 * f(r0=self,r1=a,r2=b,r3=c, [sp,#0x10]=d). Holds a in r5, c in r6, b in r4.
 * If func_0202e234(a)==0 AND c>=0 AND d>=0: idx into data_ov002_022cf1ac
 *   via mla(c&1, 0x868, base) + d*0x14; bit = (word>>0xa)&1; if !bit a=0x1362.
 * Then func_ov002_022bdd54(a). If b==0 return; if prev ret!=0 return;
 * recompute via func_0202e234(a): r0 = ret?0xfe0:0x1362; func_..bdd54(r0). */

extern unsigned int data_ov002_022cf1ac[];   /* _LIT1 base */
extern int  func_0202e234(int a);
extern int  func_ov002_022bdd54(int v);

int func_ov002_022b9388(int self, int a, int b, int c)
{
    int d;
    int ret;
    unsigned int word;

    d = *(int *)((char *)&self - 0);   /* placeholder: 5th arg [sp,#0x10] */
    /* real 5th param: */
    (void)self;

    if (func_0202e234(a) == 0 && c >= 0) {
        d = *((&c) + 1);   /* stack arg d */
        if (d >= 0) {
            word = *(unsigned int *)((char *)data_ov002_022cf1ac
                       + (c & 1) * 0x868 + d * 0x14);
            if (((word >> 0xa) & 1) == 0)
                a = 0x1362;
        }
    }

    ret = func_ov002_022bdd54(a);
    if (b == 0) return ret;
    if (ret != 0) return ret;

    if (func_0202e234(a) != 0)
        return func_ov002_022bdd54(0xfe0);
    else
        return func_ov002_022bdd54(0x1362);
}
