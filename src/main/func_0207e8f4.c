/* func_0207e8f4: sign-shifted difference — return `((r0->f_0 - r0->f_18->f_c) << 13) >> 16`.
 *
 *     ldr r1, [r0, #0x18]
 *     ldr r2, [r0, #0x0]
 *     ldr r0, [r1, #0xc]
 *     sub r0, r2, r0
 *     mov r0, r0, lsl #0xd        ; lsl 13
 *     mov r0, r0, lsr #0x10       ; lsr 16 (zero-extend, drops 3 high bits)
 *     bx  lr
 *
 * Pattern equivalent to `(diff & 0x7ffff) >> 3` but mwcc emits as
 * a shift-pair to keep the result in r0 across the operation.
 */

typedef struct {
    char _pad[0xc];
    int  f_c;
} inner_18_t;

typedef struct {
    int        f_0;
    char       _pad[0x18 - 0x4];
    inner_18_t *f_18;
} state_diff_t;

unsigned int func_0207e8f4(state_diff_t *p) {
    int diff = p->f_0 - p->f_18->f_c;
    return ((unsigned int)diff << 13) >> 16;
}
