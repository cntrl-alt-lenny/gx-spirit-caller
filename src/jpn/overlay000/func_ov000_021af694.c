/* func_ov000_021af694: clear bits in global->f_28 and global->f_2c, then
 * OR-in 0x18000000 into f_2c.
 *
 *     ldr   r0, .L_021af7a4           ; data_021c758c
 *     ldr   r1, [r0, #0x28]
 *     bic   r1, r1, #0xff0
 *     str   r1, [r0, #0x28]
 *     ldr   r1, [r0, #0x2c]
 *     bic   r1, r1, #0x3c000000
 *     orr   r1, r1, #0x18000000
 *     str   r1, [r0, #0x2c]
 *     bx    lr
 */

typedef struct {
    char         _pad0[0x28];
    unsigned int f_28;
    unsigned int f_2c;
} state_ov000_021af780_t;

extern state_ov000_021af780_t data_ov000_021c74ac;

void func_ov000_021af694(void) {
    data_ov000_021c74ac.f_28 &= ~0xff0u;
    data_ov000_021c74ac.f_2c = (data_ov000_021c74ac.f_2c & ~0x3c000000u) | 0x18000000u;
}
