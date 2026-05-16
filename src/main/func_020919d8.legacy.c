/* func_020919d8: critsec — disable, set flag, helper, restore (sp2p3 .legacy.c).
 *
 *     push  {r4, r5, lr}
 *     sub   sp, sp, #0x4
 *     mov   r5, r0
 *     bl    OS_DisableIrq
 *     mov   r1, #0x1
 *     mov   r4, r0
 *     str   r1, [r5, #0x64]
 *     bl    func_02091f88
 *     mov   r0, r4
 *     bl    OS_RestoreIrq
 *     add   sp, sp, #0x4
 *     pop   {r4, r5, lr}
 *     bx    lr
 */

typedef struct {
    char            _pad[0x64];
    unsigned int    flag;        /* +0x64 */
} ctx_020919d8_t;

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int saved);
extern void func_02091f88(void);

void func_020919d8(ctx_020919d8_t *ctx) {
    int saved = OS_DisableIrq();
    ctx->flag = 1;
    func_02091f88();
    OS_RestoreIrq(saved);
}
