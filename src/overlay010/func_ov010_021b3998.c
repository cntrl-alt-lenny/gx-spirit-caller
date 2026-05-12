/* func_ov010_021b3998: identical body to func_ov015_021b34a4.
 *
 *     ldr   r1, [r0, #0x5c]
 *     cmp   r1, #0x0
 *     moveq r0, #0x0
 *     bxeq  lr
 *     mov   r1, #0x2
 *     str   r1, [r0, #0x68]
 *     mov   r1, #0x5000
 *     str   r1, [r0, #0x70]
 *     mov   r0, #0x1
 *     bx    lr
 */

typedef struct {
    char         _pad0[0x5c];
    unsigned int f_5c;
    char         _pad1[0x8];
    unsigned int f_68;
    char         _pad2[0x4];
    unsigned int f_70;
} state_ov010_021b3998_t;

int func_ov010_021b3998(state_ov010_021b3998_t *p) {
    if (p->f_5c == 0) return 0;
    p->f_68 = 2;
    p->f_70 = 0x5000;
    return 1;
}
