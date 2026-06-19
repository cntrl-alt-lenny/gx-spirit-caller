/* func_ov002_0225974c: clear two distant fields of data_ov002_022d008c.
 *
 *     ldr r0, .L_02259848
 *     mov r1, #0x0
 *     str r1, [r0, #0xd48]
 *     str r1, [r0, #0xd64]
 *     bx  lr
 *  .L_02259848: .word data_ov002_022d008c
 */

typedef struct {
    char _pad_d48[0xd48];
    int  f_d48;
    char _pad_d4c[0xd64 - 0xd48 - 4];
    int  f_d64;
} ov002_d016c_t;

extern ov002_d016c_t data_ov002_022d008c;

void func_ov002_0225974c(void) {
    data_ov002_022d008c.f_d48 = 0;
    data_ov002_022d008c.f_d64 = 0;
}
