/* func_020a20e8: mode-dispatch (*modeptr) memory-range commit.
 *   mode 0: validate src->base28/size28 against [0x2000000,0x22c0000);
 *           on failure, assert and bail. On success, commit into *out
 *           and clear out->fc bit0.
 *   mode 1: validate src->base38/size38 against two disjoint windows
 *           ([0x2000000,0x23fe800) and [0x37f8000,0x380f000)); on
 *           failure, assert but still commit. If the sub-range check
 *           says "accumulate", commit via *acc instead of a plain copy.
 *           out->fc: clear then set bit0.
 *   mode 2: unconditional literal commit (0x160 / 0x027ffe00).
 *   default: no-op.
 */

typedef struct {
    char _pad_28[0x28];
    unsigned int base28;   /* +0x28 */
    unsigned int size28;   /* +0x2c */
    char _pad_30[0x38 - 0x30];
    unsigned int base38;   /* +0x38 */
    unsigned int size38;   /* +0x3c */
} Src020a21dc;

typedef struct {
    int f0;
    int f4;
    int f8;
    int fc;
} Out020a21dc;

extern void func_02093b08(void);

void func_020a20e8(Src020a21dc *src, int *modeptr, Out020a21dc *out, int *acc) {
    int mode = *modeptr;
    unsigned int *p;
    unsigned int a, b;
    int fail, accumulate;
    unsigned int sum;

    switch (mode) {
    case 0:
        p = &src->base28;
        a = p[0];
        if (a < 0x2000000 || a >= 0x22c0000) goto fail0;
        b = p[1];
        if ((a + b) > 0x22c0000) goto fail0;
        out->f8 = b;
        out->f4 = p[0];
        out->f0 = out->f4;
        out->fc = out->fc & ~1;
        return;
    fail0:
        func_02093b08();
        return;

    case 1:
        p = &src->base38;
        a = p[0];
        b = p[1];
        sum = a + b;
        fail = 0;
        accumulate = 0;

        if (a < 0x2000000) goto secondary1;
        if (a >= 0x023fe800) goto secondary1;
        /* primary window */
        if (sum <= 0x2300000) goto tail1;
        if (sum >= 0x023fe800) goto setfail_primary1;
        if (b <= 0x40000) {
            accumulate = 1;
            goto tail1;
        }
    setfail_primary1:
        fail = 1;
        goto tail1;

    secondary1:
        if (a < 0x037f8000) goto setfail_secondary1;
        if (a >= 0x0380f000) goto setfail_secondary1;
        if (sum <= 0x0380f000) accumulate = 1;
        else fail = 1;
        goto tail1;
    setfail_secondary1:
        fail = 1;

    tail1:
        if (fail == 1) func_02093b08();

        out->f8 = p[1];
        out->f4 = p[0];
        if (!accumulate) {
            out->f0 = out->f4;
        } else {
            out->f0 = *acc;
            *acc = *acc + out->f8;
        }
        out->fc = (out->fc & ~1) | 1;
        return;

    case 2:
        out->f8 = 0x160;
        out->f4 = 0x027ffe00;
        out->f0 = out->f4;
        out->fc = out->fc & ~1;
        return;
    }
}
