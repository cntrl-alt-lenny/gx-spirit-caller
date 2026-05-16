/* func_0206e224: critsec — save-state + helper + restore-state.
 *
 *     push  {r4, r5, r6, r7, lr}
 *     sub   sp, sp, #0x4
 *     mov   r4, r0
 *     bl    OS_DisableIrq
 *     ldr   r1, .L_0206e280
 *     mov   r5, r0
 *     ldr   r7, [r1, #0x0]
 *     mov   r2, #0x0
 *     ldr   r6, [r1, #0x4]
 *     mov   r0, r4
 *     str   r2, [r1, #0x0]
 *     str   r2, [r1, #0x4]
 *     bl    func_0206ef0c
 *     ldr   r1, .L_0206e280
 *     mov   r4, r0
 *     mov   r0, r5
 *     str   r7, [r1, #0x0]
 *     str   r6, [r1, #0x4]
 *     bl    OS_RestoreIrq
 *     mov   r0, r4
 *     add   sp, sp, #0x4
 *     pop   {r4, r5, r6, r7, lr}
 *     bx    lr
 * .L_0206e280: .word data_0219ef34
 */

typedef struct { int f0; int f4; } pair_0206e224_t;
extern pair_0206e224_t data_0219ef34;

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int saved);
extern int  func_0206ef0c(void *p);

int func_0206e224(void *p) {
    int saved, s0, s4, r;
    saved = OS_DisableIrq();
    s0 = data_0219ef34.f0;
    s4 = data_0219ef34.f4;
    data_0219ef34.f0 = 0;
    data_0219ef34.f4 = 0;
    r = func_0206ef0c(p);
    data_0219ef34.f0 = s0;
    data_0219ef34.f4 = s4;
    OS_RestoreIrq(saved);
    return r;
}
