/* func_ov000_021ac770: clear bit 2 of f_0, set bit 18 (0x40000) of f_8.
 *
 *     ldr r1, [r0, #0x0]
 *     bic r1, r1, #0x4
 *     str r1, [r0, #0x0]
 *     ldr r1, [r0, #0x8]
 *     orr r1, r1, #0x40000
 *     str r1, [r0, #0x8]
 *     bx  lr
 */

typedef struct {
    unsigned int f_0;
    char         _pad_4[0x4];
    unsigned int f_8;
} state_2bit_t;

void func_ov000_021ac770(state_2bit_t *p) {
    p->f_0 &= ~0x4u;
    p->f_8 |= 0x40000u;
}
