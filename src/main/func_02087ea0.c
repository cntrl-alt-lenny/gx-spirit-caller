/* func_02087ea0: null-checked byte store at offset 0x41 of *pp.
 * Sibling of func_02087e90 with adjacent byte field.
 *
 *     ldr r0, [r0, #0x0]
 *     cmp r0, #0x0
 *     strneb r1, [r0, #0x41]
 *     bx  lr
 */

typedef struct {
    char          _pad[0x41];
    unsigned char b_41;
} state_b41_t;

void func_02087ea0(state_b41_t **pp, unsigned char b) {
    state_b41_t *p = *pp;
    if (p != 0) p->b_41 = b;
}
