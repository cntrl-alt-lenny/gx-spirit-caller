/* func_ov002_02202794: returns 1 iff bits 26..31 of halfword at +0x2 differ from 0x23.
 * Same shape as func_ov002_02201c84 but with `!=` (movne #1 / moveq #0).
 *
 *     ldrh r0, [r0, #0x2]
 *     mov  r0, r0, lsl #0x14
 *     mov  r0, r0, lsr #0x1a
 *     cmp  r0, #0x23
 *     movne r0, #0x1
 *     moveq r0, #0x0
 *     bx   lr
 */

typedef struct {
    char           _pad[0x2];
    unsigned short h_2;
} state_h2_t;

int func_ov002_02202794(state_h2_t *p) {
    return (((unsigned int)p->h_2 << 20) >> 26) != 0x23;
}
