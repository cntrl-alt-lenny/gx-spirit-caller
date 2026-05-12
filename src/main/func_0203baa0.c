/* func_0203baa0: dual conditional byte-clear. Uses signed int locals so
 * mwcc emits `lt` (signed less than) rather than `lo` (unsigned).
 *
 *     ldrb   r3, [r0, #0xae]
 *     cmp    r3, #0xff
 *     ldrlt  r1, .L_0203bacc
 *     movlt  r2, #0x0
 *     strltb r2, [r1, r3]
 *     ldrb   r2, [r0, #0xaf]
 *     cmp    r2, #0xff
 *     ldrlt  r0, .L_0203bacc
 *     movlt  r1, #0x0
 *     strltb r1, [r0, r2]
 *     bx     lr
 */

typedef struct {
    char          _pad0[0xae];
    unsigned char f_ae;
    unsigned char f_af;
} state_0203baa0_t;

extern unsigned char data_0219d9a8[];

void func_0203baa0(state_0203baa0_t *p) {
    int i = p->f_ae;
    if (i < 0xff) data_0219d9a8[i] = 0;
    i = p->f_af;
    if (i < 0xff) data_0219d9a8[i] = 0;
}
