/* func_ov005_021ab384: indexed halfword load AND-mask, zero-extend to
 * unsigned short return.
 *
 *     ldr  r3, [r0, #0x10]
 *     mov  r0, r1, lsl #0x1
 *     ldrh r0, [r3, r0]
 *     and  r0, r0, r2
 *     mov  r0, r0, lsl #0x10
 *     mov  r0, r0, lsr #0x10
 *     bx   lr
 *
 * The `lsl 16 / lsr 16` zero-extend pair is forced when the masked
 * value retains type `int` past the halfword load — without it the
 * upper bits could carry sign-extension noise.
 */

typedef struct {
    char            _pad[0x10];
    unsigned short *table_10;
} state_hw_t;

unsigned short func_ov005_021ab384(state_hw_t *p, int idx, unsigned int mask) {
    unsigned int v = p->table_10[idx];
    return (unsigned short)(v & mask);
}
