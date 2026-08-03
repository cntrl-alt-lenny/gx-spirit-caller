/* func_02068d24: if func_0206b778(obj+0x4c) != -1, call
 * func_0206b670(obj+0x4c). Ships as asm -- natural C reached 36% but
 * mwcc scheduled the -1 comparison and register save/restore
 * differently around the early-return branch.
 */

extern int func_0206b778(void);
extern void func_0206b670(void);

asm void func_02068d24(void) {
    nofralloc
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x4c
    bl func_0206b778
    mov r1, r0
    mvn r0, #0x0
    cmp r1, r0
    ldmeqia sp!, {r4, pc}
    add r0, r4, #0x4c
    bl func_0206b670
    ldmia sp!, {r4, pc}
}
