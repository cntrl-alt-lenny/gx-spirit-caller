; func_0202c6ac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_PostLocked
        .extern data_020c6b74
        .extern func_0202c528
        .extern func_02038ad4
        .extern func_020928e8
        .extern func_02097ea4
        .extern func_02097ff0
        .extern func_02098038
        .extern func_02098388
        .global func_0202c6ac
        .arm
func_0202c6ac:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x48
    bl func_0202c528
    ldr r1, _LIT0
    mul r5, r0, r1
    add r0, sp, #0x0
    bl func_02098388
    ldr r1, _LIT1
    add r0, sp, #0x0
    bl func_02098038
    ldr r0, _LIT0
    mov r1, #0x4
    mov r2, #0x0
    bl Task_PostLocked
    mov r4, r0
    mov r1, r5
    add r0, sp, #0x0
    mov r2, #0x0
    bl func_02097ea4
    ldr r2, _LIT0
    add r0, sp, #0x0
    mov r1, r4
    bl func_02038ad4
    add r0, sp, #0x0
    bl func_02097ff0
    ldr r1, _LIT0
    mov r0, r4
    bl func_020928e8
    mov r0, r4
    add sp, sp, #0x48
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00001024
_LIT1: .word data_020c6b74
