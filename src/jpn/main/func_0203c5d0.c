/* func_0203c5d0: null-guarded offset call into func_0203c594
 * with arg + 0x94.
 *
 *     stmdb sp!, {r3, lr}
 *     cmp   r0, #0x0
 *     ldmeqia sp!, {r3, pc}
 *     add   r0, r0, #0x94
 *     bl    func_0203c594
 *     ldmia sp!, {r3, pc}
 */

extern int func_0203c594(void *p);

int func_0203c5d0(char *p) {
    if (p == 0) return (int)p;
    return func_0203c594(p + 0x94);
}
