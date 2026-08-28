typedef struct {
    void *f0;    /* +0x0 */
    char _pad_8[0x8 - 0x4];
    void *f8;      /* +0x8 */
} Target0205d614;

typedef struct {
    char _pad_c[0xc];
    Target0205d614 *fc;   /* +0xc */
} Arg1_0205d614;

typedef struct {
    void *f0;      /* +0x0 */
    void *f4;        /* +0x4 */
    void **f8;          /* +0x8 */
    int fc;                /* +0xc */
} Arg2_0205d614;

extern int func_020aae4c(void *a, void *b);

int func_0205d5a0(void *unused, Arg1_0205d614 *arg1, Arg2_0205d614 *arg2) {
    Target0205d614 *target = arg1->fc;

    if (target == 0) goto ret1;
    if (func_020aae4c(arg2->f0, target->f0) != 0) goto ret1;
    if (func_020aae4c(arg2->f4, target->f8) != 0) goto ret1;

    *arg2->f8 = arg1;
    arg2->fc = 1;
    return 0;
ret1:
    return 1;
}
