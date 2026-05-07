/* func_020354a8: conditional + unconditional byte stores.
 *
 *     ldrb r3, [r0, #0x71]
 *     cmp  r3, #0x0
 *     strneb r2, [r0, #0x71]    ; if (b_71 != 0) b_71 = c
 *     strb r1, [r0, #0x70]       ; b_70 = b (always)
 *     bx   lr
 */

typedef struct {
    char          _pad[0x70];
    unsigned char b_70;
    unsigned char b_71;
} state_b70_t;

void func_020354a8(state_b70_t *p, unsigned char b, unsigned char c) {
    if (p->b_71 != 0) p->b_71 = c;
    p->b_70 = b;
}
