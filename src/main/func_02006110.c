/* func_02006110: copy `data_02103d74[0]` to `*r0` and `data_02103d74[4]` to `*r1`.
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

extern state_02103d74_pair_t data_02103d74;

void func_02006110(int *out_a, int *out_b) {
    *out_a = data_02103d74.f_0;
    *out_b = data_02103d74.f_4;
}
