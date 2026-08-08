/* func_020a5f10: two independent bitfield RMWs on a HW I/O register.
 *
 *     ldr r3, _LIT0            ; r3 = 0x04000204
 *     ldr r2, [r0]
 *     ldrh r1, [r3]
 *     bic r1, r1, #0xc
 *     orr r1, r1, r2, lsl #0x2
 *     strh r1, [r3]
 *     ldrh r1, [r3]
 *     ldr r2, [r0, #0x4]
 *     bic r0, r1, #0x10
 *     orr r0, r0, r2, lsl #0x4
 *     strh r0, [r3]
 *     bx lr
 *
 * Leaf, no stack frame -- .legacy.c per C-71. Register genuinely
 * volatile: 2nd RMW re-reads the register fresh rather than reusing
 * the just-stored value. Returns the 2nd RMW's computed value.
 *
 * Register-alloc note: both RMWs load the struct field before the
 * register in EITHER OR-operand order (that instruction order never
 * changed), but writing the OR as `(field << N) | (*reg & ~mask)`
 * -- shifted term first, syntactically -- was needed to land the
 * struct-field load and the bic result in orig's r2/r1 pairing;
 * `(*reg & ~mask) | (field << N)` compiles to the identical
 * instructions with r1/r2 swapped throughout. Pure expression
 * operand-order effect on register numbering, no instruction-order
 * or logic change either way.
 */

struct s_020a5f10 {
    int f0;
    int f4;
};

int func_020a5f10(struct s_020a5f10 *self) {
    volatile unsigned short *reg = (volatile unsigned short *)0x04000204;
    int v;

    *reg = (self->f0 << 2) | (*reg & ~0xc);
    v = (self->f4 << 4) | (*reg & ~0x10);
    *reg = v;
    return v;
}
