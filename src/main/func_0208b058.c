/* func_0208b058: increment `p->f_8` if it's less than `p->f_c`.
 *
 *     ldr r2, [r0, #0x8]
 *     ldr r1, [r0, #0xc]
 *     cmp r2, r1
 *     addlt r1, r2, #0x1
 *     strlt r1, [r0, #0x8]
 *     bx  lr
 */

typedef struct {
    char _pad[0x8];
    int  f_8;
    int  f_c;
} state_8_c_t;

void func_0208b058(state_8_c_t *p) {
    if (p->f_8 < p->f_c) {
        p->f_8 = p->f_8 + 1;
    }
}
