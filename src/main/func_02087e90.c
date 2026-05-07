/* func_02087e90: null-checked byte store at offset 0x40 of *pp.
 *
 *     ldr r0, [r0, #0x0]
 *     cmp r0, #0x0
 *     strneb r1, [r0, #0x40]
 *     bx  lr
 */

typedef struct {
    char          _pad[0x40];
    unsigned char b_40;
} state_b40_t;

void func_02087e90(state_b40_t **pp, unsigned char b) {
    state_b40_t *p = *pp;
    if (p != 0) p->b_40 = b;
}
