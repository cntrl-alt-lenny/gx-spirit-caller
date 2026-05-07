/* func_0208b040: returns 1 iff `p->f_8 >= p->f_c` (signed).
 *
 *     ldr r1, [r0, #0x8]
 *     ldr r0, [r0, #0xc]
 *     cmp r1, r0
 *     movge r0, #0x1
 *     movlt r0, #0x0
 *     bx  lr
 */

typedef struct {
    char _pad[0x8];
    int  f_8;
    int  f_c;
} state_8_c_t;

int func_0208b040(state_8_c_t *p) {
    return p->f_8 >= p->f_c;
}
