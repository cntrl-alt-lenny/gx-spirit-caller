/* func_02001d98: signed-arg sign-test with predicated early-exit. If v<0,
 * clear bit 24 of p->f_20 and return; else store v low-byte at +0x18 and
 * set bit 24 of p->f_20.
 *
 *     cmp   r1, #0x0
 *     ldrlt r1, [r0, #0x20]
 *     biclt r1, r1, #0x1000000
 *     strlt r1, [r0, #0x20]
 *     bxlt  lr
 *     and   r1, r1, #0xff
 *     str   r1, [r0, #0x18]
 *     ldr   r1, [r0, #0x20]
 *     orr   r1, r1, #0x1000000
 *     str   r1, [r0, #0x20]
 *     bx    lr
 */

typedef struct {
    char         _pad0[0x18];
    unsigned int f_18;
    char         _pad1[0x4];   /* 0x1c..0x1f */
    unsigned int f_20;
} state_02001d98_t;

void func_02001d98(state_02001d98_t *p, int v) {
    if (v < 0) {
        p->f_20 &= ~0x1000000u;
        return;
    }
    p->f_18 = (unsigned int)v & 0xffu;
    p->f_20 |= 0x1000000u;
}
