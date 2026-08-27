/* func_02053440: returns self if func_02053460(self) is true, else 0.
 * Ships as asm: documented wall P-9 (docs/research/codegen-walls.md) --
 * the `mvnNE rN,#0`-then-`andne` mask idiom for `cond ? -1 : 0` has no
 * source-form C reproduction (90-compile 6-variant x 15-SP sweep in
 * brief 103/105 found none; mwcc always collapses to `mov + rsb` or
 * eliminates the AND as identity, confirmed independently across 4
 * more restructuring attempts this round). Permuter exploration also
 * plateaued (score 305, never 0). Fused pop{regs,pc}, no sub sp.
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0
 *     bl    func_02053460
 *     cmp   r0, #0x0
 *     mvnne r0, #0x0
 *     andne r0, r4, r0
 *     moveq r0, #0x0
 *     ldmia sp!, {r4, pc}
 */

extern int func_02053460(void *self);

asm void *func_02053440(void *self) {
    nofralloc
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02053460
    cmp r0, #0x0
    mvnne r0, #0x0
    andne r0, r4, r0
    moveq r0, #0x0
    ldmia sp!, {r4, pc}
}
