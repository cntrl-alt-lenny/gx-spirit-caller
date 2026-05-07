/* func_0203d6a8: 2-bit field at bits 28..29 of byte +0xd0b — return
 * 0xc0000 if equals 1, else 0x80000.
 *
 *     ldrb r0, [r0, #0xd0b]
 *     mov  r0, r0, lsl #0x1c
 *     mov  r0, r0, lsr #0x1e
 *     cmp  r0, #0x1
 *     moveq r0, #0xc0000
 *     movne r0, #0x80000
 *     bx   lr
 */

typedef struct {
    char          _pad[0xd0b];
    unsigned char b_d0b;
} state_d0b_t;

int func_0203d6a8(state_d0b_t *p) {
    unsigned int v = ((unsigned int)p->b_d0b << 28) >> 30;
    return v == 1 ? 0xc0000 : 0x80000;
}
