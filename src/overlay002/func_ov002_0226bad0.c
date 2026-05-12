/* func_ov002_0226bad0: guarded constant-return. Combined-AND form lets
 * mwcc use a single branchy first cmp + share the trailing `mov #0; bx lr`
 * with the fall-through.
 *
 *     ldr   r2, .L_0226baf4
 *     ldr   r2, [r2, #0xd94]
 *     cmp   r0, r2
 *     beq   .L_0226baec
 *     cmp   r1, #0xb
 *     moveq r0, #0x800
 *     bxeq  lr
 *  .L_0226baec:
 *     mov   r0, #0x0
 *     bx    lr
 */

typedef struct {
    char         _pad0[0xd94];
    int          f_d94;
} state_ov002_0226bad0_t;

extern state_ov002_0226bad0_t data_ov002_022d016c;

int func_ov002_0226bad0(int a, int b) {
    if (a != data_ov002_022d016c.f_d94 && b == 0xb) return 0x800;
    return 0;
}
