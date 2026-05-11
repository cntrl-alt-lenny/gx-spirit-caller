/* func_020822c8: clone of func_020822a0 against data_021a1998.
 *
 *     ldr   r3, .L_020822e8            ; data_021a1998
 *     ldmia r0, {r0, r1, r2}
 *     stmia r3, {r0, r1, r2}
 *     ldr   r0, .L_020822ec            ; data_021a18b8
 *     ldr   r1, [r0, #0xfc]
 *     bic   r1, r1, #0xa4
 *     str   r1, [r0, #0xfc]
 *     bx    lr
 */

typedef struct {
    unsigned int a, b, c;
} triple_020822c8_t;

typedef struct {
    char         _pad[0xfc];
    unsigned int f_fc;
} state_020822c8_t;

extern triple_020822c8_t data_021a1998;
extern state_020822c8_t  data_021a18b8;

void func_020822c8(const triple_020822c8_t *src) {
    data_021a1998 = *src;
    data_021a18b8.f_fc &= ~0xa4u;
}
