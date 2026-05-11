/* func_02087ce8: null-check + 3 halfword stores into an indirect target.
 * Loads ptr fresh between each store (alias-conservative).
 *
 *     ldr   ip, [r0, #0x0]
 *     cmp   ip, #0x0
 *     bxeq  lr
 *     mov   r3, #0x2
 *     strh  r3, [ip, #0x34]
 *     ldr   r3, [r0, #0x0]
 *     strh  r1, [r3, #0x38]
 *     ldr   r0, [r0, #0x0]
 *     strh  r2, [r0, #0x3a]
 *     bx    lr
 */

typedef struct {
    char            _pad0[0x34];
    unsigned short  f_34;
    char            _pad1[0x2];   /* align to 0x38 */
    unsigned short  f_38;
    unsigned short  f_3a;
} target_02087ce8_t;

typedef struct {
    target_02087ce8_t *ptr;
} holder_02087ce8_t;

void func_02087ce8(holder_02087ce8_t *p, int b, int c) {
    if (p->ptr == 0) return;
    p->ptr->f_34 = 2;
    p->ptr->f_38 = (unsigned short)b;
    p->ptr->f_3a = (unsigned short)c;
}
