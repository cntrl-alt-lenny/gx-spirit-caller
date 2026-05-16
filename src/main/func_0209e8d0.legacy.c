/* func_0209e8d0: critsec — disable, query, branch-store-or-return, restore (sp2p3 .legacy.c).
 *
 *     push  {r4, r5, r6, lr}
 *     mov   r6, r0
 *     bl    OS_DisableIrq
 *     mov   r5, r0
 *     bl    func_0209dc8c
 *     movs  r4, r0
 *     beq   .L_0209e900
 *     mov   r0, r5
 *     bl    OS_RestoreIrq
 *     mov   r0, r4
 *     pop   {r4, r5, r6, lr}
 *     bx    lr
 * .L_0209e900:
 *     bl    func_0209dca8
 *     str   r6, [r0, #0xc8]
 *     mov   r0, r5
 *     bl    OS_RestoreIrq
 *     mov   r0, #0x0
 *     pop   {r4, r5, r6, lr}
 *     bx    lr
 */

typedef struct {
    char    _pad[0xc8];
    void   *field_c8;            /* +0xc8 */
} obj_0209e8d0_t;

extern int   OS_DisableIrq(void);
extern void  OS_RestoreIrq(int saved);
extern void *func_0209dc8c(void);
extern obj_0209e8d0_t *func_0209dca8(void);

void *func_0209e8d0(void *arg) {
    int saved = OS_DisableIrq();
    void *r = func_0209dc8c();
    if (r != 0) {
        OS_RestoreIrq(saved);
        return r;
    }
    func_0209dca8()->field_c8 = arg;
    OS_RestoreIrq(saved);
    return 0;
}
