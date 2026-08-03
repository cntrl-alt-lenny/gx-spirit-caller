/* func_02032724: guard+clear on a flag at obj+0x1fc+0xc80. Ships as
 * asm -- mwcc keeps the raw `obj` pointer alive across the
 * func_02032e6c() call and folds both offsets into a single +0xe7c
 * immediate at each load/store, while the original instead computes
 * and preserves the partially-offset obj+0x1fc pointer across the
 * call (a genuine callee-saved register, per the push/pop of r4) and
 * applies only +0xc80 at each access. Several natural-C forms were
 * tried (flat pointer arithmetic, an explicit intermediate reused
 * before/after the call, a nested-struct member access, a `volatile`
 * intermediate to force materialization) -- none reproduced the
 * original's specific choice of *which* partial sum to keep live
 * across the call; `volatile` came closest structurally but forced an
 * actual stack spill instead of a register hold, diverging further.
 */

extern void func_02032e6c(void);

asm void func_02032724(void) {
    nofralloc
    stmdb sp!, {r4, lr}
    add r4, r0, #0x1fc
    ldr r1, [r4, #0xc80]
    cmp r1, #0x0
    ldmeqia sp!, {r4, pc}
    bl func_02032e6c
    mov r0, #0x0
    str r0, [r4, #0xc80]
    ldmia sp!, {r4, pc}
}
