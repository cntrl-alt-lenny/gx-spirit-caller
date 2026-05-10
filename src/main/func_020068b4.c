/* func_020068b4: guarded counter-decrement + tail-call. Calls
 * func_0207d304(arg0); if result != arg2, early-return result;
 * else decrement data->f_18 and tail-call func_0207d458(arg1, arg0).
 *
 *     stmdb sp!, {r4, r5, r6, lr}
 *     mov   r4, r2                        ; save arg2
 *     mov   r6, r0                        ; save arg0
 *     mov   r5, r1                        ; save arg1
 *     bl    func_0207d304
 *     cmp   r4, r0
 *     ldmneia sp!, {r4, r5, r6, pc}        ; predicated early-return
 *     ldr   r2, .L_020068f0
 *     mov   r0, r5
 *     ldr   r3, [r2, #0x18]
 *     mov   r1, r6
 *     sub   r3, r3, #0x1
 *     str   r3, [r2, #0x18]
 *     bl    func_0207d458
 *     ldmia sp!, {r4, r5, r6, pc}
 *  .L_020068f0: .word data_02104f1c
 */

extern int func_0207d304(int x);
extern int func_0207d458(int a, int b);

typedef struct {
    char _pad[0x18];
    int  f_18;
} sysw_020068b4_t;

extern sysw_020068b4_t data_02104f1c;

int func_020068b4(int a, int b, int c) {
    int r = func_0207d304(a);
    if (c != r) return r;
    data_02104f1c.f_18--;
    return func_0207d458(b, a);
}
