/* CAMPAIGN-PREP candidate for func_020a95e4 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     store-order multi-global RMW; va_list-style stack arg block bic#3+4
 *   risk:       struct-guessed: globals indexed at +0xc and the [base+4]->[+0x6c] chase are inferred offsets; the bic r0,#3;add #4 is a va_arg align that mwcc emits only from real <stdarg.h> va_list, not this hand &args expression. permuter-class otherwise.
 *   confidence: low
 */
extern int func_020ace14(void *p);
extern int func_0209268c(void *lock);
extern void func_02092748(void *lock);
extern void func_020927b8(void *lock);
extern int func_020a8d50(void *a, void *b, void *c, void *d);
extern int func_020a9574(void);

extern unsigned int data_02102764;
extern unsigned char data_021a63d0[];
extern int data_021aa040[];
extern int data_021aa064[];
extern unsigned char data_021aa0d0[];

int func_020a95e4(int a0, int a1, int a2, int a3)
{
    void *args[4];
    args[0] = (void *)a0;
    args[1] = (void *)a1;
    args[2] = (void *)a2;
    args[3] = (void *)a3;

    if (func_020ace14(&data_02102764) >= 0)
        return -1;

    if (func_0209268c(&data_021aa0d0) == 0) {
        *(int *)(&data_021aa040[3]) = *(int *)(*(char **)((char *)&data_021a63d0 + 4) + 0x6c);
        *(int *)(&data_021aa064[3]) = 1;
    } else if (*(int *)(&data_021aa040[3]) == *(int *)(*(char **)((char *)&data_021a63d0 + 4) + 0x6c)) {
        *(int *)(&data_021aa064[3]) += 1;
    } else {
        func_020927b8(&data_021aa0d0);
        *(int *)(&data_021aa040[3]) = *(int *)(*(char **)((char *)&data_021a63d0 + 4) + 0x6c);
        *(int *)(&data_021aa064[3]) = 1;
    }

    {
        int r = func_020a8d50((void *)func_020a9574, &data_02102764,
                              (void *)args[0],
                              (void *)(((unsigned int)&args[0] & ~3u) + 4));
        if (--(*(int *)(&data_021aa064[3])) == 0)
            func_02092748(&data_021aa0d0);
        return r;
    }
}
