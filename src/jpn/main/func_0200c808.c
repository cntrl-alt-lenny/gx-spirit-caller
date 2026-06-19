/* func_0200c808: lazy-allocate p->f_280[0x80 bytes / 32 ints],
 * then store value at index. Style B epilogue.
 *
 *     stmdb sp!, {r4, r5, r6, lr}
 *     mov   r6, r0
 *     ldr   r0, [r6, #0x280]
 *     mov   r5, r1
 *     mov   r4, r2
 *     cmp   r0, #0x0
 *     bne   .L_0200c864
 *     mov   r0, #0x80
 *     mov   r1, #0x4
 *     mov   r2, #0x0
 *     bl    Task_PostLocked
 *     str   r0, [r6, #0x280]
 *     mov   r1, r0
 *     mov   r0, #0x0
 *     mov   r2, #0x80
 *     bl    Fill32
 *  .L_0200c864:
 *     ldr   r1, [r6, #0x280]
 *     mov   r0, #0x1
 *     str   r4, [r1, r5, lsl #0x2]
 *     ldmia sp!, {r4, r5, r6, pc}
 *
 * Brief 041 declaration-order trick: declare scratch vars in
 * reverse-allocation order (r6=p, r5=idx, r4=val).
 */

extern int  Task_PostLocked(void *arg0, int arg1, int arg2);
extern void Fill32(int v, void *dst, int size);

typedef struct {
    char  _pad[0x280];
    int  *f_280;
} state_0200c824_t;

int func_0200c808(state_0200c824_t *p, int idx, int val) {
    if (p->f_280 == 0) {
        p->f_280 = (int *)Task_PostLocked((void *)0x80, 4, 0);
        Fill32(0, p->f_280, 0x80);
    }
    p->f_280[idx] = val;
    return 1;
}
