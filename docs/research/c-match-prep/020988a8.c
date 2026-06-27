/* CAMPAIGN-PREP candidate for func_020988a8 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: signed /20 via smull magic 0x66666667+asr#3 on a pointer-difference; mla idx*0x14; blx fn-ptr loop
 *   risk:       struct-guessed/permuter: the divisor is (end-base)/20 where base/end are the SAME duplicated pool symbol (data_02102c44) — likely stays .s. Also the trailing `blx r0` fn-ptr loop. Express count as pointer-diff/20; campaign may keep .s.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_020988a8 (main, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED. NOTE: ships today as .s (duplicate-pool
 * trick: data_02102c44 appears as both a reloc symbol and a raw literal to
 * defeat the patcher) — the (end-base)/20 idiom may not be C-expressible and
 * the campaign may keep this as .s.
 *   recipe: signed /20 (smull 0x66666667 + asr#3) on a table extent; mla elem = base + idx*0x14; fn-ptr loop.
 *   risk:   struct-guessed/permuter: count = (end-base)/20 over a self-referential pool symbol; trailing blx loop.
 *   confidence: low
 */
/* func_020988a8: if mode(@0x027ffc40)==2 and (s->f1f & 2), and s->f0 < table
 * element count, dispatch func_020989a8 on element s->f0; on its 0-return run
 * func_020945f4 + func_02093bfc. Otherwise (s->f1f&1)->func_02000950, then
 * func_02092904, then call each non-null fn-ptr in [s->f10, s->f14). */

typedef struct {
    int            f00;     /* +0x00 index */
    int            f04;     /* +0x04 */
    int            f08;     /* +0x08 */
    unsigned char  _p0c[4];
    void          *f10;     /* +0x10 fn-ptr array begin */
    void          *f14;     /* +0x14 fn-ptr array end */
    unsigned char  _p18[7];
    unsigned char  f1f;     /* +0x1f flags */
} Disp;

typedef struct { unsigned char _e[0x14]; } Elem;   /* stride 0x14 = 20 */
extern Elem data_02102c44[];
extern Elem data_02102c44_end[];

extern int  func_02098cdc(Disp *);
extern int  func_020989a8(Elem *e, int a, int b);
extern void func_020945f4(int a, int b, int c);
extern void func_02093bfc(void);
extern void func_02000950(int a);
extern void func_02092904(int a, int b);

void func_020988a8(Disp *s) {
    int r4 = func_02098cdc(s);
    int r0 = 0;
    if (*(volatile unsigned short *)0x027ffc40 == 2) {
        if (s->f1f & 2) {
            int n = (int)(data_02102c44_end - data_02102c44);
            if (s->f00 < n)
                r0 = func_020989a8(&data_02102c44[s->f00], s->f04, r4);
        }
        if (r0 == 0) {
            func_020945f4(s->f04, 0, r4);
            func_02093bfc();
            return;
        }
    }
    if (s->f1f & 1)
        func_02000950(s->f04 + r4);
    func_02092904(s->f04, s->f08);
    {
        void **fp = (void **)s->f10;
        void **end = (void **)s->f14;
        for (; fp < end; fp++) {
            void (*fn)(void) = (void (*)(void))*fp;
            if (fn)
                fn();
        }
    }
}
