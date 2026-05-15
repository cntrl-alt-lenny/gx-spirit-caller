/* func_02007188: 4-field write to data_02104e3c — sequential f_0/f_4
 * (via stmia), bit-set on f_10, then store of arg c at f_14.
 *
 *     ldr r3, .L_020071c0
 *     stmia r3, {r0, r1}      ; data->f_0 = a; data->f_4 = b (atomic 2-word)
 *     ldr r0, [r3, #0x10]
 *     orr r0, r0, #0x2
 *     str r0, [r3, #0x10]      ; data->f_10 |= 2
 *     str r2, [r3, #0x14]      ; data->f_14 = c
 *     bx  lr
 *
 * mwcc fuses the f_0/f_4 stores into a single `stmia` because they're
 * both written from caller-arg registers in order at offset 0/4.
 */

typedef struct {
    int f_0;
    int f_4;
    char _pad_8[0x10 - 0x8];
    unsigned int f_10;
    int f_14;
} state_02104f1c_t;

extern state_02104f1c_t data_02104e3c;

void func_02007188(int a, int b, int c) {
    data_02104e3c.f_0 = a;
    data_02104e3c.f_4 = b;
    data_02104e3c.f_10 |= 0x2;
    data_02104e3c.f_14 = c;
}
