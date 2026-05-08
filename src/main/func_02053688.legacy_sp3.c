/* func_02053688: return func_020536a0() & 3. sp3 signature.
 *
 *     stmdb sp!, {lr}
 *     sub   sp, sp, #0x4
 *     bl    func_020536a0
 *     and   r0, r0, #0x3
 *     add   sp, sp, #0x4
 *     ldmia sp!, {pc}
 */

extern int func_020536a0(void);

int func_02053688(void) {
    return func_020536a0() & 3;
}
