/* func_0203ddc4: byte-bool conditional const — return -50595 if byte +0xb
 * is zero, else -51099.
 *
 *     ldrb  r0, [r0, #0xb]
 *     cmp   r0, #0x0
 *     ldreq r0, .L_0203ddd8
 *     ldrne r0, .L_0203dddc
 *     bx    lr
 *  .L_0203ddd8: .word 0xffff3c4d
 *  .L_0203dddc: .word 0xffff3865
 *
 * mwcc emits two pool-word loads with predicated `ldreq`/`ldrne` —
 * the const values can't fit in a single ARM rotated immediate.
 */

typedef struct {
    char          _pad[0xb];
    unsigned char b_b;
} state_b_t;

int func_0203ddc4(state_b_t *p) {
    return (p->b_b == 0) ? (int)0xffff3c4d : (int)0xffff3865;
}
