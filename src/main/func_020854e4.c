/* func_020854e4: chained offset load — `p + *(int*)(p + p->h_c)`.
 * The halfword at +0xc is an offset; the int at that offset is
 * itself an offset added to p.
 *
 *     ldrh r1, [r0, #0xc]
 *     ldr  r1, [r0, r1]
 *     add  r0, r0, r1
 *     bx   lr
 */

typedef struct {
    char           _pad[0xc];
    unsigned short h_c;
} state_chain_t;

void *func_020854e4(state_chain_t *p) {
    unsigned short off = p->h_c;
    int delta = *(int *)((char *)p + off);
    return (char *)p + delta;
}
