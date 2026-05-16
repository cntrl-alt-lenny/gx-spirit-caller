/* func_020335d4: C-29 — alloc + register array slot, returns -1 on alloc fail.
 *
 *     push  {r4, r5, r6, lr}
 *     sub   r3, r1, #0x1
 *     mul   r5, r3, r2
 *     mov   r6, r0
 *     str   r1, [r6, #0xea0]
 *     str   r2, [r6, #0xea4]
 *     mov   r1, r5
 *     mov   r2, #0x4
 *     bl    func_02032e38
 *     movs  r4, r0
 *     mvneq r0, #0x0
 *     popeq {r4, r5, r6, pc}
 *     mov   r2, r5
 *     mov   r1, #0x0
 *     bl    func_020945f4
 *     str   r4, [r6, #0xea8]
 *     mov   r0, #0x0
 *     pop   {r4, r5, r6, pc}
 */

typedef struct {
    char            _pad[0xea0];
    int             count;       /* +0xea0 */
    int             stride;      /* +0xea4 */
    void           *array;       /* +0xea8 */
} ctx_020335d4_t;

extern void *func_02032e38(ctx_020335d4_t *ctx, int sz, int align);
extern void  func_020945f4(void *p, int b, int c);

int func_020335d4(ctx_020335d4_t *ctx, int count, int stride) {
    int sz = (count - 1) * stride;
    void *p;
    ctx->count = count;
    ctx->stride = stride;
    p = func_02032e38(ctx, sz, 4);
    if (!p) return -1;
    func_020945f4(p, 0, sz);
    ctx->array = p;
    return 0;
}
