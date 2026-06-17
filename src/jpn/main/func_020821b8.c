/* func_020821b8: copy a 12-byte triple from arg0 to a global; clear bits
 * 0xa4 of a separate global's f_fc field. Inline ldm/stm struct copy
 * (C-2a form).
 *
 *     ldr   r3, .L_020822c0            ; data_021a18c4 (dst triple)
 *     ldmia r0, {r0, r1, r2}            ; src triple → r0..r2
 *     stmia r3, {r0, r1, r2}            ; store to dst
 *     ldr   r0, .L_020822c4            ; data_021a17d8 (state)
 *     ldr   r1, [r0, #0xfc]
 *     bic   r1, r1, #0xa4
 *     str   r1, [r0, #0xfc]
 *     bx    lr
 */

typedef struct {
    unsigned int a, b, c;
} triple_020822a0_t;

typedef struct {
    char         _pad[0xfc];
    unsigned int f_fc;
} state_020822a0_t;

extern triple_020822a0_t data_021a18c4;
extern state_020822a0_t  data_021a17d8;

void func_020821b8(const triple_020822a0_t *src) {
    data_021a18c4 = *src;
    data_021a17d8.f_fc &= ~0xa4u;
}
