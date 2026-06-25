; func_0202c658 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_PostLocked
        .extern data_020c6a94
        .extern func_0202c4d4
        .extern func_02038a84
        .extern func_02092800
        .extern func_02097db0
        .extern func_02097efc
        .extern func_02097f44
        .extern func_02098294
        .global func_0202c658
        .arm
func_0202c658:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x48
    bl func_0202c4d4
    ldr r1, _LIT0
    mul r5, r0, r1
    add r0, sp, #0x0
    bl func_02098294
    ldr r1, _LIT1
    add r0, sp, #0x0
    bl func_02097f44
    ldr r0, _LIT0
    mov r1, #0x4
    mov r2, #0x0
    bl Task_PostLocked
    mov r4, r0
    mov r1, r5
    add r0, sp, #0x0
    mov r2, #0x0
    bl func_02097db0
    ldr r2, _LIT0
    add r0, sp, #0x0
    mov r1, r4
    bl func_02038a84
    add r0, sp, #0x0
    bl func_02097efc
    ldr r1, _LIT0
    mov r0, r4
    bl func_02092800
    mov r0, r4
    add sp, sp, #0x48
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00001024
_LIT1: .word data_020c6a94
