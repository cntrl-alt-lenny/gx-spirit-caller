/* func_ov002_022593f4: guarded constant return. Combined-AND form per
 * wave-19's lesson — share the trailing `mov #0; bx lr` between the
 * first branch and the fall-through.
 *
 *     ldr   r0, .L_0225941c           ; data_022d016c
 *     ldr   r1, [r0, #0xd50]
 *     cmp   r1, #0x0
 *     beq   .L_02259414
 *     ldr   r0, [r0, #0xd64]
 *     cmp   r0, #0xb
 *     moveq r0, #0x1
 *     bxeq  lr
 *  .L_02259414:
 *     mov   r0, #0x0
 *     bx    lr
 */

typedef struct {
    char         _pad0[0xd50];
    int          f_d50;
    char         _pad1[0x10];
    int          f_d64;
} state_ov002_022593f4_t;

extern state_ov002_022593f4_t data_ov002_022d016c;

int func_ov002_022593f4(void) {
    if (data_ov002_022d016c.f_d50 != 0 && data_ov002_022d016c.f_d64 == 0xb) return 1;
    return 0;
}
