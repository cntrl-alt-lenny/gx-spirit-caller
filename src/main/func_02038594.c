/* func_02038594: unconditional clear of bit 3 in a global halfword;
 * if arg != 0, set the bit back. Void return.
 *
 *     ldr    r1, .L_020385b8           ; data_0219b2e0
 *     cmp    r0, #0x0
 *     ldrh   r0, [r1, #0x12]
 *     bic    r0, r0, #0x8
 *     strh   r0, [r1, #0x12]
 *     ldrneh r0, [r1, #0x12]
 *     orrne  r0, r0, #0x8
 *     strneh r0, [r1, #0x12]
 *     bx     lr
 */

typedef struct {
    char            _pad[0x12];
    unsigned short  f_12;
} state_02038594_t;

extern state_02038594_t data_0219b2e0;

void func_02038594(int flag) {
    data_0219b2e0.f_12 &= ~0x8u;
    if (flag != 0) data_0219b2e0.f_12 |= 0x8u;
}
