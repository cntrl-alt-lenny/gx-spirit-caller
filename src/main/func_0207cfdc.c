/* func_0207cfdc: branchless conditional dispatch — if arg2 is 0,
 * return `p->f_0`; else return `*(int *)(arg2 + p->h_a)` indexed by
 * the halfword at +0xa.
 *
 *     cmp    r1, #0x0
 *     ldreq  r0, [r0, #0x0]
 *     ldrneh r0, [r0, #0xa]
 *     ldrne  r0, [r1, r0]
 *     bx     lr
 */

typedef struct {
    int            f_0;
    char           _pad_a[0x6];
    unsigned short h_a;
} state_0_a_t;

int func_0207cfdc(state_0_a_t *p, char *q) {
    if (q == 0) return p->f_0;
    return *(int *)(q + p->h_a + 4);
}
