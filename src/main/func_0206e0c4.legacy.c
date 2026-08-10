/* func_0206e0c4: lazily default-init a global pointer, spin-wait while
 * func_0206df90() reports -26 (busy), then on func_0206c010() success
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

extern void *data_0219ece0;
extern void *data_0219ef1c;
extern struct S0219ecd8 *data_0219ecd8;
extern struct S0219ecec data_0219ecec;

extern int func_0206df90(void);
extern void func_02091768(int count);
extern int func_0206c010(void);
extern void func_020740c4(void);
extern void func_02074124(void *p);

int func_0206e0c4(void) {
    int result;

    if (data_0219ece0 == 0) {
        data_0219ece0 = data_0219ef1c;
    }

    while (func_0206df90() == -26) {
        func_02091768(100);
    }

    result = func_0206c010();
    if (result >= 0) {
        func_020740c4();
        func_02074124(0);
        if (data_0219ecd8->flag28 == 0) {
            data_0219ecd8->cb(data_0219ecec.val1c);
        }
        data_0219ecd8 = 0;
    }
    return result;
}
