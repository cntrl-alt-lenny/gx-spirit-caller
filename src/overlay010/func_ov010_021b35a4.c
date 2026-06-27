/* func_ov010_021b35a4: family ae6bf115 — free-and-null two pointer
 * slots. For each of *a, *b: if non-null, call Task_Invoke on it and
 * clear the slot.
 *
 *     push  {r3, r4, r5, lr}
 *     mov   r5, r0
 *     ldr   r0, [r5, #0x0]
 *     mov   r4, r1
 *     cmp   r0, #0x0
 *     beq   .L_a
 *     bl    Task_Invoke
 *     mov   r0, #0x0
 *     str   r0, [r5, #0x0]
 *  .L_a:
 *     ldr   r0, [r4, #0x0]
 *     cmp   r0, #0x0
 *     popeq {r3, r4, r5, pc}
 *     bl    Task_Invoke
 *     mov   r0, #0x0
 *     str   r0, [r4, #0x0]
 *     pop   {r3, r4, r5, pc}
 */

extern void Task_Invoke(void *p);

void func_ov010_021b35a4(void **a, void **b) {
    if (*a != 0) {
        Task_Invoke(*a);
        *a = 0;
    }
    if (*b != 0) {
        Task_Invoke(*b);
        *b = 0;
    }
}
