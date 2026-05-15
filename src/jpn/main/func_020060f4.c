/* func_020060f4: copy `data_02103c94[0]` to `*r0` and `data_02103c94[4]` to `*r1`.
 *
 *     ldr r2, .L_02006128
 *     ldr r3, [r2, #0x0]
 *     str r3, [r0, #0x0]
 *     ldr r0, [r2, #0x4]
 *     str r0, [r1, #0x0]
 *     bx  lr
 */

typedef struct {
    int f_0;
    int f_4;
} state_02103d74_pair_t;

extern state_02103d74_pair_t data_02103c94;

void func_020060f4(int *out_a, int *out_b) {
    *out_a = data_02103c94.f_0;
    *out_b = data_02103c94.f_4;
}
