/* func_ov006_021c1450: Fill32-zero a 0x20-byte struct, then init
 * fields: f_4=f_8=f_c=f_14=0, f_10=-1. Returns 1.
 *
 *     stmdb sp!, {r4, lr}
 *     ldr   r1, .L_021c1598
 *     mov   r4, r0
 *     mov   r0, #0x0
 *     mov   r2, #0x20
 *     bl    Fill32
 *     mov   r1, #0x0
 *     str   r1, [r4, #0x4]
 *     str   r1, [r4, #0x8]
 *     str   r1, [r4, #0xc]
 *     sub   r0, r1, #0x1
 *     str   r0, [r4, #0x10]
 *     str   r1, [r4, #0x14]
 *     mov   r0, #0x1
 *     ldmia sp!, {r4, pc}
 *  .L_021c1598: .word data_ov006_0225ca3c
 *
 * Fill32 zeros an unrelated global; the struct fields are then
 * explicitly assigned (the asm does both — odd but matches).
 */

extern void Fill32(int v, void *dst, int size);
extern char data_ov006_0225ca3c[];

typedef struct {
    int f_0;
    int f_4;
    int f_8;
    int f_c;
    int f_10;
    int f_14;
} ov006_021c155c_state_t;

int func_ov006_021c1450(ov006_021c155c_state_t *p) {
    Fill32(0, data_ov006_0225ca3c, 0x20);
    p->f_4 = 0;
    p->f_8 = 0;
    p->f_c = 0;
    p->f_10 = -1;
    p->f_14 = 0;
    return 1;
}
