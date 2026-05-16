/* func_02023f98: C-27 pool-word duplication — brief 107 worked example.
 *
 *     push  {r4, lr}
 *     ldr   r0, .L_0202401c       ; r0 = &data_0219a804 (pool 1)
 *     ldr   r4, .L_02024020       ; r4 = &data_0219a804 (pool 2, alias)
 *     ldr   r0, [r0, #0x0]
 *     cmp   r0, #0x0
 *     beq   .L_02024014
 *     ldr   r0, [r4, #0x0]
 *     bl    Task_InvokeLocked
 *     mov   r0, #0x0
 *     str   r0, [r4, #0x0]
 * .L_02024014:
 *     mov   r0, #0x1
 *     pop   {r4, pc}
 * .L_0202401c: .word data_0219a804
 * .L_02024020: .word data_0219a804
 */

extern void *data_0219a804;
extern void *data_0219a8e4_alias;
extern void Task_InvokeLocked(void *p);

int func_02023f98(void) {
    void * volatile *test_p  = (void * volatile *)&data_0219a804;
    void * volatile *store_p = (void * volatile *)&data_0219a8e4_alias;
    if (*test_p != 0) {
        Task_InvokeLocked(*store_p);
        *store_p = 0;
    }
    return 1;
}
