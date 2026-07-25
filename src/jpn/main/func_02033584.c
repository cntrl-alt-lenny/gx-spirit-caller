/* func_02033584: C-29 — alloc + register array slot, returns -1 on alloc fail.
 *
 *     push  {r4, r5, r6, lr}
 *     sub   r3, r1, #0x1
 *     mul   r5, r3, r2
 *     mov   r6, r0
 *     str   r1, [r6, #0xe98]
 *     str   r2, [r6, #0xe9c]
 *     mov   r1, r5
 *     mov   r2, #0x4
 *     bl    func_02032de4
 *     movs  r4, r0
 *     mvneq r0, #0x0
 *     popeq {r4, r5, r6, pc}
 *     mov   r2, r5
 *     mov   r1, #0x0
 *     bl    func_02094500
 *     str   r4, [r6, #0xea0]
 *     mov   r0, #0x0
 *     pop   {r4, r5, r6, pc}
 */

typedef struct {
    char            _pad[0xe98];
    int             count;       /* +0xe98 */
    int             stride;      /* +0xe9c */
    void           *array;       /* +0xea0 */
} ctx_020335d4_t;

extern void *func_02032de4(ctx_020335d4_t *ctx, int sz, int align);
extern void  func_02094500(void *p, int b, int c);

int func_02033584(ctx_020335d4_t *ctx, int count, int stride) {
    int sz = (count - 1) * stride;
    void *p;
    ctx->count = count;
    ctx->stride = stride;
    p = func_02032de4(ctx, sz, 4);
    if (!p) return -1;
    func_02094500(p, 0, sz);
    ctx->array = p;
    return 0;
}
