/* func_0200af08: NULL-check + Task_InvokeLocked wrapper — one of 5
 * identical siblings at 0x0200af08..0x0200b178. Caller convention
 * matches a per-subsystem dispatcher table.
 *
 *     stmdb sp!, {r3, lr}
 *     cmp   r0, #0x0
 *     moveq r0, #0x0
 *     ldmeqia sp!, {r3, pc}
 *     bl    Task_InvokeLocked
 *     mov   r0, #0x1
 *     ldmia sp!, {r3, pc}
 */

extern void Task_InvokeLocked(void *p);

int func_0200af08(void *p) {
    if (p == 0) return 0;
    Task_InvokeLocked(p);
    return 1;
}
