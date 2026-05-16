/* func_02033488: P-9 early-return — bit-test + clear + helpers.
 *
 *     push  {r3, lr}
 *     ldr   r1, [r0, #0xeb4]
 *     tst   r1, #0x1
 *     mvneq r0, #0x0
 *     popeq {r3, pc}
 *     bic   r1, r1, #0x1
 *     str   r1, [r0, #0xeb4]
 *     bl    func_020338b8
 *     bl    func_02047408
 *     mov   r0, #0x0
 *     pop   {r3, pc}
 */

typedef struct {
    char            _pad[0xeb4];
    unsigned int    flags;
} ctx_02033488_t;

extern void func_020338b8(ctx_02033488_t *p);
extern void func_02047408(void);

int func_02033488(ctx_02033488_t *p) {
    if ((p->flags & 1) == 0) return -1;
    p->flags &= ~1;
    func_020338b8(p);
    func_02047408();
    return 0;
}
