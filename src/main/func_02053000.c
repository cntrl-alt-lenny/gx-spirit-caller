/* func_02053000: returns 1 iff bit 0 of `p->f_20` is set.
 *
 *     ldr r0, [r0, #0x20]
 *     and r0, r0, #0x1
 *     cmp r0, #0x1
 *     moveq r0, #0x1
 *     movne r0, #0x0
 *     bx  lr
 */

typedef struct {
    char         _pad[0x20];
    unsigned int f_20;
} state_20_t;

int func_02053000(state_20_t *p) {
    return (p->f_20 & 1) == 1;
}
