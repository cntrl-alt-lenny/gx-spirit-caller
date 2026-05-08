/* func_0200c558: conditional Task_InvokeLocked + clear flag.
 * If p->f_274 non-null, invoke it and zero the slot. Always:
 * f_278=0, clear bit 0x10000000 in f_7c. Returns 1.
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0
 *     ldr   r0, [r4, #0x274]
 *     cmp   r0, #0x0
 *     beq   .L_0200c578
 *     bl    Task_InvokeLocked
 *     mov   r0, #0x0
 *     str   r0, [r4, #0x274]
 *  .L_0200c578:
 *     mov   r0, #0x0
 *     str   r0, [r4, #0x278]
 *     ldr   r1, [r4, #0x7c]
 *     mov   r0, #0x1
 *     bic   r1, r1, #0x10000000
 *     str   r1, [r4, #0x7c]
 *     ldmia sp!, {r4, pc}
 */

extern void Task_InvokeLocked(void *p);

typedef struct {
    char         _pad7c[0x7c];
    unsigned int f_7c;
    char         _pad274[0x274 - 0x80];
    void        *f_274;
    int          f_278;
} state_0200c558_t;

int func_0200c558(state_0200c558_t *p) {
    if (p->f_274) {
        Task_InvokeLocked(p->f_274);
        p->f_274 = 0;
    }
    p->f_278 = 0;
    p->f_7c &= ~0x10000000u;
    return 1;
}
