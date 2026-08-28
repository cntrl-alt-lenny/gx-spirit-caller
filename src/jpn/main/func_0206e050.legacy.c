/* func_0206e050: lazily default-init a global pointer, spin-wait while
 * func_0206df1c() reports -26 (busy), then on func_0206bf9c() success
 * run two setup calls and conditionally fire a registered callback
 * before clearing the registration.
 */

struct S0219ecd8 {
    unsigned char pad_00[0x1c];
    void (*cb)(int); /* 0x1c */
    unsigned char pad_20[0x28 - 0x20];
    int flag28;        /* 0x28 */
};

struct S0219ecec {
    unsigned char pad_00[0x1c];
    int val1c; /* 0x1c */
};

extern void *data_0219ec00;
extern void *data_0219ee3c;
extern struct S0219ecd8 *data_0219ebf8;
extern struct S0219ecec data_0219ec0c;

extern int func_0206df1c(void);
extern void func_02091680(int count);
extern int func_0206bf9c(void);
extern void func_02073fdc(void);
extern void func_0207403c(void *p);

int func_0206e050(void) {
    int result;

    if (data_0219ec00 == 0) {
        data_0219ec00 = data_0219ee3c;
    }

    while (func_0206df1c() == -26) {
        func_02091680(100);
    }

    result = func_0206bf9c();
    if (result >= 0) {
        func_02073fdc();
        func_0207403c(0);
        if (data_0219ebf8->flag28 == 0) {
            data_0219ebf8->cb(data_0219ec0c.val1c);
        }
        data_0219ebf8 = 0;
    }
    return result;
}
