/* func_0200612c: copy `data_02103c94[0x18]` to `*r0` and `data_02103c94[0x1c]`
 * to `*r1`. Same shape as func_020060f4, different offsets.
 *
 *     ldr r2, .L_02006160
 *     ldr r3, [r2, #0x18]
 *     str r3, [r0, #0x0]
 *     ldr r0, [r2, #0x1c]
 *     str r0, [r1, #0x0]
 *     bx  lr
 */

typedef struct {
    char _pad[0x18];
    int  f_18;
    int  f_1c;
} state_02103d74_t;

extern state_02103d74_t data_02103c94;

void func_0200612c(int *out_a, int *out_b) {
    *out_a = data_02103c94.f_18;
    *out_b = data_02103c94.f_1c;
}
