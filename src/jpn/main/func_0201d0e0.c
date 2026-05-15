/* func_0201d0e0: 2-field init — set `f_14 = 4`, `f_c = 0` of `data_0218fddc`.
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

extern state_0218febc_t data_0218fddc;

void func_0201d0e0(void) {
    data_0218fddc.f_14 = 4;
    data_0218fddc.f_c = 0;
}
