/* func_0202a1ec: C-27 pool-word duplication — Task_InvokeLocked dispatch + tail.
 * Same shape as func_02023f98 (brief 107 worked example) + tail bl.
 *
 *     push  {r4, lr}
 *     ldr   r0, .L_0202a274       ; r0 = &data_0219a854 (pool 1)
 *     ldr   r4, .L_0202a278       ; r4 = &data_0219a854 (pool 2 — alias, callee-save)
 *     ldr   r0, [r0, #0x0]
 *     cmp   r0, #0x0
 *     beq   .L_0202a268
 *     ldr   r0, [r4, #0x0]
 *     bl    Task_InvokeLocked
 *     mov   r0, #0x0
 *     str   r0, [r4, #0x0]
 * .L_0202a268:
 *     bl    func_0202a944
 *     mov   r0, #0x1
 *     pop   {r4, pc}
 * .L_0202a274: .word data_0219a854
 * .L_0202a278: .word data_0219a854   <- duplicate
 */

extern void *data_0219a854;
extern void *data_0219a934_alias;   /* SAME address — see symbols.txt */
extern void Task_InvokeLocked(void *p);
extern void func_0202a944(void);

int func_0202a1ec(void) {
    void * volatile *test_p  = (void * volatile *)&data_0219a854;
    void * volatile *store_p = (void * volatile *)&data_0219a934_alias;
    if (*test_p != 0) {
        Task_InvokeLocked(*store_p);
        *store_p = 0;
    }
    func_0202a944();
    return 1;
}
