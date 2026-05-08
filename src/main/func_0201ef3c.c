/* func_0201ef3c: invoke `tasks1[0..p->count-1]`, re-reading
 * p->count each iter (mwcc 2.0/sp1p5 can't prove the call
 * doesn't aliase *p), then invoke `tasks2[0..1]`. Style B
 * epilogue.
 *
 *     stmdb sp!, {r3, r4, r5, r6, r7, lr}
 *     mov   r7, r0
 *     ldrh  r0, [r7, #0x0]
 *     mov   r6, r1
 *     mov   r5, r2
 *     cmp   r0, #0x0
 *     mov   r4, #0x0
 *     ble   .L_0201ef74
 *  .L_0201ef5c:
 *     ldr   r0, [r6, r4, lsl #0x2]
 *     bl    Task_InvokeLocked
 *     ldrh  r0, [r7, #0x0]
 *     add   r4, r4, #0x1
 *     cmp   r4, r0
 *     blt   .L_0201ef5c
 *  .L_0201ef74:
 *     mov   r4, #0x0
 *  .L_0201ef78:
 *     ldr   r0, [r5, r4, lsl #0x2]
 *     bl    Task_InvokeLocked
 *     add   r4, r4, #0x1
 *     cmp   r4, #0x2
 *     blt   .L_0201ef78
 *     ldmia sp!, {r3, r4, r5, r6, r7, pc}
 */

extern void Task_InvokeLocked(void *p);

typedef struct {
    unsigned short count;
} state_0201ef3c_t;

void func_0201ef3c(state_0201ef3c_t *p, void **tasks1, void **tasks2) {
    int i;
    for (i = 0; i < p->count; i++) {
        Task_InvokeLocked(tasks1[i]);
    }
    for (i = 0; i < 2; i++) {
        Task_InvokeLocked(tasks2[i]);
    }
}
