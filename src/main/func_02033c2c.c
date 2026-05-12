/* func_02033c2c: conditional struct init. If first byte already set,
 * return; else initialize byte fields at +0..+3, word at +4, word at
 * +8, then read 2 args from stack and store at +0xc / +0x10.
 *
 *     ldrb   ip, [r0, #0x0]
 *     cmp    ip, #0x0
 *     bxne   lr
 *     cmp    r3, #0x0
 *     movne  r3, #0x1
 *     moveq  r3, #0x2
 *     strb   r3, [r0, #0x0]
 *     mov    r3, #0x0
 *     strb   r3, [r0, #0x1]
 *     strb   r1, [r0, #0x2]
 *     strb   r3, [r0, #0x3]
 *     str    r3, [r0, #0x4]
 *     ldr    r3, [sp, #0x0]
 *     str    r2, [r0, #0x8]
 *     ldr    r1, [sp, #0x4]
 *     str    r3, [r0, #0xc]
 *     str    r1, [r0, #0x10]
 *     bx     lr
 */

typedef struct {
    unsigned char f_0;
    unsigned char f_1;
    unsigned char f_2;
    unsigned char f_3;
    int           f_4;
    int           f_8;
    int           f_c;
    int           f_10;
} obj_02033c2c_t;

void func_02033c2c(obj_02033c2c_t *p, int b, int c, int flag, int e, int f) {
    if (p->f_0 != 0) return;
    p->f_0 = (flag != 0) ? 1 : 2;
    p->f_1 = 0;
    p->f_2 = (unsigned char)b;
    p->f_3 = 0;
    p->f_4 = 0;
    p->f_8 = c;
    p->f_c = e;
    p->f_10 = f;
}
