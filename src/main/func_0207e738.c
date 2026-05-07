/* func_0207e738: pointer-to-int relocation — `p->f_c += (int)p`. The
 * field at +0xc is treated as an offset that gets converted to an
 * absolute address.
 *
 *     ldr r1, [r0, #0xc]
 *     add r1, r1, r0
 *     str r1, [r0, #0xc]
 *     bx  lr
 */

typedef struct {
    char _pad[0xc];
    int  f_c;
} state_c_t;

void func_0207e738(state_c_t *p) {
    p->f_c += (int)p;
}
