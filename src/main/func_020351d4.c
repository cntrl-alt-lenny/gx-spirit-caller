/* func_020351d4: 5-argument pass-through forwarder — all args in r0..r3
 * plus one stack arg, forwarded verbatim to func_02034d58.
 *
 *     stmdb sp!, {r3, lr}           ; push r3 (saved) + lr; sp -= 8
 *     ldr   ip, [sp, #0x8]           ; load caller's stack arg (was
 *                                    ; arg 5 at [sp_caller, #0]; after
 *                                    ; our push that's [sp_here, #8])
 *     str   ip, [sp, #0x0]           ; store it at [sp, #0] for the
 *                                    ; callee's arg 5 slot
 *     bl    func_02034d58            ; r0..r3 pass through unchanged
 *     ldmia sp!, {r3, pc}
 *
 * 5 ARM instructions, 0x14 bytes.
 *
 * The stack-arg shuffle is mwcc's forwarder pattern for N-arg calls
 * where N > 4: adjust the stack-arg offset by the current frame's
 * push size. Here `stmdb {r3, lr}` pushes 8 bytes, so the caller's
 * stack arg moves from [sp+0] to [sp+8] from our frame's perspective.
 */

extern void func_02034d58(int a, int b, int c, int d, int e);

void func_020351d4(int a, int b, int c, int d, int e) {
    func_02034d58(a, b, c, d, e);
}
