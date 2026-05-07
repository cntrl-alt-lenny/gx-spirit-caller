/* func_ov002_02201c84: returns 1 iff bits 26..31 of halfword at +0x2 equal 0x18.
 *
 *     ldrh r0, [r0, #0x2]
 *     mov  r0, r0, lsl #0x14
 *     mov  r0, r0, lsr #0x1a
 *     cmp  r0, #0x18
 *     moveq r0, #0x1
 *     movne r0, #0x0
 *     bx   lr
 */

typedef struct {
    char           _pad[0x2];
    unsigned short h_2;
} state_h2_t;

int func_ov002_02201c84(state_h2_t *p) {
    return (((unsigned int)p->h_2 << 20) >> 26) == 0x18;
}
