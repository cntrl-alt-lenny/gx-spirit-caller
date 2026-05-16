/* func_0209de74: critsec — disable, query, conditional 3-helper chain, restore.
 *
 *     push  {r4, lr}
 *     bl    OS_DisableIrq
 *     mov   r4, r0
 *     bl    func_0209dc8c
 *     cmp   r0, #0x0
 *     beq   .L_0209dea0
 *     mov   r0, r4
 *     bl    OS_RestoreIrq
 *     mov   r0, #0x3
 *     pop   {r4, lr}
 *     bx    lr
 * .L_0209dea0:
 *     mov   r0, #0x1
 *     mov   r1, #0x0
 *     bl    func_0209db88
 *     cmp   r0, #0x0
 *     popne {r4, lr}
 *     bxne  lr
 *     bl    func_0209d788
 *     mov   r0, #0xa
 *     mov   r1, #0x0
 *     bl    func_02096434
 *     ldr   r2, .L_0209def0
 *     mov   r3, #0x0
 *     ldr   r1, .L_0209def4
 *     mov   r0, r4
 *     str   r3, [r2, #0x0]
 *     strh  r3, [r1, #0x0]
 *     bl    OS_RestoreIrq
 *     mov   r0, #0x0
 *     pop   {r4, lr}
 *     bx    lr
 * .L_0209def0: .word data_021a8d2c
 * .L_0209def4: .word data_021a8d28
 */

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int saved);
extern int  func_0209dc8c(void);
extern int  func_0209db88(int a, int b);
extern void func_0209d788(void);
extern int  func_02096434(int a, int b);

extern int data_021a8d2c;
extern unsigned short data_021a8d28;

int func_0209de74(void) {
    int saved = OS_DisableIrq();
    if (func_0209dc8c() != 0) {
        OS_RestoreIrq(saved);
        return 3;
    }
    {
        int r = func_0209db88(1, 0);
        if (r != 0) return r;
    }
    func_0209d788();
    func_02096434(0xa, 0);
    data_021a8d2c = 0;
    data_021a8d28 = 0;
    OS_RestoreIrq(saved);
    return 0;
}
