/* func_ov005_021ad018: store two args into distant fields of state, return 1.
 *
 *     ldr r2, .L_021ad02c
 *     str r0, [r2, #0x44]
 *     str r1, [r2, #0x8]
 *     mov r0, #0x1
 *     bx  lr
 *  .L_021ad02c: .word data_ov005_021b1e6c
 */

typedef struct {
    char _pad_8[0x8];
    int  f_8;
    char _pad_c[0x44 - 0x8 - 4];
    int  f_44;
} ov005_1e6c_t;

extern ov005_1e6c_t data_ov005_021b1e6c;

int func_ov005_021ad018(int a, int b) {
    data_ov005_021b1e6c.f_44 = a;
    data_ov005_021b1e6c.f_8 = b;
    return 1;
}
