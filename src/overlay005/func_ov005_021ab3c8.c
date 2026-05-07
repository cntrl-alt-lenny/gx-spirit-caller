/* func_ov005_021ab3c8: stride-0x1c indexed 2-field store —
 * `data->p_8[idx].f_14 = c; data->p_8[idx].f_10 = d;`.
 *
 *     ldr ip, [r0, #0x8]
 *     mov r0, #0x1c
 *     mla r0, r1, r0, ip
 *     str r2, [r0, #0x14]
 *     str r3, [r0, #0x10]
 *     bx  lr
 */

typedef struct {
    char _pad_10[0x10];
    int  f_10;
    int  f_14;
    char _tail[0x1c - 0x18];
} record_1c_t;

typedef struct {
    char         _pad[0x8];
    record_1c_t *p_8;
} state_p8_t;

void func_ov005_021ab3c8(state_p8_t *data, int idx, int c, int d) {
    record_1c_t *r = &data->p_8[idx];
    r->f_14 = c;
    r->f_10 = d;
}
