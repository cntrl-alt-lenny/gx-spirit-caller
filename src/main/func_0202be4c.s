; func_0202be4c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_PostLocked
        .extern data_020c6a9c
        .extern data_02105eb8
        .extern func_0202b0b4
        .extern func_02038ad4
        .extern func_020928e8
        .extern func_02097ea4
        .extern func_02097ff0
        .extern func_02098038
        .extern func_02098388
        .global func_0202be4c
        .arm
func_0202be4c:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x48
    bl func_0202b0b4
    mov r6, r0
    ldr r8, _LIT0
    cmp r6, #0x0
    movgt r7, #0x20c
    movle r7, #0x0
    mul r5, r6, r8
    cmp r6, #0x0
    add r0, sp, #0x0
    movle r8, #0x640
    bl func_02098388
    ldr r1, _LIT1
    add r0, sp, #0x0
    bl func_02098038
    mov r0, r8
    mov r1, #0x4
    mov r2, #0x0
    bl Task_PostLocked
    mov r4, r0
    add r1, r5, r7
    add r0, sp, #0x0
    mov r2, #0x0
    bl func_02097ea4
    add r0, sp, #0x0
    mov r1, r4
    mov r2, r8
    bl func_02038ad4
    add r0, sp, #0x0
    bl func_02097ff0
    mov r1, r8
    mov r0, r4
    bl func_020928e8
    ldr r2, _LIT2
    mov r0, r4
    ldrb r1, [r2, r6]
    orr r1, r1, #0x2
    strb r1, [r2, r6]
    add sp, sp, #0x48
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word 0x00000434
_LIT1: .word data_020c6a9c+0x4
_LIT2: .word data_02105eb8
