/* CAMPAIGN-PREP candidate for func_02084efc (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     short-circuit || in asm order; 5th arg &data via stack; size>>2 unsigned
 *   risk:       reshape-able: the size<0x100 || data==-1 guard with mvn/cmp-against-(-1) - if mwcc fuses to cmn or reorders the two branches, the .L_43c/.L_458 split moves. Keep || order.
 *   confidence: med
 */
/* func_02084efc: size-gated allocator dispatch. r5=p(param1) r4=size(param2,
 * unsigned). Small path when size<0x100 OR data_0210249c==-1:
 *   func_02084e0c(p->f0, p+4, (size>>2)-1).
 * Else: func_02084fe0(); data_021a4824=1; pick func_0209417c (when
 * data_021a4828!=0) else func_02094378, both called
 *   (data_0210249c, p, size, func_02084fbc, &data_021a4824). */

extern int  data_0210249c;
extern int  data_021a4824;
extern int  data_021a4828;
extern int  func_02084e0c(int a, void *b, int n);
extern void func_02084fe0(void);
extern void func_02084fbc(void);
extern void func_0209417c(int a, void *p, unsigned int size, void (*cb)(void), int *q);
extern void func_02094378(int a, void *p, unsigned int size, void (*cb)(void), int *q);

void func_02084efc(unsigned char *p, unsigned int size)
{
    if (size < 0x100 || data_0210249c == -1) {
        func_02084e0c(*(int *)p, p + 4, (size >> 2) - 1);
        return;
    }
    func_02084fe0();
    data_021a4824 = 1;
    if (data_021a4828 != 0)
        func_0209417c(data_0210249c, p, size, func_02084fbc, &data_021a4824);
    else
        func_02094378(data_0210249c, p, size, func_02084fbc, &data_021a4824);
}
