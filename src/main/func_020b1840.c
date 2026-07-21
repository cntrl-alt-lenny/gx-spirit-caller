/* func_020b1840: spills all 4 incoming arg registers to the stack
 * then reloads only the 2nd to mask its sign bit -- the kind of
 * whole-arg-block spill a compiler emits when a parameter's address
 * is taken, not something a plain `return b & 0x80000000;` reaches
 * (that would just mask r1 directly, no stack round-trip). Ships as
 * asm rather than guess the exact source shape that forces the spill.
 */

asm void func_020b1840(void) {
    nofralloc
    stmdb   sp!, {r0, r1, r2, r3}
    ldr     r0, [sp, #0x4]
    and     r0, r0, #0x80000000
    add     sp, sp, #0x10
    bx      lr
}
