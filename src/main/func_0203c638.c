/* func_0203c638: twin of func_0203c620 with offset 0x88.
 *
 *     stmdb sp!, {r3, lr}
 *     cmp   r0, #0x0
 *     ldmeqia sp!, {r3, pc}
 *     add   r0, r0, #0x88
 *     bl    func_0203c5e4
 *     ldmia sp!, {r3, pc}
 */

extern int func_0203c5e4(void *p);

int func_0203c638(char *p) {
    if (p == 0) return (int)p;
    return func_0203c5e4(p + 0x88);
}
