/* func_0201d134: 2-field init — set `f_14 = 4`, `f_c = 0` of `data_0218febc`.
 *
 *     ldr r0, .L_0201d14c
 *     mov r1, #0x4
 *     str r1, [r0, #0x14]
 *     mov r1, #0x0
 *     str r1, [r0, #0xc]
 *     bx  lr
 */

typedef struct {
    char _pad_c[0xc];
    int  f_c;
    char _pad_14[0x14 - 0xc - 4];
    int  f_14;
} state_0218febc_t;

extern state_0218febc_t data_0218febc;

void func_0201d134(void) {
    data_0218febc.f_14 = 4;
    data_0218febc.f_c = 0;
}
