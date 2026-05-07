/* func_0207d1b8: clear 3 fields, then store arg as halfword at +0xa.
 *
 *     mov  r2, #0x0
 *     str  r2, [r0, #0x0]
 *     str  r2, [r0, #0x4]
 *     strh r2, [r0, #0x8]
 *     strh r1, [r0, #0xa]
 *     bx   lr
 */

typedef struct {
    int            f_0;
    int            f_4;
    unsigned short h_8;
    unsigned short h_a;
} state_4cl_t;

void func_0207d1b8(state_4cl_t *p, unsigned short v) {
    p->f_0 = 0;
    p->f_4 = 0;
    p->h_8 = 0;
    p->h_a = v;
}
