/* func_0206bf4c: null-coalesce — return `p->f_64 ?: p->f_68`.
 *
 *     ldr  r1, [r0, #0x64]
 *     cmp  r1, #0x0
 *     ldreq r1, [r0, #0x68]
 *     mov  r0, r1
 *     bx   lr
 */

typedef struct {
    char _pad[0x64];
    int  f_64;
    int  f_68;
} state_64_68_t;

int func_0206bf4c(state_64_68_t *p) {
    int v = p->f_64;
    if (v == 0) v = p->f_68;
    return v;
}
