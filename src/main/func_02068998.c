/* func_02068998: returns 1 iff bit 1 of byte at `p+0x15` is set.
 *
 *     ldrb r0, [r0, #0x15]
 *     and  r0, r0, #0x2
 *     cmp  r0, #0x2
 *     moveq r0, #0x1
 *     movne r0, #0x0
 *     bx   lr
 */

typedef struct {
    char          _pad[0x15];
    unsigned char b_15;
} state_b15_t;

int func_02068998(state_b15_t *p) {
    return (p->b_15 & 2) == 2;
}
