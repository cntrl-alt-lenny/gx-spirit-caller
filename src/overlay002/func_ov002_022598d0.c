/* func_ov002_022598d0: clear `f_d48`, then store `arg + 0xd` to `f_d64`.
 *
 *     ldr r1, .L_022598e8
 *     mov r2, #0x0
 *     str r2, [r1, #0xd48]
 *     add r0, r0, #0xd
 *     str r0, [r1, #0xd64]
 *     bx  lr
 */

typedef struct {
    char _pad_d48[0xd48];
    int  f_d48;
    char _pad_d64[0xd64 - 0xd48 - 4];
    int  f_d64;
} state_022d016c_t;

extern state_022d016c_t data_ov002_022d016c;

void func_ov002_022598d0(int arg) {
    data_ov002_022d016c.f_d48 = 0;
    data_ov002_022d016c.f_d64 = arg + 0xd;
}
