/* func_020385bc: 4-field set — `arg << 8` to f_0/f_4, zero halfwords at
 * f_8/f_a.
 *
 *     mov  r1, r1, lsl #0x8
 *     str  r1, [r0, #0x4]
 *     str  r1, [r0, #0x0]
 *     mov  r1, #0x0
 *     strh r1, [r0, #0xa]
 *     strh r1, [r0, #0x8]
 *     bx   lr
 *
 * mwcc emits the stores in reverse field order (f_4 before f_0 etc.) —
 * RHS-evaluation order from the source-level comma/sequence point.
 */

typedef struct {
    int            f_0;
    int            f_4;
    unsigned short f_8;
    unsigned short f_a;
} state_021_4set_t;

void func_020385bc(state_021_4set_t *p, int v) {
    int q24_8 = v << 8;
    p->f_4 = q24_8;
    p->f_0 = q24_8;
    p->f_a = 0;
    p->f_8 = 0;
}
