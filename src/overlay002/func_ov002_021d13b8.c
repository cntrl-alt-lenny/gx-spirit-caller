/* func_ov002_021d13b8: counter + wrap-clear. Increments state->f_810,
 * and if the OLD counter value is >= state->f_2 (halfword limit),
 * clears state->f_80c. Predicated body, no stack.
 *
 *     ldr   r0, .L_021d13dc           ; data_022ce950
 *     ldr   r2, [r0, #0x810]
 *     add   r1, r2, #0x1
 *     str   r1, [r0, #0x810]
 *     ldrh  r1, [r0, #0x2]
 *     cmp   r2, r1
 *     movhs r1, #0x0
 *     strhs r1, [r0, #0x80c]
 *     bx    lr
 */

typedef struct {
    char            _pad0[0x2];
    unsigned short  f_2;
    char            _pad1[0x808];
    unsigned int    f_80c;
    unsigned int    f_810;
} state_ov002_021d13b8_t;

extern state_ov002_021d13b8_t data_ov002_022ce950;

void func_ov002_021d13b8(void) {
    unsigned int cnt = data_ov002_022ce950.f_810;
    data_ov002_022ce950.f_810 = cnt + 1;
    if (cnt >= data_ov002_022ce950.f_2) data_ov002_022ce950.f_80c = 0;
}
