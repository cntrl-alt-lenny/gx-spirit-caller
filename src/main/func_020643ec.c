/* func_020643ec: dispatch on a0's field_0xc state: <5 branches into a
 * validate-then-commit or a mark-then-reset path; ==7 (in the >=5
 * range) is a no-op success; otherwise reset-then-validate. Common
 * trailing "return 1" reached from every non-failing path. */

extern void func_02061fa4(void *a0);
extern int func_02061c5c(void *a0, void *a1, int a2, int a3);
extern int func_02061a8c(void *a0, void *a1);

struct S020643ec_A0 {
    unsigned char _pad_00[0xc];
    int f_c;    /* +0xc */
    int f_10;     /* +0x10 */
    int f_14;       /* +0x14 */
};

int func_020643ec(struct S020643ec_A0 *a0, void *a1, void *a2) {
    int state = a0->f_c;

    if (state < 5) {
        if (a0->f_10 != 0) {
            func_02061fa4(a0);
            if (func_02061c5c(a0, a1, 0, 0) == 0) {
                return 0;
            }
        } else {
            if (state == 4) {
                a0->f_14 = 1;
            }
            func_02061fa4(a0);
        }
    } else {
        if (state != 7) {
            func_02061fa4(a0);
            if (func_02061a8c(a0, a2) == 0) {
                return 0;
            }
        }
    }
    return 1;
}
