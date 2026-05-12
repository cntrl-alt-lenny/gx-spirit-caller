/* func_ov000_021af7a8: clone of func_ov000_021af780 with OR mask 0x14000000.
 *
 *     ldr   r0, .L_021af7cc
 *     ldr   r1, [r0, #0x28]
 *     bic   r1, r1, #0xff0
 *     str   r1, [r0, #0x28]
 *     ldr   r1, [r0, #0x2c]
 *     bic   r1, r1, #0x3c000000
 *     orr   r1, r1, #0x14000000
 *     str   r1, [r0, #0x2c]
 *     bx    lr
 */

typedef struct {
    char         _pad0[0x28];
    unsigned int f_28;
    unsigned int f_2c;
} state_ov000_021af7a8_t;

extern state_ov000_021af7a8_t data_ov000_021c758c;

void func_ov000_021af7a8(void) {
    data_ov000_021c758c.f_28 &= ~0xff0u;
    data_ov000_021c758c.f_2c = (data_ov000_021c758c.f_2c & ~0x3c000000u) | 0x14000000u;
}
