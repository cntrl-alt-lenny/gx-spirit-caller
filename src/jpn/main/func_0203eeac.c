/* func_0203eeac: acquire a handle + poll a state value; if the state is
 * inactive bail out early; otherwise conditionally refresh a cached
 * field, tick a global, and on a specific state value flag a slot in a
 * side table before returning a state-derived status code. */

extern void *func_0203c8b0(int a0);
extern int func_020431bc(void);
extern int func_0203c7c4(int a0);
extern int func_020431a4(void);
extern void func_02043280(void);

struct S0203eefc_A0 {
    unsigned char _pad_00[0xd0d];
    unsigned char f_d0d;   /* +0xd0d */
    unsigned char _pad_d0e[0xd13 - 0xd0e];
    unsigned char f_d13;   /* +0xd13 */
};

struct S0203eefc_Handle {
    unsigned char _pad_00[0x10];
    int f_10;             /* +0x10 */
    unsigned char _pad_14[0x15 - 0x14];
    unsigned char f_15;   /* +0x15 */
};

int func_0203eeac(struct S0203eefc_A0 *a0) {
    struct S0203eefc_Handle *handle;
    int state;

    handle = (struct S0203eefc_Handle *)func_0203c8b0(1);
    state = func_020431bc();
    if (state != 0) {
        if (handle->f_15 == func_0203c7c4(a0->f_d0d)) {
            handle->f_10 = func_020431a4();
        }

        func_02043280();
        if (state == 0xb) {
            return 0xf;
        }

        *((unsigned char *)a0 + (a0->f_d13 << 2) + 0x444) = 1;
        return 0xb;
    }
    return 0xe;
}
