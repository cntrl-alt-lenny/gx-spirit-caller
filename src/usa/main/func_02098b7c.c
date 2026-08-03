/* func_02098b7c: copies {&data_021a8254, p->field18} into a 2-word
 * output struct, via a (dead but faithfully reproduced) stack temp.
 * Ships as asm -- natural C reached 50% (right size, same fields) but
 * mwcc ordered the temp-then-output stores differently.
 */

extern char data_021a8254[];

asm void func_02098b7c(void) {
    nofralloc
    sub sp, sp, #0x8
    ldr r2, =data_021a8254
    str r2, [sp]
    ldr r1, [r1, #0x18]
    str r1, [sp, #0x4]
    str r2, [r0]
    str r1, [r0, #0x4]
    add sp, sp, #0x8
    bx lr
}
