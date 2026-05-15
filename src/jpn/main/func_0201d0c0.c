/* func_0201d0c0: 3-field initialiser for data_0218fddc.
 *
 *     ldr r1, .L_0201d130
 *     mov r2, #0x5
 *     str r2, [r1, #0x14]      ; data->f_14 = 5
 *     str r0, [r1, #0x18]      ; data->f_18 = arg
 *     mov r0, #0x0
 *     str r0, [r1, #0xc]       ; data->f_c  = 0
 *     bx  lr
 */

typedef struct {
    char _pad_c[0xc];
    int  f_c;
    char _pad_14[0x14 - 0xc - 4];
    int  f_14;
    int  f_18;
} state_0218febc_t;

extern state_0218febc_t data_0218fddc;

void func_0201d0c0(int arg) {
    data_0218fddc.f_14 = 5;
    data_0218fddc.f_18 = arg;
    data_0218fddc.f_c = 0;
}
