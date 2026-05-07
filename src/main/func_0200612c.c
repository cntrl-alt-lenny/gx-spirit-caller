/* func_0200612c: copy `data_02103d74[0x10]` to `*r0` and `data_02103d74[0x14]`
 * to `*r1`. Same shape as func_02006110, different offsets.
 *
 *     ldr r2, .L_02006144
 *     ldr r3, [r2, #0x10]
 *     str r3, [r0, #0x0]
 *     ldr r0, [r2, #0x14]
 *     str r0, [r1, #0x0]
 *     bx  lr
 */

typedef struct {
    char _pad[0x10];
    int  f_10;
    int  f_14;
} state_02103d74_t;

extern state_02103d74_t data_02103d74;

void func_0200612c(int *out_a, int *out_b) {
    *out_a = data_02103d74.f_10;
    *out_b = data_02103d74.f_14;
}
