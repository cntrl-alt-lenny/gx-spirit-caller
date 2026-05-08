/* func_020627f0: 5-arg pass-through wrapper. Repacks arg5 from
 * caller's stack slot into the callee's stack slot. sp3
 * signature.
 *
 *     stmdb sp!, {lr}
 *     sub   sp, sp, #0x4
 *     ldr   ip, [sp, #0x8]                ; caller's arg5 slot
 *     str   ip, [sp, #0x0]                ; callee's arg5 slot
 *     bl    func_02064ae4
 *     add   sp, sp, #0x4
 *     ldmia sp!, {pc}
 */

extern int func_02064ae4(int a, int b, int c, int d, int e);

int func_020627f0(int a, int b, int c, int d, int e) {
    return func_02064ae4(a, b, c, d, e);
}
