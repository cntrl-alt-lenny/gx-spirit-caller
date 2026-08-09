/* func_02070bac: poll a global callback + a target's flag with a
 * ~39-tick timeout, driven off func_020930b0()'s 64-bit counter shifted
 * right 16 (mid-precision timer extraction: `(u32)(t >> 16)`, which
 * lowers to the register-pair idiom `(lo>>16)|(hi<<16)`).
 */

struct Target02070bac {
    unsigned char pad_00[0x8];
    unsigned char field_8; /* 0x8 */
    unsigned char field_9;   /* 0x9 */
};

struct Inner02070bac {
    unsigned char pad_00[0xa4];
    struct Target02070bac *field_a4; /* 0xa4 */
};

struct S021a63d0 {
    unsigned char pad_00[0x4];
    struct Inner02070bac *field_4; /* 0x4 */
};

extern struct S021a63d0 data_021a63d0;
extern int (*data_0219ef14)(void);
extern void func_02074720(struct Target02070bac *arg);
extern long long func_020930b0(void);
extern void func_0207445c(void);

void func_02070bac(void) {
    struct Target02070bac *t = data_021a63d0.field_4->field_a4;
    unsigned int t0;

    if (t == 0) {
        return;
    }

    if (t->field_9 != 0) {
        func_02074720(t);
    }

    t0 = (unsigned int)(func_020930b0() >> 16);

    while (data_0219ef14() != 0 && t->field_8 != 0 &&
           (int)((unsigned int)(func_020930b0() >> 16) - t0) < 0x27) {
        func_0207445c();
    }

    t->field_8 = 0;
}
