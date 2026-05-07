/* func_0207e8a0: zero 4 fields (3 ints + 1 halfword).
 *
 *     mov  r1, #0x0
 *     str  r1, [r0, #0x0]
 *     str  r1, [r0, #0x4]
 *     str  r1, [r0, #0x8]
 *     strh r1, [r0, #0xc]
 *     bx   lr
 */

typedef struct {
    int            f_0;
    int            f_4;
    int            f_8;
    unsigned short h_c;
} state_3i1h_t;

void func_0207e8a0(state_3i1h_t *p) {
    p->f_0 = 0;
    p->f_4 = 0;
    p->f_8 = 0;
    p->h_c = 0;
}
