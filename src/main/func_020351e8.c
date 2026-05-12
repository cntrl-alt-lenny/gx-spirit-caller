/* func_020351e8: gated dual-counter inc. If TOP bit of global->f_12
 * (halfword) is set, increment global->f_6 (halfword) and global->f_54
 * (word); else return.
 *
 *     ldr   r0, .L_02035214           ; data_0219b2e0
 *     ldrh  r1, [r0, #0x12]
 *     tst   r1, #0x8000
 *     bxeq  lr
 *     ldrh  r1, [r0, #0x6]
 *     add   r1, r1, #0x1
 *     strh  r1, [r0, #0x6]
 *     ldr   r1, [r0, #0x54]
 *     add   r1, r1, #0x1
 *     str   r1, [r0, #0x54]
 *     bx    lr
 */

typedef struct {
    char           _pad0[0x6];
    unsigned short f_6;
    char           _pad1[0xa];
    unsigned short f_12;
    char           _pad2[0x40];
    unsigned int   f_54;
} state_020351e8_t;

extern state_020351e8_t data_0219b2e0;

void func_020351e8(void) {
    if ((data_0219b2e0.f_12 & 0x8000u) == 0) return;
    data_0219b2e0.f_6++;
    data_0219b2e0.f_54++;
}
