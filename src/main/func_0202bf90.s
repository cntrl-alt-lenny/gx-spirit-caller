; func_0202bf90 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_PostLocked
        .extern data_020c6ac8
        .extern data_0219a93c
        .extern func_0202b0b4
        .extern func_02038ad4
        .extern func_020928e8
        .extern func_02097ea4
        .extern func_02097ff0
        .extern func_02098038
        .extern func_02098388
        .global func_0202bf90
        .arm
func_0202bf90:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x48
    bl func_0202b0b4
    ldr r1, _LIT0
    ldr r1, [r1]
    ldr r1, [r1, #0x2c]
    add r2, r1, r0, lsl #0x2
    ldr r4, [r1, r0, lsl #0x2]
    ldr r1, [r2, #0x4]
    add r0, sp, #0x0
    sub r5, r1, r4
    bl func_02098388
    ldr r1, _LIT1
    add r0, sp, #0x0
    bl func_02098038
    mov r0, r5
    mov r1, #0x4
    mov r2, #0x0
    bl Task_PostLocked
    mov r1, r4
    mov r4, r0
    add r0, sp, #0x0
    mov r2, #0x0
    bl func_02097ea4
    add r0, sp, #0x0
    mov r1, r4
    mov r2, r5
    bl func_02038ad4
    add r0, sp, #0x0
    bl func_02097ff0
    mov r1, r5
    mov r0, r4
    bl func_020928e8
    mov r0, r4
    add sp, sp, #0x48
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_0219a93c
_LIT1: .word data_020c6ac8
