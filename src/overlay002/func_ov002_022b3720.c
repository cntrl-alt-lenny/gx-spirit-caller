/* func_ov002_022b3720: conditional field rotation. Use explicit
 * `0x100 - (sign_bit << 7)` so mwcc emits the lsl + rsb chain instead
 * of folding `(prev<0)?0x80:0x100` into two direct constants.
 *
 *     ldr   r3, [r0, #0xc]
 *     cmp   r3, r1
 *     beq   .L_022b3748
 *     cmp   r3, #0x0
 *     movlt r3, #0x1
 *     movge r3, #0x0
 *     mov   r3, r3, lsl #0x7
 *     rsb   r3, r3, #0x100
 *     str   r3, [r0, #0x1c]
 *     str   r1, [r0, #0xc]
 *  .L_022b3748:
 *     ldr   r3, [r0, #0x10]
 *     mov   r1, #0x100
 *     str   r3, [r0, #0x14]
 *     str   r2, [r0, #0x10]
 *     str   r1, [r0, #0x20]
 *     bx    lr
 */

typedef struct {
    char         _pad0[0xc];
    int          f_c;
    int          f_10;
    int          f_14;
    char         _pad1[0x4];
    int          f_1c;
    int          f_20;
} state_ov002_022b3720_t;

void func_ov002_022b3720(state_ov002_022b3720_t *p, int b, int c) {
    int prev = p->f_c;
    if (prev != b) {
        int sign = (prev < 0) ? 1 : 0;
        p->f_1c = 0x100 - (sign << 7);
        p->f_c = b;
    }
    p->f_14 = p->f_10;
    p->f_10 = c;
    p->f_20 = 0x100;
}
