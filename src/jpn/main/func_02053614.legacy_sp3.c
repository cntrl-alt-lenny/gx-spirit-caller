/* func_02053614: return func_0205362c() & 3. sp3 signature.
 *
 *     stmdb sp!, {lr}
 *     sub   sp, sp, #0x4
 *     bl    func_0205362c
 *     and   r0, r0, #0x3
 *     add   sp, sp, #0x4
 *     ldmia sp!, {pc}
 */

extern int func_0205362c(void);

int func_02053614(void) {
    return func_0205362c() & 3;
}
