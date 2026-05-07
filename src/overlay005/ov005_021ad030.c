/* func_ov005_021ad030: store two args into adjacent fields, return 1.
 *
 *     ldr r2, .L_021ad044
 *     str r0, [r2, #0x8]
 *     str r1, [r2, #0xc]
 *     mov r0, #0x1
 *     bx  lr
 *  .L_021ad044: .word data_ov005_021b1e4c
 */

typedef struct {
    char _pad[0x8];
    int  f_8;
    int  f_c;
} ov005_1e4c_t;

extern ov005_1e4c_t data_ov005_021b1e4c;

int func_ov005_021ad030(int a, int b) {
    data_ov005_021b1e4c.f_8 = a;
    data_ov005_021b1e4c.f_c = b;
    return 1;
}
